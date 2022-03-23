//
//  UIFont+Extension.swift
//  ProGitHub
//
//  Created by Rafael Nunes Rios on 3/19/22.
//

import UIKit

extension UIFont {
    static public func fredoka(size: CGFloat, fontStyle font: CustomFonts) -> UIFont {
        guard let fredoka = UIFont(name: font.rawValue, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return fredoka
    }
}
