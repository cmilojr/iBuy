//
//  Search.swift
//  iBuy
//
//  Created by Camilo Jimenez on 10/08/21.
//

import Foundation

struct SearchVM {
    func getRelatedItems(itemName: String, completion: @escaping (ProductsResponse?, Error?) -> Void) {
        Networking.shared.getItems(URL(string: Constants.API.searchItems(item: itemName))!) { (res: ProductsResponse?, error: Error?) in
            if let err = error {
                completion(nil, err)
            } else if let countries = res {
                completion(countries, nil)
            }
        }
    }
}
