//
//  FirebaseCollectionReference.swift
//  Market
//
//  Created by Arwa Mahdai on 3/20/20.
//  Copyright © 2020 Arwa Mahdai. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String {
    case User
    case Category
    case Items
    case Basket
    
}
func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    
    return Firestore.firestore().collection(collectionReference.rawValue)
    
    
      
}








