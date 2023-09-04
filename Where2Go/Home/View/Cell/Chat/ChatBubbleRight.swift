//
//  ChatBubbleLeft.swift
//  Marketplix
//
//  Created by Kiran PM on 05/07/23.
//

import UIKit

class ChatBubbleRight: UITableViewCell {
    @IBOutlet weak var baseView: UIView!

    static var identifire : String = "ChatBubbleRight"
    override func awakeFromNib() {
        super.awakeFromNib()
        baseView.layer.cornerRadius = 20

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
