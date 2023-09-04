//
//  PrivacyVC.swift
//  Where2Go
//
//  Created by Kiran on 03/09/23.
//

import Foundation
import UIKit

class PrivacyVC: UIViewController{
    
    @IBOutlet weak var chatbtn: UIButton!
    @IBOutlet weak var chatInfoView: R_UIView!
    
    @IBOutlet weak var visiblityView: R_UIView!
    @IBOutlet weak var visiblityBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dismissBtn(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    
    @IBAction func chatbtn(_ sender: Any) {
        if chatbtn.tag == 0{
            chatInfoView.isHidden = false
            chatbtn.tag = 1
        }
        else{
            chatInfoView.isHidden = true
            chatbtn.tag = 0
        }
    }
    
    @IBAction func visiblityBtn(_ sender: Any) {
        if visiblityBtn.tag == 0{
            visiblityView.isHidden = false
            visiblityBtn.tag = 1
        }
        else{
            visiblityView.isHidden = true
            
            visiblityBtn.tag = 0
        }
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    
}
