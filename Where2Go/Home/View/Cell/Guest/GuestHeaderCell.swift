//
//  GuestHeaderCell.swift
//  Where2Go
//
//  Created by Kiran on 29/08/23.
//

import UIKit
protocol GuestHeaderCellDelegate{
    func collapse(index: Int)
}


class GuestHeaderCell: UITableViewHeaderFooterView {
    static let identifite: String = "GuestHeaderCell"
    var index : Int?
    var delegate: GuestHeaderCellDelegate?
    @IBOutlet weak var countryName: WTGLabel!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var collapseBtn: UIButton!
    
    @IBAction func collapseBtn(_ sender: Any) {
        if let index = self.index{
            self.delegate?.collapse(index: index)
        }
    }
}
