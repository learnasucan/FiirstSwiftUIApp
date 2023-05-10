//
//  APIManager.swift
//  FiirstSwiftUIApp
//
//  Created by Prachit on 10/05/23.
//

import UIKit

enum DataError: Error {
    case invalidURL
    case invalidResponse
}

class APIManager {

    func request<T:Decodable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else { throw DataError.invalidURL }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {throw DataError.invalidResponse }
        
        let dataResponse = try JSONDecoder().decode(T.self, from: data)
        return dataResponse
        
    }
}
