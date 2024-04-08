//
//  CardListTableViewCell.swift
//  UICollectionView2023-04-05
//
//  Created by Hai Sombo on 4/5/24.
//

import UIKit

class CardListTableViewCell: UITableViewCell {

    // MARK: - @IBOutlet
    @IBOutlet weak var collectionView   : UICollectionView!
    
   // MARK: - Properties & Variable
    var cardListRec             : [CardListData.Card.object] = [] // get cardListrec from CardList VC
    var viewController          : UIViewController? = nil  // for prerent vc in CardListVc
    var currectSelectedIndex    = 0
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // setup view
        self.setUpView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    // MARK: - Funtion
    func setUpView () {
        
        self.collectionView.delegate    = self
        self.collectionView.dataSource  = self
        self.collectionView.collectionViewLayout     = CardCollectionViewFlowLayout()
        
    }
    
    func configCell (cardListRec : [CardListData.Card.object]) {
        self.cardListRec = cardListRec
        self.collectionView.reloadData()
    }

}

// MARK: - UICollectionViewDelegate , UICollectionViewDataSource
extension CardListTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardListRec.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardListCollectionViewCell",for: indexPath) as! CardListCollectionViewCell
        cell.bgCardATM.layer.cornerRadius   = 12.0 
        cell.configCell(cardListRec: cardListRec[indexPath.item])
        if currectSelectedIndex == indexPath.row {
            cell.transformToLarge()
        }
        return cell
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let currentCell = collectionView.cellForItem(at: IndexPath (row: Int(currectSelectedIndex), section: 0))
        currentCell?.transformToStandard()
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        guard scrollView == collectionView else { return  }
        // changing content offset to where to collection view stop scrolling
        targetContentOffset.pointee = scrollView.contentOffset
        
        let flowLayout                = collectionView.collectionViewLayout as! CardCollectionViewFlowLayout
        let cellWidthIncludingSpacing = flowLayout.itemSize.width + flowLayout.minimumLineSpacing
        let offset                    = targetContentOffset.pointee
        let horizontalVelocity        = velocity.x
        
        var selectedIndex             = currectSelectedIndex
        
        switch horizontalVelocity {
            // On user swiping
        case _ where horizontalVelocity > 0:
            selectedIndex = currectSelectedIndex + 1
            
        case _ where horizontalVelocity < 0:
            selectedIndex = currectSelectedIndex - 1
            
            // On user dragging
        case _ where horizontalVelocity == 0:
            let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
            let roundedIndex = round(index)
            
            selectedIndex = Int(roundedIndex)
            
        default:
            print("Incorrect velocity for collection view")
        }
        
        let safeIndex         = max(0, min(selectedIndex, cardListRec.count - 1))
        let selectedIndexPath = IndexPath(row: safeIndex, section: 0)
        
        flowLayout.collectionView!.scrollToItem(at: selectedIndexPath, at: .centeredHorizontally, animated: true)
        
        let previousSelectedIndex = IndexPath(row: Int(currectSelectedIndex), section: 0)
        let previousSelectedCell  = collectionView.cellForItem(at: previousSelectedIndex)
        let nextSelectedCell      = collectionView.cellForItem(at: selectedIndexPath)
        
        currectSelectedIndex      = selectedIndexPath.row
        
        previousSelectedCell?.transformToStandard()
        nextSelectedCell?.transformToLarge()
        
        
        // check data reload 
        if let cardListVC = self.viewController as? CardListVC {
            cardListVC.reloadData(indexAmountOfEachCardRec: currectSelectedIndex)
        }
        
    }

}
