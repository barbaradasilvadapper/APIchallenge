//
//  TabBar.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 14/08/25.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            NavigationStack {
                Home(viewModel: ViewModel(service: Service()))
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            NavigationStack {
                
            }
            .tabItem {
                Label("Categories", systemImage: "square.grid.2x2")
            }
            
            NavigationStack {
                
            }
            .tabItem {
                Label("Cart", systemImage: "cart")
            }
            
            NavigationStack {
                
            }
            .tabItem {
                Label("Favorites", systemImage: "heart")
            }
            
            NavigationStack {
                
            }
            .tabItem {
                Label("Orders", systemImage: "bag")
            }
        }
    }
}

#Preview {
    TabBar()
}
