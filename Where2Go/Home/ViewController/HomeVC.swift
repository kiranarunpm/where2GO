//
//  HomeVC.swift
//  Where2Go
//
//  Created by Kiran on 21/08/23.
//

import UIKit

class HomeVC: BaseVC {
    
    @IBOutlet weak var tabView: UITableView!{
        didSet{
            tabView.dataSource = self
            tabView.delegate = self
            tabView.register(UINib(nibName: HomeWidgetCell.identifite, bundle: nil), forCellReuseIdentifier: HomeWidgetCell.identifite)
            
            tabView.register(UINib(nibName: HomeHeaderCell.identifire, bundle: nil), forCellReuseIdentifier: HomeHeaderCell.identifire)
            tabView.register(UINib(nibName: SwitchEvent.identifire, bundle: nil), forCellReuseIdentifier: SwitchEvent.identifire)
            
            tabView.register(UINib(nibName: itemHorizontalCell.identifire, bundle: nil), forCellReuseIdentifier: itemHorizontalCell.identifire)

        }
    }
    var sectionArr = ["header","Trending Cafes","header","Trending Restaurants", "header", "Upcoming Events", "SwitchEvent", "upCommingEvent"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func menuBtn(_ sender: Any) {
        performSegue(withIdentifier: "showMenu", sender: nil)

    }
    @IBAction func seachBtn(_ sender: Any) {
        let vc = ListingVC.instantiate(fromAppStoryboard: .Home)
        self.navigationController?.pushViewController(vc, animated:true)
    }
    
    
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArr.count

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let index = sectionArr[section]
        if index == "upCommingEvent"{
            return 5
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = sectionArr[indexPath.section]
        if index == "header"{
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeHeaderCell.identifire, for: indexPath) as! HomeHeaderCell
            cell.headerTxt.text = sectionArr[indexPath.row + 1] 
            return cell
        }else if index == "Trending Cafes"{
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeWidgetCell.identifite, for: indexPath) as! HomeWidgetCell
            cell.delegate = self
            return cell
        }else if index == "Trending Restaurants"{
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeWidgetCell.identifite, for: indexPath) as! HomeWidgetCell
            return cell
        }
        else if index == "SwitchEvent"{
            let cell = tableView.dequeueReusableCell(withIdentifier: SwitchEvent.identifire, for: indexPath) as! SwitchEvent
            return cell
        }
        
        else if index == "upCommingEvent"{
            let cell = tableView.dequeueReusableCell(withIdentifier: itemHorizontalCell.identifire, for: indexPath) as! itemHorizontalCell
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = sectionArr[indexPath.section]
        if index == "Trending Cafes"{
           
            
        }
    }
}


extension HomeVC: HomeWidgetCellDelegate{
    func toDetail() {
        let vc = itemDetailVC.instantiate(fromAppStoryboard: .Home)
        self.navigationController?.pushViewController(vc, animated:true)
    }
    
    
}
