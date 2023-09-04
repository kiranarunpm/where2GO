//
//  SwitchEvent.swift
//  Where2Go
//
//  Created by Kiran on 24/08/23.
//

import UIKit

class SwitchEvent: UITableViewCell {

    static let identifire: String = "SwitchEvent"

    @IBOutlet weak var chooseCafeBtn: WTGIButton!
    @IBOutlet weak var chooseRestuarantBtn: WTGIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func chooseRestuarantBtn(_ sender: Any) {
        chooseRestuarantBtn.style = 6
        chooseCafeBtn.style = 7

    }
    @IBAction func chooseCafeBtn(_ sender: Any) {
        chooseRestuarantBtn.style = 7
        chooseCafeBtn.style = 6
    }
    
}
