//
//  AuthenticationVM.swift
//  Where2Go
//
//  Created by Kiran on 09/09/23.
//

import UIKit

class AuthenticationVM: NSObject {

    public var successClosure: (() -> ())?
    public var failureClosure:(() -> ())?
    public var loadingStatus:(() -> ())?
    
    public var loginResponse: LoginResponse? {
        didSet{
            self.successClosure?()
        }
    }
    
    public var alertMessage: String? {
        didSet{
            self.failureClosure?()
        }
    }
    
    public var isLoading:Bool? {
        didSet{
            self.loadingStatus?()
        }
    }

}

extension AuthenticationVM{
    
    func callLogin(_ request: LoginRequest) {
       self.isLoading = true

        ARBusinessServiceHelper.request(router: ARServiceManager.login(request)) { [weak self] (result : Result<LoginResponse, ARFetchError>) in
           
           guard let _self = self else { return }
           
           _self.isLoading = false
           
           switch result {
               
           case .success(let response):
           _self.loginResponse = response
               
           case .failure(let errorMessage): _self.alertMessage = "\(errorMessage)"
               
           }
       }
   }
}
