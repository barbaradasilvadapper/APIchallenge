//
//  ProductListCart.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 15/08/25.
//

import SwiftUI

struct ProductListCart: View {
    
    let viewModel: any ViewModelProtocol
    
    @State var product: Product
    @State var selectedProduct: Product?
    
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
            
            HStack {
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
                        Details(viewModel: viewModel, product: product)
                            .presentationDragIndicator(.visible)
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

//#Preview {
//    ProductListCart(product: .init(id: 2, title: "Product name with two or more lines goes here", description: "nothing", category: Category.beauty, price: 0, thumbnail: "", isFavourite: false))
//}
