//
//  CardListDataModel.swift
//  UICollectionView2023-04-05
//
//  Created by Hai Sombo on 4/5/24.
//

import Foundation

enum CardListRowType : String , CaseIterable     {
    
    case Banner
    case Card
    case AmountOfEachCard
    case Receipt
    
}

struct CardListDataModel <T> {
    var rowType : CardListRowType?
    var value   : T?
}

// card data
struct CardListData {
    struct Card {
        var object : [object]
        
        struct object {
            
            let cardNumber  : String?
            let validThru   : String?
            let cvc         : String?
            let cardType    : String?
            
        }
    }
    
    //AmountOfEachCard
    struct AmountOfEachCard {
        
        var object : [object]
        
        struct object {
            let value       : String?
        }
    }
    
}

// Receipt
struct Receipt {
    
    var object      : [object]
    
    struct object {
        let name    : String?
        let date    : String?
        let type    : String?
        let price   : String?
    }
}
