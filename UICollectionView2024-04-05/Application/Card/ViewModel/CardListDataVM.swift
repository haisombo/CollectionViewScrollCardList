//
//  CardListDataVM.swift
//  UICollectionView2023-04-05
//
//  Created by Hai Sombo on 4/5/24.
//

import Foundation

class CardListDataVM {
    
    var cardListDataModel = [CardListDataModel <Any>]()
    
    func getCardListData () {
        
        // card
        let cardListRec = [
            CardListData.Card.object(
                cardNumber : "3333  * * * *   * * * *  2222",
                validThru  : "11/26",
                cvc        : "555",
                cardType   : "visa"),
            CardListData.Card.object(
                cardNumber : "8888  * * * *   * * * *  3333",
                validThru  : "11/26",
                cvc        : "444",
                cardType   : "mastercard"),
            CardListData.Card.object(
                cardNumber : "7777  * * * *  * * * *  1111",
                validThru  : "11/26",
                cvc        : "446",
                cardType   : "visa"),
            CardListData.Card.object(
                cardNumber : "7777  * * * *  * * * *  1111",
                validThru  : "11/26",
                cvc        : "446",
                cardType   : "mastercard"),
            CardListData.Card.object(
                cardNumber : "7777  * * * *  * * * *  1111",
                validThru  : "11/26",
                cvc        : "446",
                cardType   : "visa"),
            CardListData.Card.object(
                cardNumber : "3333  * * * *  * * * *  1111",
                validThru  : "11/26",
                cvc        : "446",
                cardType   : "mastercard"),
        ]
        
        // amountOfEachCard
        let amountOfEachCardRec = [
        
            CardListData.AmountOfEachCard.object(value: "600,000 원"),
            CardListData.AmountOfEachCard.object(value: "300,000 원"),
            CardListData.AmountOfEachCard.object(value: "100,000 원"),
            CardListData.AmountOfEachCard.object(value: "500,000 원"),
            CardListData.AmountOfEachCard.object(value: "800,000 원"),
            CardListData.AmountOfEachCard.object(value: "900,000 원"),
        ]
        
        //receciptRec1
        let receciptRec1 = [
            Receipt.object(name: "iceLate",    date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",    date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",    date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",    date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",    date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",    date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",    date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",    date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",    date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
        ]
        //receciptRec2
        let receciptRec2 = [
            Receipt.object(name: "Espresso",     date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",      date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",      date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",      date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",      date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",      date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",      date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",      date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
        ]
        
        //receciptRec3
        let receciptRec3 = [
            Receipt.object(name: "Espresso",     date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",      date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",      date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",      date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",      date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",      date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",      date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
            Receipt.object(name: "iceLate",      date: "5월 18일(수)", type: "기업1234", price: "500,000 원"),
        ]
        //Assign Data
        cardListDataModel = [
        
            CardListDataModel(rowType: .Banner   , value:  nil ),
            CardListDataModel(rowType: .Card   , value:  cardListRec ),
            CardListDataModel(rowType: .AmountOfEachCard   , value:  amountOfEachCardRec ),
            CardListDataModel(rowType: .Receipt   , value:  [receciptRec1,receciptRec2 , receciptRec3] )
        ]
        
        
    }

    
}
