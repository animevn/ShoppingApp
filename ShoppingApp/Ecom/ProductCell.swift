import UIKit

class ProductCell:UICollectionViewCell{
    
    @IBOutlet weak var lbProduct: UILabel!
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lbPrice: UILabel!
    
    deinit {
        print("The class \(type(of: self)) was remove from memory")
    }
    
    
}
