//
//  URLSession_Ext.swift
//  Mock_DepIncjection
//
//  Created by AnatoliiOstapenko on 06.08.2022.
//

import Foundation

protocol NetworkSession {
    func getUsers(url: URL, completion: @escaping(Data?, Error?) -> Void)
}

extension URLSession: NetworkSession {
    func getUsers(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            completion(data, error)
        }
        task.resume()
    }
}
