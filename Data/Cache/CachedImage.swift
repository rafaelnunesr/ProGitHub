//
//  CachedImage.swift
//  Data
//
//  Created by Rafael Nunes Rios on 3/19/22.
//

import Foundation
import RealmSwift

public class CachedImage: Object {
    @objc dynamic var imageUrl: String = ""
    @objc dynamic var imageData: Data = Data()
    @objc dynamic var createdAt: Date = Date()
}
