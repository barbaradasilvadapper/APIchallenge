//
//  FavoriteIcon.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 13/08/25.
//

import SwiftData
import SwiftUI

struct FavoriteButton: View {
    
    let onClick: () -> Void

    var size: Font
    @Binding var product: Product

    var body: some View {
        ZStack {
            Button {
                action()
            } label: {
                Image(systemName: product.isFavourite ? "heart.fill" : "heart")
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
        .accessibilityLabel(product.isFavourite ? "Remove from favorites" : "Add to favorites")
        .accessibilityHint("Click to toggle favorite status")
    }
    
    func action() {
        onClick()
        product.isFavourite.toggle()
    }
}

#Preview {
//    FavoriteButton(product: .init(id: 2, title: "Product name with two or more lines goes here", description: "nothing", category: "category", price: 0, thumbnail: "", isFavourite: false))
}
