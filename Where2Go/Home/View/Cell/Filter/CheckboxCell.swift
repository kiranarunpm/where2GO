//
//  CheckboxCell.swift
//  Where2Go
//
//  Created by Kiran on 09/09/23.
//

import UIKit

class CheckboxCell: UITableViewCell {
    static var identifire : String = "CheckboxCell"
    var arr = [String]()
    @IBOutlet weak var colView: UICollectionView!{
        didSet{
            self.colView.dataSource = self
            self.colView.delegate = self
            self.colView.register(UINib(nibName: CheckboxCelll.identifire , bundle: nil), forCellWithReuseIdentifier: CheckboxCelll.identifire)
            
            let _flowLayout = UICollectionViewFlowLayout()
            _flowLayout.itemSize = CGSize(width: 150, height: 40)
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
extension CheckboxCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CheckboxCelll.identifire, for: indexPath) as! CheckboxCelll
        cell.txt.text = arr[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
}

    
