//
//  VerticalProductCard.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 13/08/25.
//

import SwiftUI

struct VerticalProductCard: View {
    var width: CGFloat
    var height: CGFloat
    
    @State var product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: URL(string: product.thumbnail)) { image in
                    image.resizable()
                } placeholder: {
                    Image(.bag)
                }
                
                FavoriteButton(size: .title3, product: $product)
            }
            .frame(width: 160, height: 160)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(.fillsTertiary)
            )
                
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
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.fillsTertiary)
        )
        .frame(width: width, height: height)
    }
}

#Preview {
//    VerticalProductCard(product: .init(id: 2, title: "Product name with two or more lines goes here", description: "nothing", category: "category", price: 0, thumbnail: "", isFavourite: false))
}

