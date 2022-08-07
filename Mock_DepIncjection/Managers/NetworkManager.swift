//
//  NetworkManager.swift
//  Mock_DepIncjection
//
//  Created by AnatoliiOstapenko on 06.08.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func getUsers(url: URL, completion: @escaping (Result<[Users], Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let users = try JSONDecoder().decode([Users].self, from: data)
                completion(.success(users))
            } catch { completion(.failure(error))}
        }
        task.resume()
    }
}

class NetworkManagerSecond {
    
    private var session: NetworkSession
    
    init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }
    
    func getData(url: URL, completion: @escaping (Result<[Users], Error>) -> Void) {
        session.getUsers(url: url) { data, error in
            guard let data = data, error == nil else { return }
            do {
                let result = try JSONDecoder().decode([Users].self, from: data)
                completion(.success(result))
            } catch { completion(.failure(error))}
        }
    }
    
    
}
