//
//  Cart.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 15/08/25.
//

import SwiftData
import SwiftUI

struct Cart: View {
    var viewModel: ViewModelProtocol
    
    @Environment(\.modelContext) var modelContext
    @Query var cartList: [CartList]
    
    @State var searchText: String = ""
    
    var cart: [Product] {
        cartList.compactMap {
            viewModel.products[$0.id]
        }
    }
    
    var searchedProducts: [Product] {
        if searchText.isEmpty {
            return cart
        }

        return cart.filter {
            $0.title.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        VStack {
            SearchBar(searchText: $searchText)
            
            if cart.isEmpty {
                EmptyStateCart()
                    .padding(.top, 156)
            }
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(searchedProducts, id: \.id) { product in
                        ProductCounter(product: product)
                    }
                }
                .padding(16)
            }
            
            Spacer()
            
            
        }
        .task {
            await viewModel.fetch()
        }
        .navigationTitle("Cart")
    }
}

#Preview {
    NavigationStack { Cart(viewModel: ViewModel(service: Service())) }
}
