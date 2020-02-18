//
//  Protocols.swift
//  ViperSample
//
//  Created by Singh, Dev on 2020/02/17.
//  Copyright © 2020 Singh, Dev. All rights reserved.
//

import UIKit

protocol UserListView: class {//view to confirm
    var presenter: UserListPresentation! {get set}
    func noContentScreen()
    func showUserListData(_ userList: [User])
}

protocol UserListPresentation: class { //Presenter to confirm
    var view: UserListView? {get set}
    var intractor: UserListUseCase! {get set}
    var router: UserListWireFrame! {get set}
    
    func viewDidLoad()
}

protocol UserListUseCase: class {//Fetching from server, intracter to confirm
    var output: UserListIntreactorOutput!{get set}
    func fetchUserList()
}

protocol UserListIntreactorOutput: class { // intreactor to send the output
    func userListFetched(userList: [User])
    func userListFailed(errorDescription: String)
}

protocol UserListWireFrame: class { // Router to confirm
    var viewController: UIViewController? {get set}
    func presentDetails(forUserList user: User)
    static func assembleModule(viewRef: UserListViewController)
}
