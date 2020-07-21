//
//  Item.swift
//  Market
//
//  Created by Arwa Mahdai on 4/19/20.
//  Copyright © 2020 Arwa Mahdai. All rights reserved.
//

import Foundation
import UIKit
class Item {
    var id: String!
    var categoryId: String!
    var name: String!
    var description: String!
    var price: String!
    var imageLinks: String!

    init() {
    }
    
    init(_dictionary: NSDictionary){
       id = _dictionary[kObjectId] as? String
        categoryId = _dictionary[kCategoryId] as? String
        name = _dictionary[kName] as? String
       description = _dictionary[kDescription] as? String
       price = _dictionary[kPrice] as? String
        imageLinks = _dictionary[kImageLinks] as? String

    }

}

//Mark: Save item func
func saveItemToFirestore(_ item:Item) {
    
    FirebaseReference(.Items).document(item.id).setData(itemDictionaryFrom(item) as! [String : Any])
}




//Mark: Helper functions
func itemDictionaryFrom(_ item:Item) -> NSDictionary {
    return NSDictionary(objects: [item.id, item.categoryId, item.name,item.description, item.price, item.imageLinks], forKeys: [kObjectId as NSCopying, kName as NSCopying, kDescription as NSCopying, kPrice as NSCopying, kImageLinks as NSCopying])
}
