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
    init() {
        self.modelContainer = try! ModelContainer(for: FavoritesList.self, CartList.self, OrderList.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        self.modelContext = modelContainer.mainContext
    }
}
