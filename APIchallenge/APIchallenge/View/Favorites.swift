//
//  Favorites.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 15/08/25.
//

import SwiftUI

struct Favorites: View {
    
    var viewModel: ViewModelProtocol
    
    var body: some View {
        VStack {
            //SEARCH
            ScrollView {
                
                VStack(spacing: 16) {
                    ForEach(Array(viewModel.products.values), id: \.self) { product in
                        if product.isFavourite {
                            ProductListCart(product: product)
                        }
                    }
                }
                .padding(16)
            }
        }
        .task {
            await viewModel.fetch()
        }
        .navigationTitle("Favorites")
    }
}

#Preview {
    NavigationStack { Favorites(viewModel: ViewModel(service: Service())) }
}
