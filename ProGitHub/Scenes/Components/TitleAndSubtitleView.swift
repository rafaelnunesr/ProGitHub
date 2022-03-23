//
//  TitleAndSubtitleView.swift
//  ProGitHub
//
//  Created by Rafael Nunes Rios on 3/19/22.
//

import UIKit
import Data

public class TitleAndSubtitleView: UIView {
    
    private var stackView = UIStackView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    
    private var title: LabelModel?
    private var subtitle: LabelModel?
    
    init(title: LabelModel, subtitle: LabelModel) {
        self.title = title
        self.subtitle = subtitle
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
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
    }
    
    private func buildUI() {
        setupStackView()
        setupTitleLabel()
        setupDescriptionLabel()
    }
    
    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 4
    }
    
    private func setupTitleLabel() {
        guard let _title = title else { return }
        titleLabel.font = .fredoka(size: _title.textSize,
                                   fontStyle: _title.fontStyle)
        titleLabel.textColor = _title.textColor
        titleLabel.numberOfLines = _title.maxNumberOfLines
        titleLabel.text = _title.text
        titleLabel.backgroundColor = _title.backgroundColor
        titleLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func setupDescriptionLabel() {
        guard let _subtitle = subtitle else { return }
        subtitleLabel.font = .fredoka(size: _subtitle.textSize,
                                              fontStyle: _subtitle.fontStyle)
        subtitleLabel.textColor = _subtitle.textColor
        subtitleLabel.numberOfLines = _subtitle.maxNumberOfLines
        subtitleLabel.text = _subtitle.text
        subtitleLabel.backgroundColor = _subtitle.backgroundColor
    }
}
