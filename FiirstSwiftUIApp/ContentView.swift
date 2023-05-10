//
//  ContentView.swift
//  FiirstSwiftUIApp
//
//  Created by Prachit on 03/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [User] = []
    @State private var isLoading = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView()
                } else {
                    List(users, id: \.id) {
                        user in
                        Text(user.firstName)
                    }
                }
                
            }
        }
        .navigationTitle("UserScreen")
        .onAppear {
            Task {
                isLoading = true
                do {
                    
                    let userlist: UserList = try await APIManager().request(urlString: "https://dummyjson.com/users")
                    self.users = userlist.users
                } catch {
                    print(error)
                }
                isLoading = false
            }
        }
    }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}


