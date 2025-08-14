//
//  FavoriteIcon.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 13/08/25.
//

import SwiftUI

struct FavoriteButton: View {
    
    @Binding var product: Product
    
    var body: some View {
        ZStack {
            Button {
                product.isFavourite.toggle()
            } label: {
                Image(systemName: product.isFavourite ? "heart.fill" : "heart")
                    .frame(width: 22, height: 22)
                    .foregroundStyle(.labelsPrimary)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.fillsTertiary)
                .frame(width: 38, height: 38)
        )
    }
}

#Preview {
//    FavoriteButton(product: .init(id: 2, title: "Product name with two or more lines goes here", description: "nothing", category: "category", price: 0, thumbnail: "", isFavourite: false))
}
