//
//  MenuTableViewDataSource.swift
//  ProGitHub
//
//  Created by Rafael Nunes Rios on 3/21/22.
//

import UIKit
import Data

class MenuTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var delegate: TableViewDelegate
    private let tableView: UITableView
    public var languagesList: [String] = [] {
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
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languagesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as? MenuTableViewCell,
           languagesList.count > indexPath.row {
            cell.setup(title: languagesList[indexPath.row],
                       textColor: .customLightGray,
                       font: .fredoka(size: 20,
                       fontStyle: CustomFonts.semiBold))
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if languagesList.count > indexPath.row {
            tableView.deselectRow(at: indexPath, animated: true)
            delegate.showDetail(languagesList[indexPath.row])
        }
    }
}
