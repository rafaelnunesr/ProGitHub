//
//  IconPlusLabelView.swift
//  ProGitHub
//
//  Created by Rafael Nunes Rios on 3/19/22.
//

import UIKit

class IconPlusLabelView: UIView {
    
    private var stackView = UIStackView()
    private var iconImageView = UIImageView()
    private var iconDetailLabel = UILabel()
    
    private var iconImage: UIImage?
    private var iconDetail: String?
    private let iconSize: CGFloat = 20
    
    init(iconImage: UIImage, iconDetail: String) {
        self.iconImage = iconImage
        self.iconDetail = iconDetail
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup() {
        buildHierarchy()
        buildUI()
    }
    
    private func buildHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(iconDetailLabel)
    }
    
    private func buildUI() {
        setupStackView()
        setupIconImageView()
        setupIconLabel()
    }
    
    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 4
    }
    
    private func setupIconImageView() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.widthAnchor.constraint(equalToConstant: iconSize).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: iconSize).isActive = true
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.clipsToBounds = true
        iconImageView.image = iconImage?.withRenderingMode(.alwaysTemplate)
        iconImageView.tintColor = .customOrange
    }
    
    private func setupIconLabel() {
        iconDetailLabel.text = iconDetail
        iconDetailLabel.textColor = .customOrange
        iconDetailLabel.font = .fredoka(size: 14, fontStyle: CustomFonts.semiBold)
    }
}
