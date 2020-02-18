//
//  UserlistPresenter.swift
//  ViperSample
//
//  Created by Singh, Dev on 2020/02/17.
//  Copyright © 2020 Singh, Dev. All rights reserved.
//

import Foundation

class UserlistPresenter: UserListPresentation {
    
    weak var view: UserListView?
    var intractor: UserListUseCase!
    var router: UserListWireFrame!
    
    var userList: [User] = [] {
        didSet {
            if userList.count > 0 {
                view?.showUserListData(userList)
            } else {
                view?.noContentScreen()
            }
        }
    }
    
    func viewDidLoad() {
        intractor.fetchUserList()
    }
}


extension UserlistPresenter : UserListIntreactorOutput {
    func userListFetched(userList: [User]) {
        self.userList = userList
    }
    
    func userListFailed(errorDescription: String) {
        //show no data
    }
}
