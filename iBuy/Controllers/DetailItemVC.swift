//
//  DetailItemVC.swift
//  iBuy
//
//  Created by Camilo Jimenez on 10/08/21.
//

import UIKit

class DetailItemVC: UIViewController {
    @IBOutlet weak var titleOfProduct: UILabel!
    @IBOutlet weak var oldPriceProduct: UILabel!
    @IBOutlet weak var newPriceProduct: UILabel!
    @IBOutlet weak var discountProduct: UILabel!
    @IBOutlet weak var feeProduct: UILabel!
    @IBOutlet weak var productCondition: UILabel!
    @IBOutlet weak var shipping: UILabel!
    @IBOutlet weak var mercadoPagoAccepted: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    var product: ProductResponse?
    
    fileprivate func strikethroughLabel(oldPrice: String) -> NSMutableAttributedString {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: oldPrice)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
    
    fileprivate func setupDetail(_ product: ProductResponse) {
        self.titleOfProduct.text = product.title
        if let oldPrice = product.original_price {
            self.oldPriceProduct.attributedText = strikethroughLabel(oldPrice: "$ \(oldPrice.formattedWithSeparator)")

            self.discountProduct.text = "\(calculateDiscount(oldPrice: oldPrice, newPrice: product.price!))% OFF"
        } else {
            self.oldPriceProduct.isHidden = true
            self.discountProduct.isHidden = true
        }
        self.newPriceProduct.text = "$ \(String(describing: product.price!.formattedWithSeparator))"
        self.productImage.download(from: product.thumbnail!)
        // TODO - Que hacer si no llega imagen
        self.feeProduct.text = "Págalo a 36 Cuotas de $ \(Int(product.price!/36).formattedWithSeparator)."
        self.mercadoPagoAccepted.text = product.accepts_mercadopago! ? "Este producto acepta mercado pago!." : "Este producto no acepta mercado pago."
        self.shipping.text = product.shipping.free_shipping! ? "Envio gratuito!." : "Envio por calcular."
        self.productCondition.text = product.condition! == "new" ? "Nuevo." : "Usado."
    }
    
    private func calculateDiscount(oldPrice: Int, newPrice: Int) -> Int {
        return (oldPrice * 100)/newPrice - 100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Detalle del producto"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupDetail(product!)
    }
}
