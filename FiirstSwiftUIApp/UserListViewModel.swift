//
//  UserListViewModel.swift
//  FiirstSwiftUIApp
//
//  Created by Prachit on 10/05/23.
//

import SwiftUI

class UserListViewModel: ObservableObject {
    @Published  var users: [User] = []
    @Published  var isLoading = false
    
    func fetcheUsers()  {
        Task {
            do {
                
                DispatchQueue.main.async {
                    self.isLoading = true
                }
                
                let userlist: UserList = try await APIManager().request(urlString: "https://dummyjson.com/users")
                DispatchQueue.main.async {
                    self.users = userlist.users
                }
                
            } catch {
                print(error)
            }
            DispatchQueue.main.async {
                self.isLoading = false
            }
            
        }
    }
}
