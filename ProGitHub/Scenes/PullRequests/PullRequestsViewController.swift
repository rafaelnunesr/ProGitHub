//
//  PullRequestsViewController.swift
//  ProGitHub
//
//  Created by Rafael Nunes Rios on 3/20/22.
//

import UIKit
import RxSwift
import Data
import Infra

class PullRequestsViewController: BaseViewController {

    private var tableView = UITableView()
    private let disposeBag = DisposeBag()
    
    private var viewModel: PullRequestsViewModel
    private var tableViewDataSource: PullRequestsTableViewDataSource?
    
    private var user: String
    private var repository: String
    
    init(viewModel: PullRequestsViewModel, user: String, repository: String) {
        self.viewModel = viewModel
        self.user = user
        self.repository = repository
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeRequest()
        setupViews()
        title = repository
    }

    fileprivate func makeRequest() {
        showLoadingView()
        viewModel.fetchPullRequests(user: user, repository: repository)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] _ in
                    guard let self = self else { return }
                    self.hiddenLoadingView()
                    self.tableViewDataSource?.pullRequestList = self.viewModel.pullRequests?.pullRequests ?? []
                },
                onError: { [weak self] error in
                    guard let self = self else { return }
                    self.hiddenLoadingView()
                    self.alertUser(error: error)
                }).disposed(by: disposeBag)
    }

    private func setupViews() {
        view.addSubview(tableView)
        tableViewDataSource = PullRequestsTableViewDataSource(tableView: tableView,
                                                      delegate: self)
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

extension PullRequestsViewController: TableViewDelegate {
    func showDetail(_ detail: String) {
        guard let url = URL(string: detail) else { return }
        UIApplication.shared.open(url)
    }
}
