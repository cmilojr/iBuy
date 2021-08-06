//
//  CellController.swift
//  iBuy
//
//  Created by Camilo Jimenez on 5/08/21.
//

import UIKit

class ContryCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var checkmarkImageView: UIImageView?
    @IBOutlet weak var contryFlag: UIImageView?
    @IBOutlet weak var container: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
            container?.backgroundColor = UIColor(named: "MintGreen")
            checkmarkImageView?.isHidden = false
        } else {
            container?.backgroundColor = UIColor.white
            checkmarkImageView?.isHidden = true
        }
    }
}

