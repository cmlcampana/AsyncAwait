//
//  CurrentDate.swift
//  GettingStartedAsyncAwait
//
//  Created by Camila Campana on 15/03/23.
//

import Foundation

struct CurrentDate: Decodable, Identifiable {
    let id = UUID()
    let date: String

    private enum CodingKeys: String, CodingKey {
        case date = "date"
    }
}
