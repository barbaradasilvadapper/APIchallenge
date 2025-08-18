//
//  FavoriteIcon.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 13/08/25.
//

import SwiftData
import SwiftUI

struct FavoriteButton: View {

    @Environment(\.modelContext) var modelContext
    @Query var favoritesList: [FavoritesList]

    var size: Font
    @Binding var product: Product

    private var isFavoriteInStorage: Bool {
        favoritesList.contains(where: { $0.id == product.id })
    }

    var body: some View {
        ZStack {
            Button {
                if let favoriteToRemove = favoritesList.first(where: { $0.id == product.id }) {
                    modelContext.delete(favoriteToRemove)
                } else {
                    modelContext.insert(FavoritesList(id: product.id))
                }

                try? modelContext.save()
            } label: {
                Image(systemName: isFavoriteInStorage ? "heart.fill" : "heart")
                    .font(size)
                    .foregroundStyle(.labelsPrimary)
            }
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.fillsTertiary)
        )
    }
}

#Preview {
//    FavoriteButton(product: .init(id: 2, title: "Product name with two or more lines goes here", description: "nothing", category: "category", price: 0, thumbnail: "", isFavourite: false))
}
