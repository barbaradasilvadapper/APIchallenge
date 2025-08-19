//
//  OrderCard.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 15/08/25.
//

import SwiftUI

struct OrderCard: View {
    @State var product: Product
    @State var selectedProduct: Product?
    
    var body: some View {
        HStack(spacing: 8) {
            AsyncImage(url: URL(string: product.thumbnail)) { image in
                image.resizable()
            } placeholder: {
                Image(.bag)
                    .resizable()
            }
            .frame(width: 80, height: 80)
            .background(.fillsQuaternary)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(8)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 0) {
                    Text("Deliver by ")
                        .textCase(.uppercase)
                        .font(.footnote)
                        .foregroundStyle(.labelsSecondary)
                    Text(Date.now, format: Date.FormatStyle()
                        .month(.wide)
                        .day(.twoDigits)
                        .locale(Locale(identifier: "en_US")))
                    .textCase(.uppercase)
                    .font(.footnote)
                    .foregroundStyle(.labelsSecondary)
                }
                
                Text(product.title)
                    .font(.subheadline)
                    .foregroundStyle(.labelsPrimary)
                    .lineLimit(1)
                
                Text("US$ \(String(format: "%.2f", product.price))")
                    .font(.headline)
                    .foregroundStyle(.labelsPrimary)
            }
            .padding(.trailing, 16)
            Spacer()
        }
        .frame(width: 361, height: 96)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.fillsTertiary)
        )
    }
}

#Preview {
    OrderCard(product: .init(id: 2, title: "Product name ", description: "nothing", category: Category.beauty, price: 0, thumbnail: "", isFavourite: false))
}
