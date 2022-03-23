//
//  ProfileView.swift
//  ProGitHub
//
//  Created by Rafael Nunes Rios on 3/19/22.
//

import UIKit
import Data
import RxSwift
import Infra

class ProfileView: UIView {
    
    private var stackView = UIStackView()
    private var profileImageView = UIImageView()
    private var usernameDetails: TitleAndSubtitleView?
    
    private var cachedImage = CachedImageManager.shared
    private var profileImageUrl: String?
    private var nickname: String?
    private var repositoryOwnerType: String?
    private var imageSize: CGFloat = 40
    private let disposeBag = DisposeBag()
    private var stackViewAxis: NSLayoutConstraint.Axis = .vertical
    
    init(profileImageUrl: String, nickname: String, repositoryOwnerType: String, stackViewAxis: NSLayoutConstraint.Axis = .vertical) {
        self.profileImageUrl = profileImageUrl
        self.nickname = nickname
        self.repositoryOwnerType = repositoryOwnerType
        self.stackViewAxis = stackViewAxis
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
        guard let _nickname = nickname, let _repositoryOwnerType = repositoryOwnerType else { return }
        let name = LabelModel(text: _nickname, textColor: .customBlue, textSize: 14, fontStyle: .semiBold, maxNumberOfLines: 1)
        let ownerType = LabelModel(text: _repositoryOwnerType, textColor: .customLightGray, textSize: 14, fontStyle: .regular, maxNumberOfLines: 1)
        usernameDetails = TitleAndSubtitleView(title: name, subtitle: ownerType)
    }
    
    private func buildHierarchy() {
        guard let _usernameDetails = usernameDetails else { return }
        addSubview(stackView)
        stackView.addArrangedSubview(profileImageView)
        stackView.addArrangedSubview(_usernameDetails)
    }
    
    private func buildUI() {
        setupProfileImage()
        setupStackView()
    }
    
    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.axis = stackViewAxis
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 8
    }
    
    private func setupProfileImage() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        profileImageView.layer.cornerRadius = imageSize / 2
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = .darkGray
        
        guard let _profileImageUrl = profileImageUrl else { return }
        if let imageData = cachedImage.getCachedImage(withUrl: _profileImageUrl) {
            profileImageView.image = UIImage(data: imageData)
        } else {
            ApiService.shared.fetchProfileImage(withUrl: _profileImageUrl)
                .observe(on: MainScheduler.instance)
                .subscribe(onNext: { [weak self] imageData in
                    guard let self = self else { return }
                    self.profileImageView.image = UIImage(data: imageData)
                    self.cachedImage.saveImageData(imageUrl: _profileImageUrl, imageData: imageData)
            }).disposed(by: disposeBag)
        }
    }
}
