//
//  NetworkManager.swift
//  Airfield Weather
//
//  Created by Vic on 02.02.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchForecast(from url: URL, completion: @escaping(Result<Metar, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data else {
                print(error ?? "No error description")
                return
            }
            
            do {
                let metar = try JSONDecoder().decode([Metar].self, from: data)
                print("METAR RAW DATA\(metar)")
//                completion(.success(metar))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
