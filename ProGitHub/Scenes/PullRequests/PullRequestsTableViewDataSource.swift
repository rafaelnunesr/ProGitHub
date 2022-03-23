//
//  PullRequestsTableViewDataSource.swift
//  ProGitHub
//
//  Created by Rafael Nunes Rios on 3/21/22.
//

import UIKit
import Data

class PullRequestsTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var delegate: TableViewDelegate
    private let tableView: UITableView
    public var pullRequestList: [GithubPullRequest] = [] {
        didSet {
            tableView.reloadData()
        }
    }
   
    init(tableView: UITableView, delegate: TableViewDelegate) {
        self.tableView = tableView
        self.delegate = delegate
        super.init()
        setup()
    }
    
    private func setup() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PullRequestTableViewCell.self, forCellReuseIdentifier: PullRequestTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequestList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PullRequestTableViewCell.identifier, for: indexPath) as? PullRequestTableViewCell,
           pullRequestList.count > indexPath.row {
            cell.setup(repositoryTitle: pullRequestList[indexPath.row].title,
                       repositoryDescription: pullRequestList[indexPath.row].description,
                       nickname: pullRequestList[indexPath.row].ownerNickname,
                       repositoryOwnerType: pullRequestList[indexPath.row].repositoryOwnerType,
                       profileImageUrl: pullRequestList[indexPath.row].ownerAvatarUrl)
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if pullRequestList.count > indexPath.row {
            tableView.deselectRow(at: indexPath, animated: true)
            delegate.showDetail(pullRequestList[indexPath.row].pullRequestLink)
        }
    }
}
