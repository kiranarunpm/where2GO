//
//  GuestRowCell.swift
//  Where2Go
//
//  Created by Kiran on 02/09/23.
//

import UIKit

class GuestRowCell: UITableViewCell {
    static let identifite: String = "GuestRowCell"

    @IBOutlet weak var nameTxt: WTGLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
