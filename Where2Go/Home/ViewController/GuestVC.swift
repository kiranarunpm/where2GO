//
//  GuestVC.swift
//  Where2Go
//
//  Created by Kiran on 29/08/23.
//

import UIKit

class GuestVC: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!{
        didSet{
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: GuestHeaderCell.identifite, bundle: nil), forHeaderFooterViewReuseIdentifier: GuestHeaderCell.identifite)
            tableView.register(UINib(nibName: GuestRowCell.identifite, bundle: nil), forCellReuseIdentifier: GuestRowCell.identifite)
            
            
        }
    }
    var selectedIndex: Int = -1
    var guestArr = [GuestModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guestArr = [GuestModel(countryName: "India", persons: [PersonName(name: "Amal"), PersonName(name: "Ajmal"), PersonName(name: "Muhammad")], iscollapseOrNot: false),
                    
                    GuestModel(countryName: "UAE", persons: [PersonName(name: "Ameer"), PersonName(name: "SRK"), PersonName(name: "Jomon")], iscollapseOrNot: false)
        ]
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.goBack()
    }
    
}

extension GuestVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return guestArr.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: GuestHeaderCell.identifite) as! GuestHeaderCell
        cell.delegate  = self
        let index = guestArr[section]
        cell.countryName.text = index.countryName
        cell.index = section
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let index = guestArr[section]
        if index.iscollapseOrNot{
            return index.persons.count
        }else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GuestRowCell.identifite, for: indexPath) as! GuestRowCell
        let index = guestArr[indexPath.section]
        cell.delegate = self
        cell.nameTxt.text = index.persons[indexPath.row].name
        
        return cell
    }
    
    
}

extension GuestVC: GuestHeaderCellDelegate{
    func collapse(index: Int) {
        var j = 0
        for item in self.guestArr{
            //            if item.iscollapseOrNot == false{
            //                item.iscollapseOrNot = true
            //            }else{
            //                item.iscollapseOrNot = false
            //
            //            }
            if index == j {
                if item.iscollapseOrNot{
                    item.iscollapseOrNot = false
                }else{
                    item.iscollapseOrNot = true
                }
            }else{
                item.iscollapseOrNot = false
                
            }
            j = j + 1
        }
        
        
        self.tableView.reloadData()
    }
    
    
    
}

extension GuestVC: GuestRowCellDelegate{
    func toProfilePage() {
        let vc = PersonProfileVC.instantiate(fromAppStoryboard: .Home)
        self.navigationController?.pushViewController(vc, animated:true)
    }
    
    
}
