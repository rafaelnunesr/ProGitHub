//
//  MenuViewController.swift
//  ProGitHub
//
//  Created by Rafael Nunes Rios on 3/21/22.
//

import UIKit

class MenuViewController: BaseViewController {

    private var tableView = UITableView()
    private var viewModel: MenuViewModel
    private var tableViewDataSource: MenuTableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupViews()
        title = viewModel.title
        viewModel.sanitizeOldCachedImages()
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        tableViewDataSource = MenuTableViewDataSource(tableView: tableView,
                                                      delegate: self)
        tableViewDataSource?.languagesList = viewModel.popularLanguages
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
    }
}

extension MenuViewController: TableViewDelegate {
    func showDetail(_ detail: String) {
        let repository = RepositoriesViewController(viewModel: RepositoriesViewModel(language: detail))
        navigationController?.pushViewController(repository, animated: true)
    }
}
