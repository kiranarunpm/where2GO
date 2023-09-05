//
//  MultiselectCell.swift
//  Where2Go
//
//  Created by Kiran on 05/09/23.
//

import UIKit

class MultiselectCell: UITableViewCell {
    static var identifire : String = "MultiselectCell"

    @IBOutlet weak var colView: UICollectionView!{
        didSet{
            colView.delegate = self
            colView.dataSource = self
            colView.register(UINib(nibName: SingleCell.identifire, bundle: nil), forCellWithReuseIdentifier: SingleCell.identifire)
            
            let _flowLayout = UICollectionViewFlowLayout()
            _flowLayout.itemSize = CGSize(width: 100, height: 40)
            _flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 5)
            _flowLayout.scrollDirection = .horizontal
            _flowLayout.minimumInteritemSpacing = 0.0
            _flowLayout.minimumLineSpacing = 10
            
            colView.collectionViewLayout = _flowLayout
            colView.reloadData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MultiselectCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SingleCell.identifire, for: indexPath) as! SingleCell
        if indexPath.row == 1{
            cell.chooseBtn.layer.backgroundColor = UIColor.secondaryColor.cgColor
            cell.chooseBtn.setTitleColor(UIColor.black, for: .normal)
            cell.chooseBtn.imageView?.tintColor =  UIColor.secondaryColor
            cell.chooseBtn.layer.cornerRadius = cell.chooseBtn.frame.height/2
            cell.chooseBtn.layer.borderColor = UIColor.black.cgColor
            cell.chooseBtn.layer.borderWidth = 0.5

            }else{
                cell.chooseBtn.layer.backgroundColor = UIColor.white.cgColor
                cell.chooseBtn.setTitleColor(UIColor.black, for: .normal)
            cell.chooseBtn.layer.borderWidth = 0.5
                cell.chooseBtn.layer.borderColor = UIColor.black.cgColor
            cell.chooseBtn.layer.cornerRadius = 20
                
            }
        return cell

        }
        
        
        
}

    

