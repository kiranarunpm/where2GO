//
//  UploadImageVC.swift
//  Where2Go
//
//  Created by Kiran on 18/08/23.
//

import UIKit
import TextFieldEffects
class UploadImageVC: BaseVC {

    @IBOutlet weak var chooseGenderFemaleBtn: WTGIButton!
    
    @IBOutlet weak var selectCountry: HoshiTextField!
    @IBOutlet weak var lName: HoshiTextField!
    @IBOutlet weak var fName: HoshiTextField!
    @IBOutlet weak var chooseGenderMaleBtn: WTGIButton!
    
    @IBOutlet weak var uploadPhotoBtn: WTGIButton!
    @IBOutlet weak var profileImg: UIImageView!
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
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        profileImg.isUserInteractionEnabled = true
        profileImg.addGestureRecognizer(tap)
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        ImagePickerManager().pickImage(self){ image in
            self.profileImg.image = image
            self.profileImg.contentMode = .scaleToFill
            self.uploadPhotoBtn.style = 0
            self.view.layoutIfNeeded()
            
        }
    }
    @IBAction func chooseGenderMaleBtn(_ sender: Any) {
        chooseGenderMaleBtn.style = 6
        chooseGenderFemaleBtn.style = 7
        self.profileImg.image = UIImage(named: "avatar")

    }
    @IBAction func chooseGenderFemaleBtn(_ sender: Any) {
        chooseGenderMaleBtn.style = 7
        chooseGenderFemaleBtn.style = 6
        self.profileImg.image = UIImage(named: "avatar girl")

    }
    @IBAction func nextbtn(_ sender: Any) {
        let vc = HomeVC.instantiate(fromAppStoryboard: .Authentication)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.goBack()
    }
}
