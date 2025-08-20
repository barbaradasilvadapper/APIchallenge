//
//  SearchBar.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 15/08/25.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    var placeholder: String = "Search"
    
    var body: some View {
        ZStack {
            Color.fillsTertiary
                .frame(width: 361, height: 36)
                .cornerRadius(10)

            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField(placeholder, text: $searchText)
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Search bar")
        .accessibilityHint("Type to search items")

    }
}
