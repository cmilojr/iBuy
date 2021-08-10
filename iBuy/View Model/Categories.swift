//
//  Categorys.swift
//  iBuy
//
//  Created by Camilo Jimenez on 9/08/21.
//

import Foundation

struct Categories {
    func getCategories(completion: @escaping ([CategoryModel]?, Error?) -> Void) {
        Networking.shared.getList(URL(string: Constants.API.categoriesAvailableUrl)!) { (res: [CategoryModel]?, error: Error?) in
            if let err = error {
                completion(nil, err)
            } else if let countries = res {
                completion(countries, nil)
            }
        }
    }
}
