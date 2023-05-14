//
//  AccountListViewModel.swift
//  Swift.JWT
//
//  Created by Salmdo on 5/13/23.
//

import Foundation

class AccountListViewModel: ObservableObject {
    @Published var accounts: [AccountViewModel] = []
    
    func getAccounts() {
        
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        WebService().getAllAccounts(token: token) { result in
            switch result {
            case .success(let accountRes):
                DispatchQueue.main.async {
                    self.accounts = accountRes.map(AccountViewModel.init)
                }

            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
