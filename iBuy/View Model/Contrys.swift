//
//  GetContrys.swift
//  iBuy
//
//  Created by Camilo Jimenez on 5/08/21.
//

import Foundation

struct Contrys {
    func getContrys(completion: @escaping ([ContryModel]?, Error?) -> Void) {
        Networking.shared.getList(URL(string: contrysUrl)!) { (res: [ContryModel]?, error: Error?) in
            if let err = error {
                completion(nil, err)
            } else if let contrys = res {
                completion(contrys, nil)
            }
        }
    }
}
