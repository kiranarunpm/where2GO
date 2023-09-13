//
//  ResetPasswordVC.swift
//  Where2Go
//
//  Created by Kiran on 20/08/23.
//

import UIKit
import TextFieldEffects
class ResetPasswordVC: BaseVC {

    @IBOutlet weak var confirmPasswordTxt: HoshiTextField!
    @IBOutlet weak var passwordTxt: HoshiTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.passwordTxt.placeholder = "New Password"
        self.passwordTxt.placeholderFontScale = 0.9
        self.passwordTxt.isSecureTextEntry = true
        self.passwordTxt.keyboardType = .default

        
        self.confirmPasswordTxt.placeholder = "Confirm Password"
        self.confirmPasswordTxt.placeholderFontScale = 0.9
        self.confirmPasswordTxt.isSecureTextEntry = true
        self.confirmPasswordTxt.keyboardType = .default
        
    }

}
