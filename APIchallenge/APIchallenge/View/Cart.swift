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
    
    var total: Double {
        cart.reduce(0) { result, product in
            result + Double(product.price) * Double(cartList.filter { $0.id == product.id }.first!.quantity)
        }
    }
    
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
                
                Spacer()
            } else {
                
                
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(searchedProducts, id: \.id) { product in
                            ProductCounter(product: product)
                        }
                    }
                    .padding(16)
                }
                
                Spacer()
                
                VStack(spacing: 16) {
                    
                    HStack {
                        Text("Total")
                            .font(.subheadline)
                        
                        Spacer()
                        
                        Text("US$ \(String(format: "%.2f", total))")
                            .font(.headline)
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Checkout")
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
                }
                .padding(16)
                
            }
        }
        .task {
            await viewModel.fetch()
        }
        .navigationTitle("Cart")
        .toolbarBackgroundVisibility(.visible, for: .tabBar)
        .toolbarBackground(.backgroundsTertiary, for: .tabBar)
    }
}

#Preview {
    NavigationStack { Cart(viewModel: ViewModel(service: Service())) }
}
