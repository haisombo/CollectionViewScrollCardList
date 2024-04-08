//
//  HistoryCollectionViewCell.swift
//  UICollectionView2023-04-05
//
//  Created by Hai Sombo on 4/5/24.
//

import UIKit

class HistoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties & Variable
    var owner      : UIViewController!
    var receiptRec : [Receipt.object] = []
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        self.tableView.delegate     = self
        self.tableView.dataSource   = self
    }
    
    // MARK: - Funtion
    func configCell(receiptRec: [Receipt.object]) {
        
        self.receiptRec = receiptRec
        self.tableView.reloadData()
        
    }
    
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension HistoryCollectionViewCell : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return receiptRec.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptTableViewCell") as! ReceiptTableViewCell
        cell.configCell(receipt: receiptRec[indexPath.item])
        
        return cell
    }

}
