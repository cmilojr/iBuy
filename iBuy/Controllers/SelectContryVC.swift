//
//  ViewController.swift
//  iBuy
//
//  Created by Camilo Jimenez on 3/08/21.
//

import UIKit

class SelectContryVC: UIViewController {
    
    @IBOutlet weak var contryTable: UITableView!
    @IBOutlet weak var continueButton: UIButton!
    lazy var contrys = [ContryModel]()
    let contryViewModel = Contrys()
    lazy var selectedContry: ContryModel? = nil {
        didSet {
            guard let newValue = selectedContry else { return }
            contryViewModel.saveSelectedContry(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        contryTableConf()
        contryViewModel.getContrys { contrysRes, error in
            if let e = error {
                print(e)
            } else if let contrys = contrysRes {
                print(contrys)
                self.contrys = contrys
                self.contryTable.reloadData()
            }
        }
    }
    
    private func contryTableConf() {
        let nib = UINib(nibName: "ContryCell", bundle: nil)
        contryTable.register(nib, forCellReuseIdentifier: "ContryCell")
        contryTable.dataSource = self
        contryTable.delegate = self
        contryTable.separatorStyle = .none
        contryTable.showsVerticalScrollIndicator = false
        contryTable.backgroundColor = .none
    }
}

extension SelectContryVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contrys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContryCell", for: indexPath) as! ContryCell
        cell.titleLabel?.text = contrys[indexPath.row].name
        cell.contryFlag?.image = UIImage(named: contrys[indexPath.row].id)
        
        return cell
    }
}

extension SelectContryVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedContry = contrys[indexPath[1]]
    }
}
