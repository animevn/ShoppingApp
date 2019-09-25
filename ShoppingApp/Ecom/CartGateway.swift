import Foundation

protocol CartGateway{
    
    func addProductID(productID:Int)
    func removeProductID(productID:Int)
    func buy()
}

class LocalCartGateway:CartGateway{
    
    func addProductID(productID: Int) {
        
    }
    
    func removeProductID(productID: Int) {
        
    }
    
    func buy() {
         
    }
}
