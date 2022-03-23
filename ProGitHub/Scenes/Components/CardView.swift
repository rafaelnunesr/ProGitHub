//
//  CardView.swift
//  ProGitHub
//
//  Created by Rafael Nunes Rios on 3/20/22.
//

import UIKit

class CardView: UIView {
 
    private var backView = UIView()
    private let minPadding: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        addSubview(backView)
    }
    
    private func buildUI() {
        backgroundColor = .clear
        setupBackView()
    }
    
    private func setupBackView() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.topAnchor.constraint(equalTo: topAnchor, constant: minPadding).isActive = true
        backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: minPadding).isActive = true
        backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -minPadding).isActive = true
        backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -minPadding).isActive = true

        backView.layer.shadowColor = UIColor.customShadowGray.cgColor
        backView.layer.shadowOpacity = 1
        backView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        backView.layer.shadowRadius = 4
        
        backView.layer.cornerRadius = 8
        backView.backgroundColor = .white
    }
}
