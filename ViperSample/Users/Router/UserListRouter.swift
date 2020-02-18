//
//  UserListRouter.swift
//  ViperSample
//
//  Created by Singh, Dev on 2020/02/17.
//  Copyright © 2020 Singh, Dev. All rights reserved.
//

import UIKit

class UserListRouter: UserListWireFrame {
    weak var viewController: UIViewController?
    
    func presentDetails(forUserList user: User) {
        
    }
    
    static func assembleModule(viewRef: UserListViewController) {
        
        let presenter = UserlistPresenter()
        let interactor = UserListIntractor()
        let router = UserListRouter()
        
        viewRef.presenter = presenter
        presenter.view = viewRef
        presenter.intractor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = viewRef
    }
}
