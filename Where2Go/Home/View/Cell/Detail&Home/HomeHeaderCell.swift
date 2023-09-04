//
//  HomeHeaderCell.swift
//  Where2Go
//
//  Created by Kiran on 24/08/23.
//

import UIKit

class HomeHeaderCell: UITableViewCell {
    static let identifire: String = "HomeHeaderCell"

    @IBOutlet weak var headerTxt: WTGLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
