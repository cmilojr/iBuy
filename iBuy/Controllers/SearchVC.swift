//
//  SearchVC.swift
//  iBuy
//
//  Created by Camilo Jimenez on 9/08/21.
//

import UIKit

class SearchVC: UIViewController, UISearchControllerDelegate {
    @IBOutlet weak var itemsContainerView: UICollectionView!
    var itemsList: itemsResponse?
    
    fileprivate func setupCollectionView() {
        let nib = UINib(nibName: Constants.CellIdentifier.itemCell, bundle: nil)
        itemsContainerView.register(nib, forCellWithReuseIdentifier: Constants.CellIdentifier.itemCell)
        itemsContainerView.dataSource = self
        itemsContainerView.delegate = self
        itemsContainerView.backgroundColor = .none
        itemsContainerView.collectionViewLayout = UICollectionViewFlowLayout()
    }

    fileprivate func setupNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = Constants.CustomColors.green
        appearance.titleTextAttributes = [.foregroundColor: Constants.CustomColors.mintGreen!]
        appearance.largeTitleTextAttributes = [.foregroundColor: Constants.CustomColors.mintGreen!]
        self.navigationController?.navigationBar.tintColor = Constants.CustomColors.mintGreen
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.compactAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationController?.navigationBar.backItem?.title = ""

    }
    fileprivate func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        searchController.searchBar.barTintColor = .white
        searchController.searchBar.inputView?.backgroundColor = .white
        searchController.searchBar.placeholder = "Ej: Bolso, Zapatos"
        searchController.searchBar.tintColor = .white
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = true
        definesPresentationContext = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupCollectionView()
        setupSearchController()
    }
}

extension SearchVC: UICollectionViewDataSource {
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsList?.results.count ?? 0
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifier.itemCell, for: indexPath) as! ItemCell
        cell.setup(productTitle: itemsList?.results[indexPath.row].title ?? "", productPrice: itemsList?.results[indexPath.row].price ?? 0, productImageUrl: itemsList?.results[indexPath.row].thumbnail ?? "")
        return cell
    }
}

extension SearchVC: UICollectionViewDelegateFlowLayout {
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((collectionView.frame.width - 15) / 2) // 15 because of paddings
        let height = ((collectionView.frame.width - 15) / 1)

        return CGSize(width: width, height: height)
   }
}


extension SearchVC: UICollectionViewDelegate {
    
}
