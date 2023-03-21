//
//  Webservice.swift
//  RandomQuoteAndImage
//
//  Created by Camila Campana on 21/03/23.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case decodeError
}

final class Webservice {

    func getRandomImages(ids: [Int]) async throws -> [RandomImage] {
        var randomImages = [RandomImage]()

        try await withThrowingTaskGroup(of: (Int, RandomImage?).self, body: { group in
            for id in ids {
                group.addTask { [weak self] in
                    return (id, try await self?.getRandomImage(id: id))
                }
            }

            for try await (_, randomImage) in group {
                if let randomImage {
                    randomImages.append(randomImage)
                }
            }
        })

        return randomImages
    }

    func getRandomImage(id: Int) async throws -> RandomImage {
        guard let url = Constants.URLs.getRandomImageURL(),
              let quoteUrl = Constants.URLs.randimQuoteURL else {
            throw NetworkError.badUrl
        }

        async let (imageData, _) = URLSession.shared.data(from: url)
        async let (quoteData, _) = URLSession.shared.data(from: quoteUrl)

        guard let quote = try? JSONDecoder().decode(Quote.self, from: try await quoteData) else {
            throw NetworkError.decodeError
        }

        return RandomImage(image: try await imageData, quote: quote)
    }
}
