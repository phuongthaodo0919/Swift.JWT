//
//  LoginRequestBody.swift
//  Swift.JWT
//
//  Created by Salmdo on 5/13/23.
//

import Foundation
struct LoginRequestBody: Codable {
    let username: String
    let password: String
}
