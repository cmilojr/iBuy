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
    
    func setLocalContry(_ contry: ContryModel) {
        do {
            let data = try JSONEncoder().encode(contry)
            defaults.set(data, forKey: userContry)
            defaults.synchronize()
        } catch {
            print(error)
        }
    }
    
    func getLocalContry() -> ContryModel? {
        guard let data = defaults.data(forKey: userContry) else { return nil}
        do {
            return try JSONDecoder().decode(ContryModel.self, from: data)
        } catch {
            print(error)
            return nil
        }
    }
}

