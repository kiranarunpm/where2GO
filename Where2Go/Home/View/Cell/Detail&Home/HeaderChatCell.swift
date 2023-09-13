//
//  HeaderChatCell.swift
//  Where2Go
//
//  Created by Kiran on 27/08/23.
//

import UIKit

protocol HeaderChatCellDelegate {
    func toProfilePage()
}
class HeaderChatCell: UITableViewHeaderFooterView {
    static let identifire: String = "HeaderChatCell"
    var delegate : HeaderChatCellDelegate?
    
    @IBOutlet weak var image: UIImageView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(HeaderChatCell.cellTappedMethod(_:)))
        
    }

    

    @objc func cellTappedMethod(_ sender:AnyObject){
    }
    
    
    @IBAction func toprofileBtn(_ sender: Any) {
        self.delegate?.toProfilePage()

    }
    
}
