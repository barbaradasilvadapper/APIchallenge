//
//  FavoriteIcon.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 13/08/25.
//

import SwiftUI

struct FavoriteButton: View {

    var size: Font
    
    @Binding var product: Product
    
    var body: some View {
        ZStack {
            Button {
                product.isFavourite.toggle()
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
    }
}

#Preview {
//    FavoriteButton(product: .init(id: 2, title: "Product name with two or more lines goes here", description: "nothing", category: "category", price: 0, thumbnail: "", isFavourite: false))
}
