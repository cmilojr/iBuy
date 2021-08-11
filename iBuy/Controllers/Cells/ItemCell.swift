//
//  ItemCell.swift
//  iBuy
//
//  Created by Camilo Jimenez on 9/08/21.
//

import UIKit

class ItemCell: UICollectionViewCell {
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var container: UIView!
    
    func setup(productTitle: String, productPrice: Double, productImageUrl: String) {
        self.viewHeight.constant = self.layer.bounds.height / 3
        self.productTitle.text = productTitle
        self.productPrice.text = "$ \(String(productPrice))"
        print(productImageUrl)
        self.productImage.download(from: productImageUrl)
    }
}

