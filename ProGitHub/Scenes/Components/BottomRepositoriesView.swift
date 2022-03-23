//
//  BottomRepositoriesView.swift
//  ProGitHub
//
//  Created by Rafael Nunes Rios on 3/19/22.
//

import UIKit

class BottomRepositoriesView: UIView {
    
    private var stackView: UIStackView?
    private var forkView: IconPlusLabelView?
    private var starView: IconPlusLabelView?
    
    private var totalForks: Int?
    private var totalStars: Int?
    
    init(totalForks: Int, totalStars: Int) {
        self.totalForks = totalForks
        self.totalStars = totalStars
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup() {
        buildComponents()
        buildHierarchy()
        buildUI()
    }
    private func buildComponents() {
        stackView = UIStackView()
        let forkImage = UIImage(named: "fork_icon")
        let starImage = UIImage(systemName: "star.fill")
        forkView = IconPlusLabelView(iconImage: forkImage ?? UIImage(), iconDetail: String(totalForks ?? 0))
        starView = IconPlusLabelView(iconImage: starImage ?? UIImage(), iconDetail: String(totalStars ?? 0))
    }
    
    private func buildHierarchy() {
        guard let _stackView = stackView, let _forkView = forkView, let _starView = starView else { return }
        addSubview(_stackView)
        stackView?.addArrangedSubview(_forkView)
        stackView?.addArrangedSubview(_starView)
    }
    
    private func buildUI() {
        setupStackView()
        setupForkView()
        setupStarView()
    }
    
    private func setupStackView() {
        stackView?.translatesAutoresizingMaskIntoConstraints = false
        stackView?.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView?.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView?.axis = .horizontal
        stackView?.distribution = .fill
        stackView?.alignment = .fill
        stackView?.spacing = 16
    }
    
    private func setupForkView() {
        forkView?.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupStarView() {
        starView?.translatesAutoresizingMaskIntoConstraints = false
    }
}
