//
//  RepositoryTableViewCell.swift
//  ProGitHub
//
//  Created by Rafael Nunes Rios on 3/19/22.
//

import UIKit
import Data

class RepositoryTableViewCell: UITableViewCell {

    static let identifier = "RepositoryTableViewCell"
    
    private var cardView = CardView()
    private var repositoryNameAndDescriptionView: TitleAndSubtitleView?
    private var profileView: ProfileView?
    private var bottomView: BottomRepositoriesView?
    
    private let minPadding: CGFloat = 8
    private let maxPadding: CGFloat = 16
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setup(repositoryTitle: String,
                      repositoryDescription: String,
                      repositoryForksCount: Int,
                      repositoryStarsCount: Int,
                      nickname: String,
                      repositoryOwnerType: String,
                      profileImageUrl: String) {
        
        let repoTitle = LabelModel(text: repositoryTitle, textColor: .customBlue, textSize: 18, fontStyle: .bold, maxNumberOfLines: 0)
        let repoDescription = LabelModel(text: repositoryDescription, textColor: .customDarkGray, textSize: 14, fontStyle: .regular, maxNumberOfLines: 3)
        repositoryNameAndDescriptionView = TitleAndSubtitleView(title: repoTitle, subtitle: repoDescription)
        
        profileView = ProfileView(profileImageUrl: profileImageUrl, nickname: nickname, repositoryOwnerType: repositoryOwnerType)
        bottomView = BottomRepositoriesView(totalForks: repositoryForksCount, totalStars: repositoryStarsCount)
        
        buildHierarchy()
        buildUI()
        backgroundColor = .clear
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        repositoryNameAndDescriptionView?.removeFromSuperview()
        profileView?.removeFromSuperview()
        bottomView?.removeFromSuperview()
    }
    
    private func buildHierarchy() {
        guard let _repositoryNameAndDescriptionView = repositoryNameAndDescriptionView,
              let _profileView = profileView,
              let _bottomView = bottomView
        else { return }
        addSubview(cardView)
        cardView.addSubview(_repositoryNameAndDescriptionView)
        cardView.addSubview(_profileView)
        cardView.addSubview(_bottomView)
    }
    
    private func buildUI() {
        setupBackView()
        setupTitleAndSubtitleView()
        setupProfileView()
        setupBottomView()
    }
    
    private func setupBackView() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cardView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        cardView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func setupTitleAndSubtitleView() {
        guard let _repositoryNameAndDescriptionView = repositoryNameAndDescriptionView, let _profileView = profileView else { return }
        _repositoryNameAndDescriptionView.translatesAutoresizingMaskIntoConstraints = false
        _repositoryNameAndDescriptionView.topAnchor.constraint(equalTo: topAnchor, constant: maxPadding).isActive = true
        _repositoryNameAndDescriptionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: maxPadding).isActive = true
        _repositoryNameAndDescriptionView.trailingAnchor.constraint(equalTo: _profileView.leadingAnchor, constant: -maxPadding).isActive = true

    }
    
    private func setupProfileView() {
        guard let _profileView = profileView, let _bottomView = bottomView else { return }
        _profileView.translatesAutoresizingMaskIntoConstraints = false
        _profileView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -maxPadding).isActive = true
        _profileView.topAnchor.constraint(equalTo: topAnchor, constant: maxPadding).isActive = true
        _profileView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
        _profileView.bottomAnchor.constraint(equalTo: _bottomView.topAnchor, constant: minPadding).isActive = true
    }
    
    private func setupBottomView() {
        guard let _bottomView = bottomView else { return }
        _bottomView.translatesAutoresizingMaskIntoConstraints = false
        _bottomView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: maxPadding).isActive = true
        _bottomView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -maxPadding).isActive = true
        _bottomView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -maxPadding).isActive = true
        _bottomView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
    }
}
