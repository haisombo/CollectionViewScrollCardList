//
//  CardListVC.swift
//  UICollectionView2023-04-05
//
//  Created by Hai Sombo on 4/5/24.
//

import UIKit

class CardListVC: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties & Veriable
    var cardListDataVM            = CardListDataVM()
    var indexAmountOfEachCardRec  = 0
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cardListDataVM.getCardListData()
        self.tableView.dataSource = self
        self.tableView.delegate   = self
    }
    // MARK: - Funtion
    func reloadData(indexAmountOfEachCardRec: Int) {
        self.indexAmountOfEachCardRec = indexAmountOfEachCardRec
        self.tableView.reloadData()
    }

}

// MARK: - UITableViewDelegate , UITableViewDataSource
extension CardListVC  : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardListDataVM.cardListDataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let rowType = cardListDataVM.cardListDataModel [indexPath.row].rowType
        
        switch rowType {
        case   .Banner :
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell") as! BannerTableViewCell
            return cell
            
        case .Card :
            
            let cardListRec = cardListDataVM.cardListDataModel[indexPath.row].value as! [CardListData.Card.object]
            if cardListRec.count == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "NoneCardListTableViewCell") as! NoneCardListTableViewCell
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CardListTableViewCell") as! CardListTableViewCell
                cell.viewController = self
                cell.configCell(cardListRec: cardListRec)
                return cell
            }

        case .AmountOfEachCard:
            
            let amountOfEachCardRec = cardListDataVM.cardListDataModel[indexPath.row].value as! [CardListData.AmountOfEachCard.object]
            
            if amountOfEachCardRec.count != 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCardCell") as! DescriptionCardCell
                cell.viewBg.layer.cornerRadius = 12.0 
                cell.configCell(amountOfEachCardRec: amountOfEachCardRec[indexAmountOfEachCardRec])
                return cell
            } else {
                return UITableViewCell()
            }
            
        case .Receipt:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell") as! HistoryTableViewCell
            cell.configCell ( dataReceipt : cardListDataVM.cardListDataModel[indexPath.row].value as! [Any])
            cell.owner = self
            return cell
            
            
        default :
            return UITableViewCell()
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowType = cardListDataVM.cardListDataModel [indexPath.row].rowType
        
        switch rowType {
        case .Receipt :
            
            let receiptRec = cardListDataVM.cardListDataModel[indexPath.row].value as! [Any]
            return CGFloat(((receiptRec[0] as AnyObject).count * 82))
        default :
            return UITableView.automaticDimension
        
        }
    }
    
}
