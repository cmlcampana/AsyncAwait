//
//  ContentView.swift
//  RandomQuoteAndImage
//
//  Created by Camila Campana on 21/03/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RandomImageListViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.randomImages) { randomImage in
                HStack {
                    randomImage.image.map {
                        Image(uiImage: $0)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    Text(randomImage.quote)
                }
            }
            .navigationTitle("Random Images/Quotes")
            .toolbar(content: {
                Button {
                    Task {
                        await viewModel.getRandomImages(ids: Array(100...120))
                    }
                } label: {
                    Image(systemName: "arrow.clockwise.circle")
                }

            })
            .task {
                await viewModel.getRandomImages(ids: Array(100...120))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
