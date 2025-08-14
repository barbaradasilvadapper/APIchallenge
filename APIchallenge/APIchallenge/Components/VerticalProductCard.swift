//
//  VerticalProductCard.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 13/08/25.
//

import SwiftUI

struct VerticalProductCard: View {
    
    @State var product: Product
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: URL(string: product.thumbnail)) { image in
                    image.resizable()
                } placeholder: {
                    Image(.bag)
                }
                
                FavoriteButton(product: $product)
                    .padding(8)
            }
            .frame(width: 160, height: 160)
            .clipShape(RoundedRectangle(cornerRadius: 8))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(product.title)
                        .font(.subheadline)
                        .foregroundStyle(.labelsPrimary)
                    
                    Text("US$ \(String(format: "%.2f", product.price))")
                        .font(.headline)
                        .foregroundStyle(.labelsPrimary)
                }
                .padding(8)
        }
        .frame(width: 177)
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.fillsTertiary)
        )
    }
}

#Preview {
    VerticalProductCard(product: .init(id: 2, title: "Product name with two or more lines goes here", description: "nothing", category: "category", price: 0, thumbnail: "", isFavourite: false))
}

