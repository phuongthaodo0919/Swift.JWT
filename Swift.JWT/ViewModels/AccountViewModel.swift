//
//  AccountViewModel.swift
//  Swift.JWT
//
//  Created by Salmdo on 5/13/23.
//

import Foundation

struct AccountViewModel {
    let account: Account
    
    let id = UUID()
    
    var name: String {
        account.name
    }
    
    var balance: String {
        String(account.balance)
    }
}
