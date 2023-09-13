//
//  GuestRowCell.swift
//  Where2Go
//
//  Created by Kiran on 02/09/23.
//

import UIKit

protocol GuestRowCellDelegate {
    func toProfilePage()
}
class GuestRowCell: UITableViewCell {
    static let identifite: String = "GuestRowCell"
    var delegate: GuestRowCellDelegate?
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nameTxt: WTGLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GuestRowCell.cellTappedMethod(_:)))
        
        self.img.addGestureRecognizer(tapGestureRecognizer)    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    @objc func cellTappedMethod(_ sender:AnyObject){
//
//    }
    @IBAction func cellTappedMethod(_ sender: Any) {
                self.delegate?.toProfilePage()

    }
    
}
