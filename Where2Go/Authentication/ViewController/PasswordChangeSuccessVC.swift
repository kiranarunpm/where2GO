//
//  PasswordChangeSuccessVC.swift
//  Where2Go
//
//  Created by Kiran on 20/08/23.
//

import UIKit

class PasswordChangeSuccessVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitBtn(_ sender: Any) {
            let vc = HomeVC.instantiate(fromAppStoryboard: .Home)
            self.navigationController?.pushViewController(vc, animated: true)
    
    }

}
