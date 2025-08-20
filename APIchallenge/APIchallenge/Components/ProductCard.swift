//
//  component.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 13/08/25.
//

import SwiftUI

struct ProductCard: View {
    
    var viewModel: ViewModelProtocol
    
    @State var product: Product
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: URL(string: product.thumbnail)) { image in
                image.resizable()
            } placeholder: {
                Image(.bag)
            }
            .frame(width: 160, height: 160)
            .background(.fillsQuaternary)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 24) {
                HStack(spacing: 4){
                    Text(product.category.stringLocalized.uppercased())
                        .font(.footnote)
                        .foregroundStyle(.labelsSecondary)
                    Spacer()
                    
                    FavoriteButton(viewModel: viewModel, size: .title3, product: $product)
                        .accessibilityLabel(product.isFavourite ? "Remove from favorites" : "Add to favorites")
                        .accessibilityHint("Click to toggle favorite status")
                }
                
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
            }
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.fillsTertiary)
        )
        
        .accessibilityElement(children: .contain)
        .accessibilityLabel("\(product.category.stringLocalized), \(product.title), \(String(format: "%.2f", product.price)) dollars")
        .accessibilityHint("Click to see more details")
    }
}

#Preview {
//    ProductCard(product: .init(id: 2, title: "Product name with two or more lines goes here", description: "nothing", category: "category", price: 0, thumbnail: "", isFavourite: false))
}
