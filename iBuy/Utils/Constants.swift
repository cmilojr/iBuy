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
        static let categoriesAvailableUrl = "https://api.mercadolibre.com/sites/MLA/categories"
        // TODO - Insertar "https://api.mercadolibre.com/sites/\(codigo de mi pais)/categories"
    }
    
    struct CellIdentifier {
        static let categoryCell = "CategoryCell"
        static let countryCell = "CountryCell"
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
    }
}

// Link: https://developers.mercadolibre.com.ar/es_ar/categorias-y-publicaciones#close
