//
//  itemsResponse.swift
//  iBuy
//
//  Created by Camilo Jimenez on 10/08/21.
//

import Foundation

struct itemsResponse: Decodable {
    let results: [itemResponse]
}

struct itemResponse: Decodable {
    let id: String?
    let title: String?
    let price: Int?
    let currency_id: String?
    let available_quantity: Int?
    let condition: String?
    let category_id: String?
    let shipping: Shipping
    let address: Address
    let original_price: Double?
    let thumbnail: String
}
struct Address: Decodable {
    let city_name: String?
}

struct Shipping: Decodable {
    let free_shipping: Bool?
}
