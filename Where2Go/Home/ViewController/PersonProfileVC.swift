//
//  PersonProfileVC.swift
//  Where2Go
//
//  Created by Kiran on 04/09/23.
//

import UIKit

class PersonProfileVC: UIViewController {
    @IBOutlet weak var phoneBaseView: R_UIView!
    @IBOutlet weak var emailBaseView: R_UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneBaseView.layer.cornerRadius = phoneBaseView.frame.width / 2
        emailBaseView.layer.cornerRadius = emailBaseView.frame.width / 2
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.goBack()
    }
    
    @IBAction func chatBtn(_ sender: Any) {
        let vc = ChatVC.instantiate(fromAppStoryboard: .Home)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
