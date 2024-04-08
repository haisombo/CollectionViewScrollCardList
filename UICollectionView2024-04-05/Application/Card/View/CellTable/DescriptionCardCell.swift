//
//  DescriptionCardCell.swift
//  UICollectionView2023-04-05
//
//  Created by Hai Sombo on 4/5/24.
//

import UIKit

class DescriptionCardCell: UITableViewCell {

    // MARK: - @IBOutlet
    @IBOutlet weak var titleLabel   : UILabel!
    @IBOutlet weak var valueTitle   : UILabel!
    @IBOutlet weak var viewBg       : UIView!
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK: - Funtion
    func configCell(amountOfEachCardRec : CardListData.AmountOfEachCard.object) {
        self.valueTitle.text = amountOfEachCardRec.value
    }
    
}
