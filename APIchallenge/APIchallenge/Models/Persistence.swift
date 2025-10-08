//
//  Persistence.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 21/08/25.
//
import Foundation
import SwiftData

struct Persistence {
    let modelContainer: ModelContainer
    let modelContext: ModelContext
    
    @MainActor
    static let shared = Persistence()
    
    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: FavoritesList.self, CartList.self, OrderList.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))
        self.modelContext = modelContainer.mainContext
    }
}
