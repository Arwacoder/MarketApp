//
//  Category.swift
//  Market
//
//  Created by Arwa Mahdai on 3/21/20.
//  Copyright © 2020 Arwa Mahdai. All rights reserved.
//

import Foundation
import UIKit

class Category {
    
    var id: String
    var name: String
    var image: UIImage?
    var imageName: String?
    
    
    
    init(_name: String, _imageName: String) {
        id = ""
        name = _name
        imageName = _imageName
        image = UIImage(named: _imageName)
        
    }
    init(_dictionary: NSDictionary) {
        id = _dictionary[kObjectId] as! String
        name = _dictionary[kName] as! String
        image = UIImage(named: _dictionary[kImageName] as? String ?? "")
        
        
    }
}
//Mark: Download category from firebase

func downloadCategoriesFromFirebase(completion: @escaping (_ categoryArray: [Category]) -> Void) {
    
    var categoryArray: [Category] = []
    FirebaseReference(.Category).getDocuments { (snapshot, error) in
        
        guard let snapshot = snapshot else {
            completion(categoryArray)
            return
        }
        if !snapshot.isEmpty {
            
            for categoryDict in snapshot.documents {
                categoryArray.append(Category(_dictionary: categoryDict.data() as NSDictionary))

            }
            
            
        }
        completion(categoryArray)
    }
    
}
//Mark: Save category function
func saveCategoryToFirebase(_ category: Category) {
    
    let id = UUID().uuidString
    category.id = id
    
    FirebaseReference(.Category).document(id).setData(categoryDictionaryFrom(category) as! [String : Any])
    
}
// Mark: Helpers

func categoryDictionaryFrom(_ category: Category) -> NSDictionary {
    return NSDictionary(objects: [category.id, category.name, category.imageName], forKeys: [kObjectId as NSCopying, kName as NSCopying, kImageName as NSCopying])
}

//use only one time
//func createCategorySet() {
//
//    let womenClothing = Category(_name: "women's Clothing & Accessories", _imageName: "womenCloth")
//    let footWaer = Category(_name: "Footwaer", _imageName: "footWaer")
//    let electronics = Category(_name: "Electronics", _imageName: "electronics")
//    let menClothing = Category(_name: "Men's Clothing & Accessories" , _imageName: "menCloth")
//    let health = Category(_name: "Health & Beauty", _imageName: "health")
//    let baby = Category(_name: "Baby Stuff", _imageName: "baby")
//    let home = Category(_name: "Home & Kitchen", _imageName: "home")
//    let car = Category(_name: "Automobiles & Motorcyles", _imageName: "car")
//    let luggage = Category(_name: "Luggage & bags", _imageName: "luggage")
//    let jewelery = Category(_name: "Jewelery", _imageName: "jewelery")
//    let hobby =  Category(_name: "Hobby, Sport, Traveling", _imageName: "hobby")
//    let pet = Category(_name: "Pet products", _imageName: "pet")
//    let industry = Category(_name: "Industry & Business", _imageName: "industry")
//    let garden = Category(_name: "Garden supplies", _imageName: "garden")
//    let camera = Category(_name: "Cameras & Optics", _imageName: "camera")
//
//    let arrayOfCategories = [womenClothing, footWaer, electronics, menClothing, health, baby, home, car, luggage, jewelery, hobby, pet, industry, garden, camera]
//
//    for category in arrayOfCategories {
//        saveCategoryToFirebase(category)
//    }
//
//}
//
