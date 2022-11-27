//
//  Currency.swift
//  Kripto SwiftUI
//
//  Created by Noyan Çepikkurt on 27.11.2022.
//

import Foundation

struct Currency : Decodable, Identifiable {
    
    let id = UUID()
    let currency : String
    let price : String
    
    private enum CodingKeys : String, CodingKey {
        case currency = "currency"
        case price = "prices"
    }
    
}
