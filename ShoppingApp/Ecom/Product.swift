import Foundation

struct Category{
    let id:Int
    let name:String
}

struct Image{
    let id:Int
    let src:String
}

struct Product{
    let id:Int
    let name:String
    let price:String
    let description:String
    let related_ids:[Int]
    let categories:[Category]
    let images:[Image]
}

