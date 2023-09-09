//
//  ListingVC.swift
//  Where2Go
//
//  Created by Kiran on 04/09/23.
//

import UIKit

class ListingVC: UIViewController {
    var indexRow: Int = 0

    var cateArr = ["Cafes","Resturants","Search Users"]
    @IBOutlet weak var typeCell : UICollectionView!{
        didSet{
            typeCell.dataSource = self
            typeCell.delegate = self
            typeCell.register(UINib(nibName:  ChooseTypeCell.identifire, bundle: nil), forCellWithReuseIdentifier: ChooseTypeCell.identifire)
            
            let screenSize = CGSize(width: 110, height: 40)
            
            let layout1 = UICollectionViewFlowLayout()
            layout1.scrollDirection = .horizontal
            layout1.itemSize = screenSize
            layout1.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            typeCell.setCollectionViewLayout(layout1, animated: true)
            typeCell.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func filterBtn(_ sender: Any) {
        if self.indexRow == 0{
                let storyboard = CafeFilterVC.instantiate(fromAppStoryboard: .Home)
                if let presentationController = storyboard.presentationController as? UISheetPresentationController {
                    presentationController.detents = [.custom(resolver: { context in
                        return 600
                    }) ,.medium() , .large()] /// change to [.medium(), .large()] for a half *and* full screen sheet
                }
                
                self.present(storyboard, animated: true)
            }
        else{
            if self.indexRow == 1{
                    let storyboard = RestaurantFilterVC.instantiate(fromAppStoryboard: .Home)
                    if let presentationController = storyboard.presentationController as? UISheetPresentationController {
                        presentationController.detents = [.custom(resolver: { context in
                            return 600
                        }) ,.medium() , .large()] /// change to [.medium(), .large()] for a half *and* full screen sheet
                    }
                    
                    self.present(storyboard, animated: true)
                }
        }
        
    }
}


extension ListingVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cateArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChooseTypeCell.identifire, for: indexPath) as! ChooseTypeCell
        cell.delegete = self
        cell.indexRow = indexPath.row
        let index = cateArr[indexPath.row]
        cell.chooseBtn.setTitle(index, for: .normal)
        cell.chooseBtn.setImage(UIImage(named: ""), for: .normal)
        if indexPath.row == self.indexRow{
            cell.chooseBtn.layer.backgroundColor = UIColor.darkGreen.cgColor
            cell.chooseBtn.setTitleColor(UIColor.white, for: .normal)
            cell.chooseBtn.imageView?.tintColor =  UIColor.mangoYellowColor
            cell.chooseBtn.layer.cornerRadius = cell.chooseBtn.layer.frame.height/2
            cell.chooseBtn.titleLabel?.font =  UIFont.WTGfont(.semibold, size: 14)
            cell.layoutIfNeeded()
            
        }else{
            cell.chooseBtn.layer.backgroundColor = UIColor.white.cgColor
            cell.chooseBtn.setTitleColor(UIColor.black, for: .normal)
            cell.chooseBtn.layer.cornerRadius = cell.chooseBtn.layer.frame.height/2
            cell.chooseBtn.layer.borderColor = UIColor.black.cgColor
            cell.chooseBtn.layer.borderWidth = 1
            cell.chooseBtn.titleLabel?.font =  UIFont.WTGfont(.semibold, size: 14)
            cell.layoutIfNeeded()


        }
        return cell
    }
    
}

extension ListingVC: ChooseTypeCellDelegate{
    func loadIndex(indexRow: Int) {
        self.indexRow = indexRow
        self.typeCell.reloadData()
    }
    
    
}
