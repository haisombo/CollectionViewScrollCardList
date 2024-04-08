//
//  ReceiptTableViewCell.swift
//  UICollectionView2023-04-05
//
//  Created by Hai Sombo on 4/5/24.
//

import UIKit

class ReceiptTableViewCell: UITableViewCell {

    // MARK: - @IBOutlet
    @IBOutlet weak var priceLabel       : UILabel!
    @IBOutlet weak var nameLabel        : UILabel!
    @IBOutlet weak var dateLabel        : UILabel!
    @IBOutlet weak var typeLabel        : UILabel!
    @IBOutlet weak var bgViewContent    : UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    // MARK: - Funtion
    func configCell(receipt: Receipt.object) {
        
        self.nameLabel.text  = receipt.name
        self.dateLabel.text  = receipt.date
        self.typeLabel.text  = receipt.type
        self.priceLabel.text = receipt.price
        
    }
}
