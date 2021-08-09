//
//  GetContrys.swift
//  iBuy
//
//  Created by Camilo Jimenez on 5/08/21.
//

import Foundation

struct Countries {
    func getCountries(completion: @escaping ([CountryModel]?, Error?) -> Void) {
        Networking.shared.getList(URL(string: Constants.API.countriesUrl)!) { (res: [CountryModel]?, error: Error?) in
            if let err = error {
                completion(nil, err)
            } else if let countries = res {
                completion(countries, nil)
            }
        }
    }
    
    func saveSelectedCountry(_ country: CountryModel) {
        Storage.shared.setLocalCountry(country)
    }
}
