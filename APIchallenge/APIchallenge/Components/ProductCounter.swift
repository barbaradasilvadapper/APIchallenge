//
//  ProductCounter.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 18/08/25.
//

import SwiftData
import SwiftUI

struct ProductCounter: View {
    
    var add: () -> Void
    var remove: () -> Void
    
    @State var product: Product

    var quantity: Int
    
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
                        remove()
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
                        add()
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
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(product.title), \(String(format: "%.2f", product.price)) dollars, \(quantity) in cart")
        .accessibilityHint("Click on the quantity buttons to adjust the quantity in cart.")
    }
}
