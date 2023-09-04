//
//  ChatReplayCell.swift
//  Where2Go
//
//  Created by Kiran on 27/08/23.
//

import UIKit
protocol ChatReplayCellDelegate {
    func toProfilePage()
}
class ChatReplayCell: UITableViewCell {
    static let identifire: String = "ChatReplayCell"
    var delegate: ChatReplayCellDelegate?
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ChatReplayCell.cellTappedMethod(_:)))
        self.img.isUserInteractionEnabled = true
        self.img.addGestureRecognizer(tapGestureRecognizer)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func cellTappedMethod(_ sender:AnyObject){
        self.delegate?.toProfilePage()
    }
}
