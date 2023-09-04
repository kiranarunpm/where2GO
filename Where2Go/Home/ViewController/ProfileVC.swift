//
//  ProfileVC.swift
//  Where2Go
//
//  Created by Kiran on 02/09/23.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var locationBaseView: R_UIView!
    @IBOutlet weak var emailBaseView: R_UIView!
    @IBOutlet weak var phoneBaseView: R_UIView!
    
    @IBOutlet weak var myEventBtn: WTGIButton!
    @IBOutlet weak var myReviewBtn: WTGIButton!
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    var sectionCount : Int = 0
    var chooseBtn: String = "myreview"
    @IBOutlet weak var tableView : UITableView!{
        didSet{
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: ChatReplayCell.identifire, bundle: nil), forCellReuseIdentifier: ChatReplayCell.identifire)
            tableView.register(UINib(nibName: HeaderChatCell.identifire, bundle: nil), forHeaderFooterViewReuseIdentifier: HeaderChatCell.identifire)
            tableView.register(UINib(nibName: itemHorizontalCell.identifire, bundle: nil), forCellReuseIdentifier: itemHorizontalCell.identifire)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneBaseView.layer.cornerRadius = phoneBaseView.frame.width / 2
        emailBaseView.layer.cornerRadius = emailBaseView.frame.width / 2
        locationBaseView.layer.cornerRadius = locationBaseView.frame.width / 2
        tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        sectionCount = 5
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if(keyPath == "contentSize"){
            if let newvalue = change?[.newKey]
            {
                DispatchQueue.main.async {
                    let newsize  = newvalue as! CGSize
                    self.tableViewHeight.constant = newsize.height
                }
                
            }
        }
    }
    
    @IBAction func myReviewBtn(_ sender: Any) {
        myReviewBtn.style = 6
        myEventBtn.style = 14
        chooseBtn = "myreview"
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }

        
    }
    
    @IBAction func myEventBtn(_ sender: Any) {
        myReviewBtn.style = 14
        myEventBtn.style = 6
        
        chooseBtn = "events"
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    @IBAction func openPrivacyBtn(_ sender: Any) {
        let vc = PrivacyVC.instantiate(fromAppStoryboard: .Home)
        vc.modalPresentationStyle = .overCurrentContext
        self.navigationController?.present(vc, animated: false)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if chooseBtn == "myreview"{
            return sectionCount
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if chooseBtn == "myreview"{
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderChatCell.identifire) as! HeaderChatCell
            return headerView
        }else{
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            view.backgroundColor = UIColor.red
            return view
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if chooseBtn == "myreview"{
            return UITableView.automaticDimension
        }
        else{
            return 0
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if chooseBtn == "myreview"{
            return 0
        }else{
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if chooseBtn == "myreview"{
            return UITableViewCell()
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: itemHorizontalCell.identifire, for: indexPath) as! itemHorizontalCell
            return cell
        }
        
    }
}
