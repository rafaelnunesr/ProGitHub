//
//  RepositoriesTableViewDataSource.swift
//  ProGitHub
//
//  Created by Rafael Nunes Rios on 3/21/22.
//

import UIKit
import Data

class RepositoriesTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var delegate: NavigationTableViewDelegate
    private let tableView: UITableView
    public var repositoryList: [GithubRepository] = [] {
        didSet {
            tableView.reloadData()
        }
    }
   
    init(tableView: UITableView, delegate: NavigationTableViewDelegate) {
        self.tableView = tableView
        self.delegate = delegate
        super.init()
        setup()
    }
    
    private func setup() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: RepositoryTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryTableViewCell.identifier, for: indexPath) as? RepositoryTableViewCell,
           repositoryList.count > indexPath.row {
            cell.setup(repositoryTitle: repositoryList[indexPath.row].name,
                       repositoryDescription: repositoryList[indexPath.row].description,
                       repositoryForksCount: repositoryList[indexPath.row].forks,
                       repositoryStarsCount: repositoryList[indexPath.row].stars,
                       nickname: repositoryList[indexPath.row].ownerNickname,
                       repositoryOwnerType: repositoryList[indexPath.row].repositoryOwnerType,
                       profileImageUrl: repositoryList[indexPath.row].ownerUserAvatarUrl)
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if repositoryList.count > indexPath.row {
            tableView.deselectRow(at: indexPath, animated: true)
            delegate.showDetail(repo: repositoryList[indexPath.row])
        }
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastIndex = repositoryList.count - 1
        if indexPath.row == lastIndex {
            delegate.fetchNewData()
        }
    }
}
