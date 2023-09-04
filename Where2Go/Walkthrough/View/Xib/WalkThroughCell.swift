//
//  WalkThroughCell.swift
//  Where2Go
//
//  Created by Kiran on 17/08/23.
//

import UIKit

class WalkThroughCell: UICollectionViewCell {

    static let identifire: String = "WalkThroughCell"
    
    @IBOutlet weak var subTitleTxt: WTGLabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var headerTxt: WTGLabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
