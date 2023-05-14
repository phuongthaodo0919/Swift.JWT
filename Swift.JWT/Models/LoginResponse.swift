//
//  LoginResponse.swift
//  Swift.JWT
//
//  Created by Salmdo on 5/13/23.
//

import Foundation

struct LoginResponse: Codable {
    let token: String?
    let message: String?
    let success: String?
}
