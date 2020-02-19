//
//  UserListIntractor.swift
//  ViperSample
//
//  Created by Singh, Dev on 2020/02/17.
//  Copyright © 2020 Singh, Dev. All rights reserved.
//

import Foundation

class UserListIntractor: UserListUseCase {
    weak var output: UserListIntreactorOutput!
    
    func fetchUserList() {
        NetworkClient().request(endPoint: .fetch(path: Constants.Path.userList, queryItems: nil)) { (result: Result<[User]>) in
            switch result {
            case .success(let userList):
                self.output.userListFetched(userList: userList)
            case .failure(let error):
                self.output.userListFailed(errorDescription: error)
            }
        }
    }
    
}
