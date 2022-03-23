//
//  CachedImageManager.swift
//  Data
//
//  Created by Rafael Nunes Rios on 3/19/22.
//

import Foundation
import RxSwift
import RealmSwift

public class CachedImageManager {
    static public var shared = CachedImageManager()
    private let disposeBag = DisposeBag()

    let realm = try! Realm()
    
    private var cachedImages: Results<CachedImage> {
        return realm.objects(CachedImage.self)
    }
    
    private func timeInMiliseconds(time: Date) -> Int64 {
        return Int64(time.timeIntervalSince1970 * 1000)
    }
    
    private func timeToDelete(imageDate: Date) -> Bool {
        let nowInMiliseconds = timeInMiliseconds(time: Date())
        let imageCreationTimeInMiliseconds = timeInMiliseconds(time: imageDate)
        let intervalTimeInHours = 24
        let intervalTimeInMiliseconds = intervalTimeInHours * 3600 * 1000
        let differenceBetweenCreationAndNow = nowInMiliseconds - imageCreationTimeInMiliseconds
        
        if differenceBetweenCreationAndNow > intervalTimeInMiliseconds {
            return true
        }
        return false
    }
    
    public func saveImageData(imageUrl: String, imageData: Data) {
        let imageToCache = CachedImage()
        imageToCache.createdAt = Date()
        imageToCache.imageUrl = imageUrl
        imageToCache.imageData = imageData
        save(imageToCache)
    }
    
    public func sanitizeOldCachedImages() {
        for savedImage in cachedImages {
            if timeToDelete(imageDate: savedImage.createdAt) {
                delete(savedImage)
            }
        }
    }
    
    public func getCachedImage(withUrl url: String) -> Data? {
        if let image = self.cachedImages.filter({ $0.imageUrl == url }).first?.imageData {
            return image
        }
        return nil
    }

    fileprivate func save(_ cachedImage: CachedImage) {
        DispatchQueue.main.async {
            do {
                try self.realm.write {
                    self.realm.add(cachedImage)
                    debugPrint("image saved")
                }
            }catch {
                debugPrint("Error saving context, \(error.localizedDescription)")
            }
        }
    }
    
    fileprivate func delete(_ cachedImage: CachedImage) {
        DispatchQueue.main.async {
            do {
                try self.realm.write {
                    self.realm.delete(cachedImage)
                    debugPrint("image deleted")
                }
            }catch {
                debugPrint("Error deleting context, \(error.localizedDescription)")
            }
        }
    }
}
