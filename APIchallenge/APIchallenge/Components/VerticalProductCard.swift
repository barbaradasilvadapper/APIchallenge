//
//  VerticalProductCard.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 13/08/25.
//

import SwiftUI

struct VerticalProductCard: View {
    
    let onClick: () -> Void
    
    var width: CGFloat
    var height: CGFloat
    
    @State var product: Product
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: URL(string: product.thumbnail)) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    Image(.bag)
                        .resizable()
                        .scaledToFit()
                }
                
                FavoriteButton(onClick: onClick, size: .title3, product: $product)
                    .accessibilityLabel(product.isFavourite ? "Remove from favorites" : "Add to favorites")
                    .accessibilityHint("Click to toggle favorite status")
            }
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(.fillsTertiary)
            )

            Spacer()
            
            VStack(alignment: .leading, spacing: 4) {
                Text(product.title)
                    .font(.subheadline)
                    .foregroundStyle(.labelsPrimary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, minHeight: 34, alignment: .topLeading)
                

                Text("US$ \(String(format: "%.2f", product.price))")
                    .font(.headline)
                    .foregroundStyle(.labelsPrimary)
            }
            .padding(.horizontal, 8)
            
            Spacer()
        }
        .padding(8)
        .frame(width: width, height: height)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.fillsTertiary)
        )
        .accessibilityElement(children: .contain)
        .accessibilityLabel("\(product.title), \(String(format: "%.2f", product.price)) dollars")
        .accessibilityHint("Click to see more details")

    }
}

#Preview {
//    VerticalProductCard(product: .init(id: 2, title: "Product name with two or more lines goes here", description: "nothing", category: "category", price: 0, thumbnail: "", isFavourite: false))
}

