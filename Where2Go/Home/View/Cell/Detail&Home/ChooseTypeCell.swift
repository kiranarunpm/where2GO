//
//  ChooseTypeCell.swift
//  Where2Go
//
//  Created by Kiran on 26/08/23.
//

import UIKit


protocol ChooseTypeCellDelegate{
    func loadIndex(indexRow: Int)
}

class ChooseTypeCell: UICollectionViewCell {
    static let identifire: String = "ChooseTypeCell"
    var delegete: ChooseTypeCellDelegate?
    @IBOutlet weak var chooseBtn: UIButton!
    var indexRow: Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func ChooseBtn(_ sender: Any) {
        self.delegete?.loadIndex(indexRow: self.indexRow)
    }
    
}
