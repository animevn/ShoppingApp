import Foundation

class Gateway:ProductDelegate{
    
    private let url = "https://hanoihoa.net/wp-json/wc/v3/products?"
    private let id = "ck_460f4e9ec4d88e5830ba331934df10e9cb6a7407"
    private let secret = "cs_d7f1aee36cceacaf94b93398dc6023a21c8ccd65"
    
    
    private func performeUrlRequest(url:URL)->String?{
        return try? String(contentsOf: url, encoding: .utf8)
    }
    
    func getProduct(block: @escaping (String) -> Void) {
        let stringUrl = "\(url)consumer_key=\(id)&consumer_secret=\(secret)&per_page=100"
        guard let url = URL(string: stringUrl) else {return}
        
        DispatchQueue.global().async {
            guard let string = self.performeUrlRequest(url: url) else {return}
            block(string)
        }
        
        
        
    }
    
    
}
