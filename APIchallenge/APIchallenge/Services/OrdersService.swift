//
//  OrderService.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 21/08/25.
//
import Foundation
import SwiftData

final class OrdersService: OrdersServiceProtocol {
    let modelContext: ModelContext

    init() {
        self.modelContext = Persistence.shared.modelContext
    }
    
    var oredersList: [OrderList] {
        fetchOrders()
    }
    
    func addToOrder(productID: Int) {
        let product = OrderList(id: productID)
        modelContext.insert(product)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetchOrders() -> [OrderList] {
        do {
            return try modelContext.fetch(FetchDescriptor<OrderList>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
