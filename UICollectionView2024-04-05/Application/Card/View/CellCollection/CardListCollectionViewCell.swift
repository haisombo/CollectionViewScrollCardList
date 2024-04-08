//
//  CardListCollectionViewCell.swift
//  UICollectionView2023-04-05
//
//  Created by Hai Sombo on 4/5/24.
//

import UIKit

class CardListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var imageCardType    : UIImageView!
    @IBOutlet weak var cvcLable         : UILabel!
    @IBOutlet weak var validThruLabel   : UILabel!
    @IBOutlet weak var cardNumberLabel  : UILabel!
    @IBOutlet weak var bgCardATM        : UIImageView!
    
    // MARK: - Funtion
    func configCell (cardListRec : CardListData.Card.object) {
        self.imageCardType.image    = UIImage(named: cardListRec.cardType ?? "")
        self.cvcLable.text          = cardListRec.cvc
        self.validThruLabel.text    = cardListRec.validThru
        self.cardNumberLabel.text   = cardListRec.cardNumber
        
    }
    
}
