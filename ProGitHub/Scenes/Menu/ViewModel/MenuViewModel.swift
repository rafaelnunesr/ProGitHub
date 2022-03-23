//
//  MenuViewModel.swift
//  ProGitHub
//
//  Created by Rafael Nunes Rios on 3/21/22.
//

import Foundation
import Data

public class MenuViewModel {
    
    private let cachedImages = CachedImageManager.shared
    
    public var title = "Programming Languages"
    
    private let languages = ["JavaScript", "Shell", "Node",
                             "Python", "HTML", "CSS",
                             "C++", "TypeScript", "Rust",
                             "Scheme","Java", "Kotlin",
                             "C#", "Perl", "PHP",
                             "Scala", "Swift", "MATLAB",
                             "SQL", "R", "Go",
                             "Ruby","C", "VBA",
                             "Lua", "Dart", "Objective-C"]
    
    public var popularLanguages: [String] {
        return languages.sorted()
    }
    
    public func sanitizeOldCachedImages() {
        cachedImages.sanitizeOldCachedImages()
    }
}
