//
//  NetworkManager.swift
//  Mock_DepIncjection
//
//  Created by AnatoliiOstapenko on 06.08.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private let url = "https://jsonplaceholder.typicode.com/users"
    
    func getUsers(completion: @escaping(Result<[Users], Error>) -> Void) {
        guard let url = URL(string: self.url) else { return }
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
