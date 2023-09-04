//
//  UploadImageVC.swift
//  Where2Go
//
//  Created by Kiran on 18/08/23.
//

import UIKit
import TextFieldEffects
class UploadImageVC: UIViewController {

    @IBOutlet weak var chooseGenderFemaleBtn: WTGIButton!
    
    @IBOutlet weak var selectCountry: HoshiTextField!
    @IBOutlet weak var lName: HoshiTextField!
    @IBOutlet weak var fName: HoshiTextField!
    @IBOutlet weak var chooseGenderMaleBtn: WTGIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fName.placeholder = "First Name"
        self.fName.placeholderFontScale = 0.9
        self.fName.keyboardType = .default
        
        self.lName.placeholder = "Last Name"
        self.lName.placeholderFontScale = 0.9
        self.lName.keyboardType = .default
        
        
        self.selectCountry.placeholder = "Select Nationality"
        self.selectCountry.placeholderFontScale = 0.9
        self.selectCountry.keyboardType = .default
    }
    @IBAction func chooseGenderMaleBtn(_ sender: Any) {
        chooseGenderMaleBtn.style = 6
        chooseGenderFemaleBtn.style = 7

    }
    @IBAction func chooseGenderFemaleBtn(_ sender: Any) {
        chooseGenderMaleBtn.style = 7
        chooseGenderFemaleBtn.style = 6
    }
    @IBAction func nextbtn(_ sender: Any) {
        let vc = HomeVC.instantiate(fromAppStoryboard: .Authentication)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
