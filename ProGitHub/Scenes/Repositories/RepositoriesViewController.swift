//
//  RepositoriesViewController.swift
//  ProGitHub
//
//  Created by Rafael Nunes Rios on 3/19/22.
//

import UIKit
import Data
import Infra
import RxSwift

class RepositoriesViewController: BaseViewController {

    private var tableView = UITableView()
    private var viewModel: RepositoriesViewModel
    private var tableViewDataSource: RepositoriesTableViewDataSource?
    private let disposeBag = DisposeBag()
    
    init(viewModel: RepositoriesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Github \(viewModel.selectedLanguage) Repositories"
        makeRequests(page: 1)
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        tableViewDataSource = RepositoriesTableViewDataSource(tableView: tableView,
                                                              delegate: self)
        setupTableView()
    }
    
    fileprivate func makeRequests(page: Int) {
        showLoadingView()
        viewModel.fetchRepositories(page: page)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] _ in
                    guard let self = self else { return }
                    self.hiddenLoadingView()
                    self.tableViewDataSource?.repositoryList = self.viewModel.repositories
                },
                onError: { [weak self] error in
                    guard let self = self else { return }
                    self.hiddenLoadingView()
                    self.alertUser(error: error)
                }).disposed(by: disposeBag)
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

extension RepositoriesViewController: NavigationTableViewDelegate {
    func fetchNewData() {
        makeRequests(page: viewModel.lastPageCalled + 1)
    }

    func showDetail(repo: GithubRepository) {
        let pullRepoViewController = PullRequestsViewController(viewModel: PullRequestsViewModel(),
                                                                user: repo.ownerNickname,
                                                                repository: repo.name)
        navigationController?.pushViewController(pullRepoViewController, animated: true)
    }
}
