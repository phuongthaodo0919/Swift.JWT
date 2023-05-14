//
//  NetworkError.swift
//  Swift.JWT
//
//  Created by Salmdo on 5/13/23.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case noData
    case decodedError
}
