//
//  Webservice.swift
//  GettingStartedAsyncAwait
//
//  Created by Camila Campana on 15/03/23.
//

import Foundation

final class Webservice {
    func getDate() async throws -> CurrentDate? {
        guard let url = URL(string: "https://ember-sparkly-rule.glitch.me/current-date") else {
            fatalError("Url is wrong")
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        return try? JSONDecoder().decode(CurrentDate.self, from: data)
    }
}
