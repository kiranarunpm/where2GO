//
//  UINavigationController+Extension.swift
//  Where2Go
//
//  Created by Kiran on 15/08/23.
//

import Foundation
import UIKit

extension UINavigationController {
    
    public func goBack(animated: Bool = true){
        self.popViewController(animated: animated)
    }
    
}

class RootVC: UINavigationController{
    
    public func GetRootVC()->UINavigationController{
        
        if !User.shared.walkThought{
            let storyboard = WalkThroughVC.instantiate(fromAppStoryboard: .WalkThrough)
            let rootNC = UINavigationController(rootViewController: storyboard)
            storyboard.navigationController?.navigationBar.isHidden = true
            return rootNC
        }
        else{
            if !User.shared.hasToken {
                let storyboard = LoginVC.instantiate(fromAppStoryboard: .Authentication)
                let rootNC = UINavigationController(rootViewController: storyboard)
                storyboard.navigationController?.navigationBar.isHidden = true
                return rootNC
            }else{
                let storyboard = HomeVC.instantiate(fromAppStoryboard: .Home)
                let rootNC = UINavigationController(rootViewController: storyboard)
                storyboard.navigationController?.navigationBar.isHidden = true
                return rootNC
            }
        }
       
     
        
    }
    
    
}
