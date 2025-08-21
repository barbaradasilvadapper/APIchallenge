//
//  Details.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 14/08/25.
//

import SwiftUI
import SwiftData

struct Details: View {
    
    let viewModel: any ViewModelProtocol
    
    var cartList: [CartList] {
        viewModel.cartList
    }
    
    @State var product: Product
    @State private var goToCart = false
    
    private var isCartInStorage: Bool {
        cartList.contains(where: { $0.id == product.id })
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        ZStack(alignment: .topTrailing) {
                            AsyncImage(url: URL(string: product.thumbnail)) { image in
                                image.resizable()
                            } placeholder: {
                                Image(.bag)
                            }
                            FavoriteButton(viewModel: viewModel, size: .title, product: $product)
                        }
                        .frame(width: 329, height: 329)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.fillsTertiary)
                        )
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(.fillsTertiary)
                    )
                    .padding(.horizontal, 16)
                    
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(product.title)
                            .font(.title3)
                            .foregroundStyle(.labelsPrimary)
                        
                        Text("US$ \(String(format: "%.2f", product.price))")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.labelsPrimary)
                    }
                    .padding(.horizontal, 16)
                    
                    VStack(alignment: .leading) {
                        Text(product.description)
                            .font(.body)
                            .foregroundStyle(.labelsSecondary)
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.top, 16)
            }
            Button {
                if let existing = cartList.first(where: { $0.id == product.id }) {
                    existing.quantity += 1
                } else {
                    viewModel.addToCart(productID: product.id,)
                }

            } label: {
                Text("Add to cart")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundStyle(.labelsPrimary)
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(.fillsTertiary)
                    )
            }
            .padding(16)

        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(product.title), \(String(format: "%.2f", product.price)) dollars, product description: \(product.description)")
        .accessibilityHint("Click on the button to add the product to the cart")
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar(.visible, for: .navigationBar)
        .toolbarBackground(.backgroundsTertiary, for: .navigationBar)
    }
}


//#Preview {
//    Details()
//}
