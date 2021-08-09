//
//  CetegoryCell.swift
//  iBuy
//
//  Created by Camilo Jimenez on 8/08/21.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var titleHeight: NSLayoutConstraint!
    @IBOutlet weak var container: UIView!
    
    func setup() {
        titleHeight.constant = container.layer.bounds.height - 20
    }
}
