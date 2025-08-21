//
//  FavoriteIcon.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 13/08/25.
//

import SwiftData
import SwiftUI

struct FavoriteButton: View {

    let viewModel: ViewModelProtocol
    
    var favoritesList: [FavoritesList] {
        viewModel.favoritesList
    }

    var size: Font
    @Binding var product: Product

    private var isFavoriteInStorage: Bool {
        favoritesList.contains(where: { $0.id == product.id })
    }

    var body: some View {
        ZStack {
            Button {
                if let _ = favoritesList.first(where: { $0.id == product.id }) {
                    viewModel.removeFromFavorites(productID: product.id)
                } else {
                    viewModel.addToFavorites(productID: product.id)
                }

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
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(isFavoriteInStorage ? "Remove from favorites" : "Add to favorites")
        .accessibilityHint("Click to toggle favorite status")
    }
}

#Preview {
//    FavoriteButton(product: .init(id: 2, title: "Product name with two or more lines goes here", description: "nothing", category: "category", price: 0, thumbnail: "", isFavourite: false))
}
