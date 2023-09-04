//
//  ImagCell.swift
//  ImageTest
//
//  Created by Innovature on 25/08/23.
//

import UIKit

class ImagCell: UICollectionViewCell {

    static let identifire: String = "ImagCell"
    @IBOutlet weak var viewA : UIView!
    @IBOutlet weak var viewB : UIView!

    @IBOutlet weak var viewAImage : UIImageView!
    @IBOutlet weak var viewBImage : UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewAImage.layer.cornerRadius = 10
        viewBImage.layer.cornerRadius = 10
        // Initialization code
    }

}
