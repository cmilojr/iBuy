//
//  itemsResponse.swift
//  iBuy
//
//  Created by Camilo Jimenez on 10/08/21.
//

import Foundation

struct ProductsResponse: Decodable {
    let results: [ProductResponse]
}

struct ProductResponse: Decodable {
    let id: String?
    let title: String?
    let price: Int?
    let currency_id: String?
    let available_quantity: Int?
    let condition: String?
    let shipping: Shipping
    let address: Address
    let original_price: Int?
    let thumbnail: String?
    let permalink: String?
    let accepts_mercadopago: Bool?
    let buying_mode: String?
    let category_id: String?
}
struct Address: Decodable {
    let city_name: String?
    let state_name: String?
}

struct Shipping: Decodable {
    let free_shipping: Bool?
    let store_pick_up: Bool?
}
