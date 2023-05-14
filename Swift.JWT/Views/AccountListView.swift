//
//  AccountList.swift
//  Swift.JWT
//
//  Created by Salmdo on 5/13/23.
//

import SwiftUI

struct AccountListView: View {
    @ObservedObject var accountListVM = AccountListViewModel()
    
    
    var body: some View {
        NavigationView
        {
            List {
                ForEach(accountListVM.accounts, id: \.id) { account in
                    HStack {
                        Text(account.name)
                            .fontWeight(.bold)
                        Spacer()
                        Text(account.balance)
                    }
                }
                
            }
            .toolbar {
                ToolbarItem {
                    Button("Signout") {
                        accountListVM.signout()
                        
                    }
                    
                }
                ToolbarItem {
                    NavigationLink(destination: LoginView(), isActive: $accountListVM.isSignOut) {
                        EmptyView()
                    }
                }
                
            }
            .navigationTitle(Text("Account list"))
        }
        .navigationBarBackButtonHidden()
        .onAppear() {
            accountListVM.getAccounts()
        }
    }
}

struct AccountList_Previews: PreviewProvider {
    static var previews: some View {
        AccountListView()
    }
}
