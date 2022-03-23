//
//  MenuTableViewCell.swift
//  ProGitHub
//
//  Created by Rafael Nunes Rios on 3/21/22.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    public static let identifier = "MenuTableViewCell"
    
    private var cardView = CardView()
    private var titleLabel = UILabel()
    
    private let minPadding: CGFloat = 8
    private let maxPadding: CGFloat = 16
    
    private var cellTitle: String?
    private var cellFont: UIFont?
    private var cellTextColor: UIColor?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func setup(title: String, textColor: UIColor, font: UIFont) {
        self.cellTitle = title
        self.cellTextColor = textColor
        self.cellFont = font
        buildHierarchy()
        buildUI()
        backgroundColor = .clear
    }
    
    private func buildHierarchy() {
        addSubview(cardView)
        cardView.addSubview(titleLabel)
    }
    
    private func buildUI() {
        setupBackView()
        setupTitleLabel()
    }
    
    private func setupBackView() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cardView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        cardView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.text = cellTitle
        titleLabel.font = cellFont
        titleLabel.textColor = cellTextColor
    }
}
