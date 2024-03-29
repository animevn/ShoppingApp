import Foundation

class CartStore{
    
    private var products = [Int:Product]()
    private let gateway:CartGateway
    
    init(gateway:CartGateway){
        self.gateway = gateway
    }
    
    func containsProductID(productID:Int)->Bool{
        return products[productID] != nil
    }
    
    func addProduct(product:Product){
        products[product.id] = product
        gateway.addProductID(productID: product.id)
    }
    
    func removeProduct(product:Product){
        products.removeValue(forKey: product.id)
        gateway.removeProductID(productID: product.id)
    }
    
    func buy(){
        products = [:]
        gateway.buy()
    }
    
    func count()->Int{
        return products.count
    }
    
}
