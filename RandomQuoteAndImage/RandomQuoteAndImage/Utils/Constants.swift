//
//  Constants.swift
//  RandomQuoteAndImage
//
//  Created by Camila Campana on 21/03/23.
//

import Foundation

struct Constants {
    struct URLs {
        static func getRandomImageURL() -> URL? {
            URL(string: "https://picsum.photos/200/300?uuid=\(UUID().uuidString)")
        }

        static let randimQuoteURL = URL(string: "https://api.quotable.io/random")
    }
}
