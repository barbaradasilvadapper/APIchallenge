//
//  ProductCategory.swift
//  APIRequest
//
//  Created by Gabriel Barbosa on 13/08/25.
//
import Foundation

enum Category: String, Codable, Identifiable, Hashable {
    var id: String { rawValue }

    case beauty = "beauty"
    case fragrances = "fragrances"
    case furniture = "furniture"
    case groceries = "groceries"
    case homeDecoration = "home-decoration"
    case kitchenAccessories = "kitchen-accessories"
    case laptops = "laptops"
    case mensShirts = "mens-shirts"
    case mensShoes = "mens-shoes"
    case mensWatches = "mens-watches"
    case mobileAccessories = "mobile-accessories"
    case motorcycle = "motorcycle"
    case skinCare = "skincare"
    case smartphones = "smartphones"
    case sportsAccessories = "sports-accessories"
    case sunglasses = "sunglasses"
    case tablets = "tablets"
    case tops = "tops"
    case automotive = "automotive"
    case womensBags = "womens-bags"
    case womensDresses = "womens-dresses"
    case womensJewellery = "womens-jewellery"
    case womensShoes = "womens-shoes"
    case womensWatches = "womens-watches"
    
    var stringLocalized: String {
            switch self {
            case .beauty:
                return String(localized: "Beauty")
            case .fragrances:
                return String(localized: "Fragrances")
            case .furniture:
                return String(localized: "Furniture")
            case .groceries:
                return String(localized: "Groceries")
            case .homeDecoration:
                return String(localized: "Home Decoration")
            case .kitchenAccessories:
                return String(localized: "Kitchen Accessories")
            case .laptops:
                return String(localized: "Laptops")
            case .mensShirts:
                return String(localized: "Mens Shirts")
            case .mensShoes:
                return String(localized: "Mens Shoes")
            case .mensWatches:
                return String(localized: "Mens Watches")
            case .mobileAccessories:
                return String(localized: "Mobile Accessories")
            case .motorcycle:
                return String(localized: "Motorcycle")
            case .skinCare:
                return String(localized: "Skincare")
            case .smartphones:
                return String(localized: "Smartphones")
            case .sportsAccessories:
                return String(localized: "Sports Accessories")
            case .sunglasses:
                return String(localized: "Sunglasses")
            case .tablets:
                return String(localized: "Tablets")
            case .tops:
                return String(localized: "Tops")
            case .automotive:
                return String(localized: "Vehicle")
            case .womensBags:
                return String(localized: "Womens Bags")
            case .womensDresses:
                return String(localized: "Womens Dresses")
            case .womensJewellery:
                return String(localized: "Womens Jewellery")
            case .womensShoes:
                return String(localized: "Womens Shoes")
            case .womensWatches:
                return String(localized: "Womens Watches")
            }
        }
    
    var imageName: String {
        switch self {
        case .beauty:
            return "sparkles"
        case .fragrances:
            return "drop.fill"
        case .furniture:
            return "chair.lounge.fill"
        case .groceries:
            return "basket.fill"
        case .homeDecoration:
            return "lamp.table.fill"
        case .kitchenAccessories:
            return "fork.knife"
        case .laptops:
            return "laptopcomputer"
        case .mensShirts:
            return "tshirt.fill"
        case .mensShoes:
            return "shoe.fill"
        case .mensWatches:
            return "applewatch.watchface"
        case .mobileAccessories:
            return "powercord.fill"
        case .motorcycle:
            return "motorcycle.fill"
        case .skinCare:
            return "face.smiling.inverse"
        case .smartphones:
            return "iphone.gen3"
        case .sportsAccessories:
            return "tennis.racket"
        case .sunglasses:
            return "sunglasses.fill"
        case .tablets:
            return "ipad"
        case .tops:
            return "jacket.fill"
        case .automotive:
            return "car.fill"
        case .womensBags:
            return "handbag.fill"
        case .womensDresses:
            return "figure.stand.dress"
        case .womensJewellery:
            return "crown.fill"
        case .womensShoes:
            return "shoeprints.fill"
        case .womensWatches:
            return "watch.analog"
        }
    }
}
