//
//  LoginView.swift
//  Swift.JWT
//
//  Created by Salmdo on 5/13/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginVM = LoginViewModel()
    
    var body: some View {
        VStack {
            Form {
                HStack {
                    Spacer()
                    Image(systemName: loginVM.isAuthenticated ? "lock.fill" : "lock.open")
                }
                TextField("Username", text: $loginVM.usename)
                SecureField("Password", text: $loginVM.password)
                HStack {
                    Spacer()
                    Button("Login") {
                        loginVM.login()
                    }.frame(width: 150, height: 50)
                        .background(Color(uiColor: UIColor(red: 0.33, green: 0.90, blue: 0.76, alpha: 1.00)))
                        .cornerRadius(10)
                    Spacer()
                }
            }.buttonStyle(PlainButtonStyle())
        }
        .sheet(isPresented: $loginVM.isAuthenticated) {
            AccountListView()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
