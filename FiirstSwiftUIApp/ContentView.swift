//
//  ContentView.swift
//  FiirstSwiftUIApp
//
//  Created by Prachit on 03/05/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: UserListViewModel
    
    var body: some View {
        
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    List(viewModel.users, id: \.id) {
                        user in
                        Text(user.firstName)
                    }
                }
                
            }
        }
        .navigationTitle("UserScreen")
        .onAppear {
            Task {
                 viewModel.fetcheUsers()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        ContentView(viewModel: UserListViewModel())
    }
}


