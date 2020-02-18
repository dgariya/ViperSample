//
//  ViewController.swift
//  ViperSample
//
//  Created by Singh, Dev on 2020/02/03.
//  Copyright © 2020 Singh, Dev. All rights reserved.
//

import UIKit

class UserListViewController: UITableViewController {
    
    var presenter: UserListPresentation!
    var userList: [User] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = Constants.Titles.userListTitle
        UserListRouter.assembleModule(viewRef: self)
        presenter.viewDidLoad()
    }
    
    // MARK: - Table View
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = userList[indexPath.row].name
        return cell
    }
    
}

extension UserListViewController: UserListView {
    
    func noContentScreen() {
        //show no data screen
    }
    
    func showUserListData(_ userList: [User]) {
        self.userList = userList
    }
}

