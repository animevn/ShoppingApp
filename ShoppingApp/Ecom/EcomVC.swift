import UIKit
import SDWebImage

class EcomViewController: UICollectionViewController {
    
    static func instantiate()->UIViewController{
        return UIStoryboard(name: "Ecom", bundle: nil).instantiateInitialViewController()!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "E-commerce"
    }


}

extension EcomViewController{
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell", for: indexPath) as! ProductCell
        
        cell.lbName.text = "Flower"
        cell.lbPrice.text = "Buquet"
        cell.lbPrice.text = "$123"
        cell.ivImage.sd_setImage(
            with: URL(string: "https://hoagiare.net/wp-content/uploads/2018/11/sv06.jpg"),
            completed: nil)
        cell.ivImage.contentMode = .scaleToFill
        return cell
    }
    
}
