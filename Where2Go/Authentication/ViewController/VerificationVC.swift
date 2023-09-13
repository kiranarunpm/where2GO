//
//  VerificationVC.swift
//  Where2Go
//
//  Created by Kiran on 20/08/23.
//

import UIKit

enum VerificationNav{
    case home
    case login
    case reset
    
}
class VerificationVC: BaseVC {
    var type: VerificationNav?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func submitBtn(_ sender: Any) {
        if type == .reset{
            let vc = PasswordChangeSuccessVC.instantiate(fromAppStoryboard: .Authentication)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.goBack()
    }
    

}
