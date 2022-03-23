//
//  LoadingView.swift
//  ProGitHub
//
//  Created by Rafael Nunes Rios on 3/19/22.
//

import UIKit
import Lottie

public class AnimatedView: UIView {
    
    private var animatedView = AnimationView(name: "git_loading")

    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup() {
        self.addSubview(animatedView)
        animatedView.contentMode = .scaleAspectFit
        setupAnimatedView()
    }
    
    private func setupAnimatedView() {
        animatedView.translatesAutoresizingMaskIntoConstraints = false
        animatedView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        animatedView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        animatedView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        animatedView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    public func playAnimation() {
        animatedView.loopMode = .loop
        animatedView.play()
    }
    
    public func stopAnimation() {
        animatedView.stop()
    }
}
