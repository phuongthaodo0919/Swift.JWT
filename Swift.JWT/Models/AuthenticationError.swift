//
//  AuthenticationError.swift
//  Swift.JWT
//
//  Created by Salmdo on 5/13/23.
//

import Foundation
enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}
