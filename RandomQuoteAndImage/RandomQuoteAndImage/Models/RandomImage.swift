//
//  RandomImage.swift
//  RandomQuoteAndImage
//
//  Created by Camila Campana on 21/03/23.
//

import Foundation

struct RandomImage: Decodable {
    let image: Data
    let quote: Quote
}

struct Quote: Decodable {
    let content: String
}
