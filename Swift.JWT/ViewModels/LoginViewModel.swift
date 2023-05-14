//
//  LoginViewModel.swift
//  Swift.JWT
//
//  Created by Salmdo on 5/13/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    var usename: String = "johndoe"
    var password: String = "password12356"
    @Published var isAuthenticated: Bool = false
    
    func login() {
        //Create a UserDefault
        let defaults = UserDefaults.standard
        
        WebService().login(username: usename, password: password) { result in
            switch result {
            case .success(let token):
                defaults.set(token, forKey: "jsonwebtoken")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
