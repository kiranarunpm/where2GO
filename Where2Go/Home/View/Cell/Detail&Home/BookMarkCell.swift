//
//  BookMarkCell.swift
//  Where2Go
//
//  Created by Kiran on 04/09/23.
//

import UIKit

class BookMarkCell: UITableViewCell {
    static let identifire: String = "BookMarkCell"

    @IBOutlet weak var bgVie: R_UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bgVie.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
