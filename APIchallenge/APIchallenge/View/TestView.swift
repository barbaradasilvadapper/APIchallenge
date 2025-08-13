//
//  TestView.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 13/08/25.
//

import SwiftUI

struct TestView: View {
    let viewModel: ViewModel

    var text: String {
        viewModel.products.description
    }

    var body: some View {

        VStack {
            if viewModel.isLoading {
                Text("Loading...")
            } else {
                Text(text)
            }
        }
        .task {
            await viewModel.fetchAllProducts()
        }

    }
}

#Preview {
    TestView(viewModel: ViewModel(service: Service()))
}
