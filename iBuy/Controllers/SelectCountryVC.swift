//
//  ViewController.swift
//  iBuy
//
//  Created by Camilo Jimenez on 3/08/21.
//

import UIKit

class SelectCountryVC: UIViewController {
    
    @IBOutlet weak var countryTable: UITableView!
    @IBOutlet weak var continueButton: UIButton!
    lazy var countries = [CountryModel]()
    let countryViewModel = Countries()
    lazy var selectedCountry: CountryModel? = nil {
        didSet {
            guard let newValue = selectedCountry else { return }
            countryViewModel.saveSelectedCountry(newValue)
        }
    }
    
    fileprivate func countryTableConf() {
        let nib = UINib(nibName: Constants.CellIdentifier.countryCell, bundle: nil)
        countryTable.register(nib, forCellReuseIdentifier: Constants.CellIdentifier.countryCell)
        countryTable.dataSource = self
        countryTable.delegate = self
        countryTable.separatorStyle = .none
        countryTable.showsVerticalScrollIndicator = false
        countryTable.backgroundColor = .none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        countryTableConf()
        countryViewModel.getCountries { countryRes, error in
            if let e = error {
                print(e)
            } else if let countries = countryRes {
                self.countries = countries
                self.countryTable.reloadData()
            }
        }
    }
}

extension SelectCountryVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier.countryCell, for: indexPath) as! CountryCell
        cell.setup(countryTitle: countries[indexPath.row].name, flagImage: UIImage(named: countries[indexPath.row].id)!)
        
        return cell
    }
}

extension SelectCountryVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCountry = countries[indexPath[1]]
    }
}
