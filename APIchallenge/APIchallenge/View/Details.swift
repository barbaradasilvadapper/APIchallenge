//
//  Details.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 14/08/25.
//

import SwiftUI

struct Details: View {
    
    @State var product: Product
    
    var body: some View {
        VStack {
            ScrollView {
                
                VStack(alignment: .leading, spacing: 8) {
                    ZStack(alignment: .topTrailing) {
                        AsyncImage(url: URL(string: product.thumbnail)) { image in
                            image.resizable()
                        } placeholder: {
                            Image(.bag)
                        }
                        
                        FavoriteButton(size: .title, product: $product)
                    }
                    .frame(width: 329, height: 329)
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
                .padding(16)
            }
        }
        .navigationTitle("Details")
    }
}

//#Preview {
//    Details()
//}
