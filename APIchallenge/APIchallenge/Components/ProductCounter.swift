//
//  ProductCounter.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 18/08/25.
//

import SwiftData
import SwiftUI

struct ProductCounter: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var cartList: [CartList]
    
    @State var product: Product
    
    private var productInCart: CartList? {
        cartList.first(where: { $0.id == product.id })
    }
    
    private var quantity: Int {
        productInCart?.quantity ?? 0
    }
    
    var body: some View {
        HStack(alignment: .center) {
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
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, minHeight: 34, alignment: .topLeading)
                    
                    Text("US$ \(String(format: "%.2f", product.price))")
                        .font(.headline)
                        .foregroundStyle(.labelsPrimary)
                }
                
                
                HStack(spacing: 6) {
                    Button {
                        if let item = productInCart, item.quantity > 1 {
                            item.quantity -= 1
                        }
                        try? modelContext.save()
                    } label: {
                        Image(systemName: "minus")
                            .foregroundStyle(.labelsPrimary)
                            .font(.caption)
                            .frame(width: 23, height: 23)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(.fillsTertiary)
                            )
                    }
                    
                    Text("\(quantity)")
                        .font(.body)
                        .foregroundStyle(.labelsPrimary)
                    
                    Button {
                        if let item = productInCart {
                            if item.quantity < 9 {
                                item.quantity += 1
                            }
                        } else {
                            // ainda não existe no carrinho → cria
                            modelContext.insert(CartList(id: product.id, quantity: 1))
                        }
                        try? modelContext.save()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.labelsPrimary)
                            .font(.caption)
                            .frame(width: 23, height: 23)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(.fillsTertiary)
                            )
                    }
                }
            }
            .padding(.vertical, 16)
            .padding(.trailing, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: 361, height: 94)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.fillsTertiary)
        )
    }
}


#Preview {
    ProductCounter(product: .init(id: 2, title: "Product name with two or more lines goes here", description: "nothing", category: Category.beauty, price: 0, thumbnail: "", isFavourite: false))
}
