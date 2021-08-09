//
//  Prueba.swift
//  iBuy
//
//  Created by Camilo Jimenez on 6/08/21.
//

import UIKit

class DashboardVC: UIViewController {
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var searchButton: UIButton!
    
    fileprivate func setupCollectionView() {
        let nib = UINib(nibName: Constants.CellIdentifier.categoryCell, bundle: nil)
        categoriesCollectionView.register(nib, forCellWithReuseIdentifier: Constants.CellIdentifier.categoryCell)
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        categoriesCollectionView.backgroundColor = .none
        categoriesCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    fileprivate func setupSearchButton() {
        searchButton.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        searchButton.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        searchButton.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        let spacing: CGFloat = 10; // the amount of spacing to appear between image and title
        searchButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: spacing);
        searchButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: 0);

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
                
        setupCollectionView()
        setupSearchButton()
    }
}

extension DashboardVC: UICollectionViewDataSource {
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifier.categoryCell, for: indexPath) as! CategoryCell
        cell.setup()
        return cell
    }
}

extension DashboardVC: UICollectionViewDelegateFlowLayout {
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((collectionView.frame.width - 15) / 2) // 15 because of paddings
        let height = ((collectionView.frame.width - 15) / 4)

        return CGSize(width: width, height: height)
   }
}

extension DashboardVC: UICollectionViewDelegate {
}
