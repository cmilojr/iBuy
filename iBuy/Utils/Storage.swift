//
//  Storage.swift
//  iBuy
//
//  Created by Camilo Jimenez on 6/08/21.
//

import Foundation

struct Storage {
    private let defaults = UserDefaults.standard
    static let shared = Storage()
    private init() {}
    
    func setLocalCountry(_ country: CountryModel) {
        do {
            let data = try JSONEncoder().encode(country)
            defaults.set(data, forKey: Constants.LocalStorageKey.userCountry)
            defaults.synchronize()
        } catch {
            print(error)
        }
    }
    
    func getLocalCountry() -> CountryModel? {
        guard let data = defaults.data(forKey: Constants.LocalStorageKey.userCountry) else { return nil}
        do {
            return try JSONDecoder().decode(CountryModel.self, from: data)
        } catch {
            print(error)
            return nil
        }
    }
}

