//
//  ProductCategory.swift
//  APIRequest
//
//  Created by Gabriel Barbosa on 13/08/25.
//
import Foundation

enum Category: Codable, Identifiable, Hashable {
    case beauty
    case fragrances
    case furniture
    case groceries
    case homeDecoration
    case kitchenAccessories
    case laptops
    case mensShirts
    case mensShoes
    case mensWatches
    case mobileAccessories
    case motorcycle
    case skinCare
    case smartphones
    case sportsAccessories
    case sunglasses
    case tablets
    case tops
    case automotive
    case womensBags
    case womensDresses
    case womensJewellery
    case womensShoes
    case womensWatches
    case other(String)

    // Stable identifier
    var id: String { stringValue }

    // Canonical API string
    var stringValue: String {
        switch self {
        case .beauty: return "beauty"
        case .fragrances: return "fragrances"
        case .furniture: return "furniture"
        case .groceries: return "groceries"
        case .homeDecoration: return "home-decoration"
        case .kitchenAccessories: return "kitchen-accessories"
        case .laptops: return "laptops"
        case .mensShirts: return "mens-shirts"
        case .mensShoes: return "mens-shoes"
        case .mensWatches: return "mens-watches"
        case .mobileAccessories: return "mobile-accessories"
        case .motorcycle: return "motorcycle"
        case .skinCare: return "skincare"
        case .smartphones: return "smartphones"
        case .sportsAccessories: return "sports-accessories"
        case .sunglasses: return "sunglasses"
        case .tablets: return "tablets"
        case .tops: return "tops"
        case .automotive: return "automotive"
        case .womensBags: return "womens-bags"
        case .womensDresses: return "womens-dresses"
        case .womensJewellery: return "womens-jewellery"
        case .womensShoes: return "womens-shoes"
        case .womensWatches: return "womens-watches"
        case .other(let s): return s
        }
    }

    // MARK: - Codable
    init(from decoder: Decoder) throws {
        let raw = try decoder.singleValueContainer().decode(String.self)
        switch raw {
        case "beauty": self = .beauty
        case "fragrances": self = .fragrances
        case "furniture": self = .furniture
        case "groceries": self = .groceries
        case "home-decoration": self = .homeDecoration
        case "kitchen-accessories": self = .kitchenAccessories
        case "laptops": self = .laptops
        case "mens-shirts": self = .mensShirts
        case "mens-shoes": self = .mensShoes
        case "mens-watches": self = .mensWatches
        case "mobile-accessories": self = .mobileAccessories
        case "motorcycle": self = .motorcycle
        case "skincare": self = .skinCare
        case "smartphones": self = .smartphones
        case "sports-accessories": self = .sportsAccessories
        case "sunglasses": self = .sunglasses
        case "tablets": self = .tablets
        case "tops": self = .tops
        case "automotive": self = .automotive
        case "womens-bags": self = .womensBags
        case "womens-dresses": self = .womensDresses
        case "womens-jewellery": self = .womensJewellery
        case "womens-shoes": self = .womensShoes
        case "womens-watches": self = .womensWatches
        default: self = .other(raw)
        }
    }

    func encode(to encoder: Encoder) throws {
        var c = encoder.singleValueContainer()
        try c.encode(stringValue)
    }

    // MARK: - UI helpers
    var stringLocalized: String {
        switch self {
        case .beauty: return String(localized: "Beauty")
        case .fragrances: return String(localized: "Fragrances")
        case .furniture: return String(localized: "Furniture")
        case .groceries: return String(localized: "Groceries")
        case .homeDecoration: return String(localized: "Home Decoration")
        case .kitchenAccessories: return String(localized: "Kitchen Accessories")
        case .laptops: return String(localized: "Laptops")
        case .mensShirts: return String(localized: "Mens Shirts")
        case .mensShoes: return String(localized: "Mens Shoes")
        case .mensWatches: return String(localized: "Mens Watches")
        case .mobileAccessories: return String(localized: "Mobile Accessories")
        case .motorcycle: return String(localized: "Motorcycle")
        case .skinCare: return String(localized: "Skincare")
        case .smartphones: return String(localized: "Smartphones")
        case .sportsAccessories: return String(localized: "Sports Accessories")
        case .sunglasses: return String(localized: "Sunglasses")
        case .tablets: return String(localized: "Tablets")
        case .tops: return String(localized: "Tops")
        case .automotive: return String(localized: "Vehicle")
        case .womensBags: return String(localized: "Womens Bags")
        case .womensDresses: return String(localized: "Womens Dresses")
        case .womensJewellery: return String(localized: "Womens Jewellery")
        case .womensShoes: return String(localized: "Womens Shoes")
        case .womensWatches: return String(localized: "Womens Watches")
        case .other(let s):
            let pretty = s.replacingOccurrences(of: "-", with: " ").localizedCapitalized
            return pretty
        }
    }

    var imageName: String {
        switch self {
        case .beauty: return "sparkles"
        case .fragrances: return "drop.fill"
        case .furniture: return "chair.lounge.fill"
        case .groceries: return "basket.fill"
        case .homeDecoration: return "lamp.table.fill"
        case .kitchenAccessories: return "fork.knife"
        case .laptops: return "laptopcomputer"
        case .mensShirts: return "tshirt.fill"
        case .mensShoes: return "shoe.fill"
        case .mensWatches: return "applewatch.watchface"
        case .mobileAccessories: return "powercord.fill"
        case .motorcycle: return "motorcycle.fill"
        case .skinCare: return "face.smiling.inverse"
        case .smartphones: return "iphone.gen3"
        case .sportsAccessories: return "tennis.racket"
        case .sunglasses: return "sunglasses.fill"
        case .tablets: return "ipad"
        case .tops: return "jacket.fill"
        case .automotive: return "car.fill"
        case .womensBags: return "handbag.fill"
        case .womensDresses: return "figure.stand.dress"
        case .womensJewellery: return "crown.fill"
        case .womensShoes: return "shoeprints.fill"
        case .womensWatches: return "watch.analog"
        case .other: return "tag.fill"
        }
    }
}

extension Category {
    init(fromRawValue raw: String) {
        switch raw {
        case "beauty": self = .beauty
        case "fragrances": self = .fragrances
        case "furniture": self = .furniture
        case "groceries": self = .groceries
        case "home-decoration": self = .homeDecoration
        case "kitchen-accessories": self = .kitchenAccessories
        case "laptops": self = .laptops
        case "mens-shirts": self = .mensShirts
        case "mens-shoes": self = .mensShoes
        case "mens-watches": self = .mensWatches
        case "mobile-accessories": self = .mobileAccessories
        case "motorcycle": self = .motorcycle
        case "skincare": self = .skinCare
        case "smartphones": self = .smartphones
        case "sports-accessories": self = .sportsAccessories
        case "sunglasses": self = .sunglasses
        case "tablets": self = .tablets
        case "tops": self = .tops
        case "automotive": self = .automotive
        case "womens-bags": self = .womensBags
        case "womens-dresses": self = .womensDresses
        case "womens-jewellery": self = .womensJewellery
        case "womens-shoes": self = .womensShoes
        case "womens-watches": self = .womensWatches
        default: self = .other(raw)
        }
    }
}
