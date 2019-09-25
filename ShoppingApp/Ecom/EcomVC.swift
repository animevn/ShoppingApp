import UIKit
import SDWebImage

class EcomViewController: UICollectionViewController{
    
    let productStore = ProductStore(delegate: Gateway())
    private var products = [Product]()
    
    static func instantiate()->UIViewController{
        return UIStoryboard(name: "Ecom", bundle: nil).instantiateInitialViewController()!
    }
    
    let columnLayout = ColumnFlowLayout(
        cellsPerRow: 2,
        minimumInteritemSpacing: 10,
        minimumLineSpacing: 10,
        sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "E-commerce"
        collectionView.collectionViewLayout = columnLayout
        collectionView.contentInsetAdjustmentBehavior = .always
        
        productStore.retriev{[weak self] products in
            self?.products = products
            print(products.count)
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }


}

extension EcomViewController{
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell", for: indexPath) as! ProductCell
        
        let product = products[indexPath.row]
        cell.lbPrice.text = "$\(product.price)"
        cell.lbProduct.text = product.name
        cell.ivImage.sd_setImage(with: URL(string: product.images[0].src), completed: nil)
        cell.backgroundColor = .clear
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 8
        return cell
    }
    
}
