//
//  ProductListCart.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 15/08/25.
//

import SwiftUI

struct ProductListCart: View {
    
    @State var product: Product
    @State var selectedProduct: Product?
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            AsyncImage(url: URL(string: product.thumbnail)) { image in
                image.resizable()
            } placeholder: {
                Image(.bag)
                    .resizable()
            }
            .frame(width: 78, height: 78)
            .background(.fillsQuaternary)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(8)
            
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(product.title)
                        .font(.subheadline)
                        .foregroundStyle(.labelsPrimary)
                    
                    Text("US$ \(String(format: "%.2f", product.price))")
                        .font(.headline)
                        .foregroundStyle(.labelsPrimary)
                }
                
                Spacer()
                
                Button {
                    selectedProduct = product
                } label: {
                    Image(systemName: "cart.fill")
                        .foregroundStyle(.labelsPrimary)
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.fillsTertiary)
                        )
                }
                .sheet(item: $selectedProduct) { product in
                    NavigationStack {
                        Details(product: product)
                            .presentationDragIndicator(.visible)
                    }
                }
            }
            .padding(.vertical, 16)
            .padding(.trailing, 16)
            .frame(width: 243, height: 62)
        }
        .frame(width: 361, height: 94)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.fillsTertiary)
        )
    }
}

//#Preview {
//    ProductListCart(product: .init(id: 2, title: "Product name with two or more lines goes here", description: "nothing", category: Category.beauty, price: 0, thumbnail: "", isFavourite: false))
//}
