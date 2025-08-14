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
        viewModel.products.values.map {
            "\($0.id): \($0.title), \($0.category.rawValue)"
        }.joined(separator: "\n")
        
//        viewModel.categories.map {
//            "\($0.id): \($0.rawValue)"
//        }.joined(separator: "\n")
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
            await viewModel.fetch()
        }

    }
}

#Preview {
    TestView(viewModel: ViewModel(service: Service()))
}
