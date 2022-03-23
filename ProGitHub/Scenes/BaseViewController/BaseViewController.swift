//
//  BaseViewController.swift
//  ProGitHub
//
//  Created by Rafael Nunes Rios on 3/19/22.
//

import UIKit

class BaseViewController: UIViewController {

    let loadingView = AnimatedView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .customBackgroundColor
        self.setup()
    }
    
    private func setup() {
        view.addSubview(self.loadingView)
        self.setupLoadingView()
        self.navigationController?.navigationBar.titleTextAttributes =
        [NSAttributedString.Key.foregroundColor: UIColor.customBlue,
         NSAttributedString.Key.font: UIFont.fredoka(size: 18, fontStyle: CustomFonts.semiBold)]
        self.navigationController?.navigationBar.backItem?.title = ""
    }
    
    private func setupLoadingView() {
        loadingView.frame = view.frame
        loadingView.backgroundColor = UIColor(white: 0, alpha: 0.2)
        loadingView.isHidden = true
    }
    
    func showLoadingView() {
        view.bringSubviewToFront(loadingView)
        loadingView.isHidden = false
        loadingView.playAnimation()
    }
    
    func hiddenLoadingView() {
        loadingView.stopAnimation()
        loadingView.isHidden = true
    }
    
    func alertUser(error: Error) {
        let alert = UIAlertController(title: "Erro", message: "Algo deu errado. Por favor tente novamente.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}
