//
//  NetworkManager.swift
//  Airfield Weather
//
//  Created by Vic on 06.02.2024.
//

import Foundation
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchMetar(from url: URL, completion: @escaping(Result<[Metar], AFError>) -> Void) {
        
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let metars = Metar.getMetar(from: value)
                    completion(.success(metars))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
