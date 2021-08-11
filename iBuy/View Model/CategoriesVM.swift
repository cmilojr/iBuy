//
//  Categorys.swift
//  iBuy
//
//  Created by Camilo Jimenez on 9/08/21.
//

import Foundation

struct CategoriesVM {
    func getCategories(completion: @escaping ([CategoryModel]?, Error?) -> Void) {
        Networking.shared.getList(URL(string: Constants.API.CategoriesAvailable())!) { (res: [CategoryModel]?, error: Error?) in
            if let err = error {
                completion(nil, err)
            } else if let countries = res {
                completion(countries, nil)
            }
        }
    }
    
    func getItemInCategoryAvailable(category: String, completion: @escaping (itemsResponse?, Error?) -> Void) {
        Networking.shared.getItems(URL(string: Constants.API.ItemInCategoryAvailable(category))!) { (res: itemsResponse?, error: Error?) in
            if let err = error {
                completion(nil, err)
            } else if let countries = res {
                completion(countries, nil)
            }
        }
    }
}
