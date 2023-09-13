//
//  LoginVC.swift
//  Where2Go
//
//  Created by Kiran on 17/08/23.
//

import UIKit
import TextFieldEffects
import MBProgressHUD
class LoginVC: BaseVC {
    
    @IBOutlet weak var userTxt: HoshiTextField!
    @IBOutlet weak var passwordTxt: HoshiTextField!
    
    
    lazy var viewModel: AuthenticationVM = {
        return AuthenticationVM()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userTxt.placeholder = "Username"
        self.userTxt.placeholderFontScale = 0.9
        
        self.userTxt.text = "Kiranarun"
        self.passwordTxt.text = "12345678"
        
        self.passwordTxt.placeholder = "Password"
        self.passwordTxt.placeholderFontScale = 0.9
        self.passwordTxt.isSecureTextEntry = true
        initViewModel()
        
    }
    
    // MARK: InitViewModel
    func initViewModel() {
        
        viewModel.successClosure = { [weak self] () in
            
            guard let _self = self else { return }
            
            DispatchQueue.main.async {
                
                let details = _self.viewModel.loginResponse
                
                User.shared.saveData(with: .accessToken, value: details?.accessToken ?? "")
                User.shared.saveData(with: .email, value: details?.email ?? "")
                User.shared.saveData(with: .image, value: details?.image ?? "")
                User.shared.saveData(with: .profile_path, value: details?.profile_path ?? "")
                User.shared.saveData(with: .refreshToken, value: details?.refreshToken ?? "")
                User.shared.saveData(with: .name, value: details?.name ?? "")
                
                DispatchQueue.main.async {
                    let storyboard = HomeVC.instantiate(fromAppStoryboard: .Home)
                    _self.navigationController?.pushViewController(storyboard, animated: true)
                }
                
            }
        }
        
        viewModel.failureClosure = { [weak self] () in
            
            guard let _self = self else { return }
            
            DispatchQueue.main.async {
                
                if let alertMessage = _self.viewModel.alertMessage {
                    print("alertMessage", alertMessage)
                    
                }
            }
        }
        
        viewModel.loadingStatus = { [weak self] () in
            
            guard let _self = self else { return }
            
            DispatchQueue.main.async {
                
                let isLoading = _self.viewModel.isLoading ?? false
                
                if isLoading {
                    MBProgressHUD.showAdded(to: _self.view, animated: true)
                    
                }else {
                    MBProgressHUD.hide(for: _self.view, animated: true)
                }
            }
        }
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
    
    @IBAction func submitBtn(_ sender: Any) {
        let username = self.userTxt.text ?? ""
        let password = self.passwordTxt.text ?? ""
        let request = LoginRequest(username: username, password: password)
        viewModel.callLogin(request)
    }
    
    
}
