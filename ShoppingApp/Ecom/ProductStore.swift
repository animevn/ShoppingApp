import Foundation
import SwiftyJSON

protocol ProductDelegate{
    func getProduct(block:@escaping (String)->Void)
}

class ProductStore{
    
    private struct Keys{
        static let ID = "id"
        static let name = "name"
        static let price = "price"
        static let description = "description"
        static let related_ids = "related_ids"
        static let categories = "categories"
        static let images = "images"
    }
    
    private let delegate:ProductDelegate
   
    
    init(delegate:ProductDelegate){
        self.delegate = delegate
    }
    
    func retriev(completion:@escaping ([Product])->Void){
        
        delegate.getProduct{
            
            if let data = $0.data(using: .utf8, allowLossyConversion: false){
                if let json = try? JSON(data: data){
                    let products:[Product] = json.arrayValue.map{product in
                        
                        let related_ids = product[Keys.related_ids].arrayValue.map{
                            return $0.intValue
                        }
                        let categories = product[Keys.categories].arrayValue.map{
                            return Category(id: $0["id"].intValue, name: $0["name"].stringValue)
                        }
                        let images = product[Keys.images].arrayValue.map{
                            return Image(id: $0["id"].intValue, src: $0["src"].stringValue)
                        }
                        return Product(
                            id: product[Keys.ID].intValue,
                            name: product[Keys.name].stringValue,
                            price: product[Keys.price].stringValue,
                            description: product[Keys.description].stringValue,
                            related_ids: related_ids,
                            categories: categories,
                            images: images)
                    }
                    completion(products)
                }
            }
        }
    }
    
    
    
    
    
}
