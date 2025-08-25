//
//  MockOrdersService.swift
//  APIchallengeTests
//
//  Created by João Pedro Teixeira de Carvalho on 25/08/25.
//
import Foundation

@testable import APIchallenge

class MockOrdersService: OrdersServiceProtocol {
    
    var shouldFail: Bool = false
    var oredersList: [APIchallenge.OrderList]
    
    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
        self.oredersList = []
    }
    
    func addToOrder(productID: Int) {
        oredersList.append(OrderList(id: productID))
    }
    
    func fetchOrders() -> [APIchallenge.OrderList] {
        return oredersList
    }
    
    
}
