//
//  HomeWidgetCell.swift
//  Where2Go
//
//  Created by Kiran on 21/08/23.
//

import UIKit

protocol HomeWidgetCellDelegate{
    func toDetail()
}

class HomeWidgetCell: UITableViewCell {
    var delegate: HomeWidgetCellDelegate?
    static let identifite: String = "HomeWidgetCell"
    @IBOutlet weak var colView : UICollectionView!{
        didSet{
            colView.dataSource = self
            colView.delegate = self
            colView.register(UINib(nibName: ItemCell.identifire, bundle: nil), forCellWithReuseIdentifier: ItemCell.identifire)
            
            let screenSize = CGSize(width: 190, height: 260)
          
            let layout1 = UICollectionViewFlowLayout()
            layout1.scrollDirection = .horizontal
            layout1.itemSize = screenSize
            layout1.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
            
            layout1.minimumLineSpacing = 15
            layout1.minimumInteritemSpacing = 0
            colView.setCollectionViewLayout(layout1, animated: true)
            colView.reloadData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension HomeWidgetCell: UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.identifire, for: indexPath) as! ItemCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.toDetail()
    }
}
