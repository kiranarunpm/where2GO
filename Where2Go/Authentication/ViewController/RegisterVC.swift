//
//  RegisterVC.swift
//  Where2Go
//
//  Created by Kiran on 18/08/23.
//

import UIKit
import TextFieldEffects
class RegisterVC: BaseVC {

    @IBOutlet weak var confirmPasswordTxt: HoshiTextField!
    @IBOutlet weak var passwordTxt: HoshiTextField!
    @IBOutlet weak var emailTxt: HoshiTextField!
    @IBOutlet weak var usernameTxt: HoshiTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernameTxt.placeholder = "Username"
        self.usernameTxt.placeholderFontScale = 0.9
        self.usernameTxt.keyboardType = .default
        usernameTxt.placeholderLabel.font = UIFont.WTGfont(.bold, size: 14)
        
        self.emailTxt.placeholder = "Email"
        self.emailTxt.placeholderFontScale = 0.9
        self.emailTxt.keyboardType = .emailAddress
        
        self.passwordTxt.placeholder = "Password"
        self.passwordTxt.placeholderFontScale = 0.9
        self.passwordTxt.isSecureTextEntry = true
        self.passwordTxt.keyboardType = .default

        
        self.confirmPasswordTxt.placeholder = "Confirm Password"
        self.confirmPasswordTxt.placeholderFontScale = 0.9
        self.confirmPasswordTxt.isSecureTextEntry = true
        self.confirmPasswordTxt.keyboardType = .default
        

    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.goBack()
    }
    
    
    @IBAction func signUpBtn(_ sender: Any) {
        let vc = UploadImageVC.instantiate(fromAppStoryboard: .Authentication)
        self.navigationController?.pushViewController(vc, animated: true)
        }
    
}
