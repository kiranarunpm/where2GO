//
//  SideMenuVC.swift
//  SLCMComponents
//
//  Created by Kiran PM on 03/04/23.
//

import UIKit
import SideMenu
class SideMenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
    
    
    @IBAction func profileBtn(_ sender: Any) {
        let vc = ProfileVC.instantiate(fromAppStoryboard: .Home)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func bookmarkBtn(_ sender: Any) {
        let vc = BookmarkVC.instantiate(fromAppStoryboard: .Home)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func chatHistoryBtn(_ sender: Any) {
        let vc = ChatHistoryVC.instantiate(fromAppStoryboard: .Home)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
