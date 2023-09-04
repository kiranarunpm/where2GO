//
//  LoginVC.swift
//  Where2Go
//
//  Created by Kiran on 17/08/23.
//

import UIKit
import TextFieldEffects
class LoginVC: UIViewController {

    @IBOutlet weak var userTxt: HoshiTextField!
    @IBOutlet weak var passwordTxt: HoshiTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.userTxt.placeholder = "Username"
        self.userTxt.placeholderFontScale = 0.9
        
        self.passwordTxt.placeholder = "Password"
        self.passwordTxt.placeholderFontScale = 0.9
        self.passwordTxt.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    

    @IBAction  func registerBtn(_ sender: AnyObject) {
        let vc = RegisterVC.instantiate(fromAppStoryboard: .Authentication)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

    @IBAction func resetBtn(_ sender: Any) {
        let vc = VerificationVC.instantiate(fromAppStoryboard: .Authentication)
        vc.type = .reset
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
