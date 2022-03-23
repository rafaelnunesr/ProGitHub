//
//  TextProperties.swift
//  Data
//
//  Created by Rafael Nunes Rios on 3/19/22.
//

import UIKit

public struct LabelModel {
    public let text: String
    public let textColor: UIColor
    public let textSize: CGFloat
    public let fontStyle: CustomFonts
    public let maxNumberOfLines: Int
    public let backgroundColor: UIColor
    
    public init(text: String,
                textColor: UIColor,
                textSize: CGFloat,
                fontStyle: CustomFonts,
                maxNumberOfLines: Int,
                backgroundColor: UIColor = .clear) {
        self.text = text
        self.textColor = textColor
        self.textSize = textSize
        self.fontStyle = fontStyle
        self.maxNumberOfLines = maxNumberOfLines
        self.backgroundColor = backgroundColor
    }
}
