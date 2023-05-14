//
//  Webservice.swift
//  Swift.JWT
//
//  Created by Salmdo on 5/13/23.
//

import Foundation

class WebService {
    let urlString = "https://swift-json-web-token-jwt.glitch.me"
    
    func getAllAccounts(token: String, completion: @escaping (Result<[Account], NetworkError>) -> Void) {
        guard let url = URL(string: "\(urlString)/accounts") else {
            completion(.failure(.invalidUrl))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("token", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, res, err in
            guard let data, err == nil else {
                completion(.failure(.noData))
                return
            }
            
            guard let decoredData = try? JSONDecoder().decode([Account].self, from: data) else {
                completion(.failure(.decodedError))
                return
            }
            completion(.success(decoredData));
        }
    }
    
    func login(username: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        guard let url = URL(string: "\(urlString)/login") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = LoginRequestBody(username: username, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod="POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { data, res, err in
            guard let data, err == nil else {
                completion(.failure(.custom(errorMessage: "No returned data")))
                return
            }
            
            guard let decodedData = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let token = decodedData.token else {
                completion(.failure(.invalidCredentials))
                return
            }
            completion(.success(token))
            

        }.resume()
    }
}
