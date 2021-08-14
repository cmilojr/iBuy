//
//  Constants.swift
//  iBuy
//
//  Created by Camilo Jimenez on 6/08/21.
//

import UIKit

struct Constants {
    struct API {
        static let countriesUrl = "https://api.mercadolibre.com/sites"
        static func CategoriesAvailable() -> String {
            let country = Storage.shared.getLocalCountry()
            return "https://api.mercadolibre.com/sites/\(country!.id)/categories"
        }
        static func ItemInCategoryAvailable(_ category: String) -> String {
            let country = Storage.shared.getLocalCountry()
            return "https://api.mercadolibre.com/sites/\(country!.id)/search?category=\(category)"
        }
        static func searchItems(item: String) -> String {
            let search = item.replacingOccurrences(of: " ", with: "%20")
            let country = Storage.shared.getLocalCountry()
            return "https://api.mercadolibre.com/sites/\(country!.id)/search?q=\(search)"
        }
    }
    
    struct CellIdentifier {
        static let categoryCell = "CategoryCell"
        static let countryCell = "CountryCell"
        static let productCell = "ProductCell"
    }
    
    struct SBIdentifier {
        static let dashboard = "Dashboard"
        static let selectCountry = "SelectCountry"
    }
    
    struct LocalStorageKey {
        static let userCountry = "userCountry"
    }
    
    struct CustomColors {
        static let mintGreen = UIColor(named: "MintGreen")
        static let green = UIColor(named: "Green")
        static let orange = UIColor(named: "Orange")
        static let softPurple = UIColor(named: "SoftPurple")
        static let softGray = UIColor(named: "SoftGray")
    }
}

// Link: https://developers.mercadolibre.com.ar/es_ar/categorias-y-publicaciones#close
