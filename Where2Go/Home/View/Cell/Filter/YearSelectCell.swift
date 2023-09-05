//
//  YearSelectCell.swift
//  Where2Go
//
//  Created by Kiran on 05/09/23.
//

import UIKit

class YearSelectCell: UITableViewCell {
    static var identifire : String = "YearSelectCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
