//
//  ProductCell.swift
//  iBuy
//
//  Created by Camilo Jimenez on 9/08/21.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var selectedLayer: UIView!
    @IBOutlet weak var discountIcon: UIImageView!
    
    func setup(productTitle: String, productPrice: Int, productImageUrl: String, oldPrice: Int) {
        self.viewHeight.constant = self.layer.bounds.height / 3
        self.productTitle.text = productTitle
        self.productPrice.text = "$ \(productPrice.formattedWithSeparator)"
        self.productImage.download(from: productImageUrl)
        self.discountIcon.isHidden = !(productPrice < oldPrice)
    }
    
    override var isSelected: Bool {
        didSet {
            self.selectedLayer.isHidden = !isSelected
        }
    }
}

