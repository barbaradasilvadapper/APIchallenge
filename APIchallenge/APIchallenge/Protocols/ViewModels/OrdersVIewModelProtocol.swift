//
//  OrdersVIewModelProtocol.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 22/08/25.
//
import Foundation

@MainActor
protocol OrdersVIewModelProtocol {
    // API Service
    var productService: any APIServiceProtocol { get }
    var products: [Int: Product] { get }
    var categories: [Category] { get }
    var isLoading: Bool { get }
    var defaultProduct: Product { get }
    func fetch() async
    
    // Orders Service
    var ordersService: any OrdersServiceProtocol { get }
    var orderList: [OrderList] { get }
    func addToOrder(productID: Int)
}
