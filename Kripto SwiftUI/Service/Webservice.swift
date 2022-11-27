//
//  Webservice.swift
//  Kripto SwiftUI
//
//  Created by Noyan Çepikkurt on 27.11.2022.
//

import Foundation

class Webservice {
    
    func downloadCurrencies(url:URL, completion: @escaping(Result<[CryptoCurrency]?,downloaderError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badUrl))
            }
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data) else {
                return completion(.failure(.dataParseError))
            }
            
            completion(.success(currencies))
        }.resume()
        
    }
    
    
}

enum downloaderError : Error {
    case badUrl
    case noData
    case dataParseError
}
