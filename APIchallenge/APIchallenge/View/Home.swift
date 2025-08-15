//
//  Home.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 14/08/25.
//

import SwiftUI

struct Home: View {

    var viewModel: any ViewModelProtocol
    var dealOfTheDay: Product? {
        viewModel.products.values.first
    }
    
    @State var selectedProduct: Product?
    @State var hasAppeared: Bool = false

    let columns = [GridItem(), GridItem()]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                Text("Deals of the Day")
                    .font(.title2)
                    .fontWeight(.bold)
                if let dealOfTheDay = dealOfTheDay {
                    ProductCard(product: dealOfTheDay)
                } else {
                    ProductCard(product: viewModel.defaultProduct)
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Top picks")
                    .font(.title2)
                    .fontWeight(.bold)

                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(Array(viewModel.products.values), id: \.self) {
                        product in
                        Button {
                            selectedProduct = product
                        } label: {

                            VerticalProductCard(
                                width: 177,
                                height: 250,
                                product: product
                            )
                        }
                    }
                }
                .sheet(item: $selectedProduct) { product in
                    Details(product: product)
                        .presentationDragIndicator(.visible)
                }
            }
            .padding(.top, 8)

        }
        .padding(16)
        .onAppear {
            if !hasAppeared {
                hasAppeared = true
                
                Task {
                    await viewModel.fetch()
                }
            }
        }
        .navigationTitle("Home")
    }
}

#Preview {
    NavigationStack { Home(viewModel: ViewModel(service: Service())) }
}
