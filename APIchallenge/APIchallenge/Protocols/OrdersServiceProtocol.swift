//
//  OrdersServiceProtocol.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 21/08/25.
//
import Foundation

@MainActor
protocol OrdersServiceProtocol {
    var oredersList: [OrderList] { get }
    func addToOrder(productID: Int)
    func fetchOrders() -> [OrderList]
}
