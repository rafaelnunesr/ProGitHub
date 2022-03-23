//
//  PullRequestTableViewCell.swift
//  ProGitHub
//
//  Created by Rafael Nunes Rios on 3/20/22.
//

import UIKit
import Data

class PullRequestTableViewCell: UITableViewCell {

    public static var identifier = "PullRequestTableViewCell"
    
    private var cardView = CardView()
    private var repositoryNameAndDescriptionView: TitleAndSubtitleView?
    private var profileView: ProfileView?
    
    private let minPadding: CGFloat = 8
    private let maxPadding: CGFloat = 16
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setup(repositoryTitle: String,
                      repositoryDescription: String,
                      nickname: String,
                      repositoryOwnerType: String,
                      profileImageUrl: String) {
        
        let repoTitle = LabelModel(text: repositoryTitle, textColor: .customBlue, textSize: 18, fontStyle: .bold, maxNumberOfLines: 0)
        let repoDescription = LabelModel(text: repositoryDescription, textColor: .customDarkGray, textSize: 14, fontStyle: .regular, maxNumberOfLines: 3)
        repositoryNameAndDescriptionView = TitleAndSubtitleView(title: repoTitle, subtitle: repoDescription)
        
        profileView = ProfileView(profileImageUrl: profileImageUrl, nickname: nickname, repositoryOwnerType: repositoryOwnerType, stackViewAxis: .horizontal)
        
        buildHierarchy()
        buildUI()
        backgroundColor = .clear
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        repositoryNameAndDescriptionView?.removeFromSuperview()
        profileView?.removeFromSuperview()
    }

    private func buildHierarchy() {
        guard let _repositoryNameAndDescriptionView = repositoryNameAndDescriptionView,
              let _profileView = profileView
        else { return }
        addSubview(cardView)
        cardView.addSubview(_repositoryNameAndDescriptionView)
        cardView.addSubview(_profileView)
    }
    
    private func buildUI() {
        setupBackView()
        setupTitleAndSubtitleView()
        setupProfileView()
    }
    
    private func setupBackView() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cardView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        cardView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func setupTitleAndSubtitleView() {
        guard let _repositoryNameAndDescriptionView = repositoryNameAndDescriptionView else { return }
        _repositoryNameAndDescriptionView.translatesAutoresizingMaskIntoConstraints = false
        _repositoryNameAndDescriptionView.topAnchor.constraint(equalTo: topAnchor, constant: maxPadding).isActive = true
        _repositoryNameAndDescriptionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: maxPadding).isActive = true
        _repositoryNameAndDescriptionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -maxPadding).isActive = true
        _repositoryNameAndDescriptionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
    }
    
    private func setupProfileView() {
        guard let _profileView = profileView, let _repositoryNameAndDescriptionView = repositoryNameAndDescriptionView else { return }
        _profileView.translatesAutoresizingMaskIntoConstraints = false
        _profileView.topAnchor.constraint(equalTo: _repositoryNameAndDescriptionView.bottomAnchor, constant: minPadding).isActive = true
        _profileView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: maxPadding).isActive = true
        _profileView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -maxPadding).isActive = true
        _profileView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -maxPadding).isActive = true
    }
}
