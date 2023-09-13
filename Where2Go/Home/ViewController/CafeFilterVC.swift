//
//  CafeFilterVC.swift
//  Where2Go
//
//  Created by Kiran on 05/09/23.
//

import UIKit

class CafeFilterVC: UIViewController {

    var headerArr = ["Opening Year", "Capacity","Meeting Room", "Location", "Wedding Catering", "Seating Area"]
    let meetingRoom = ["Available"]
    let searingArea = ["Indoor", "Outdoor", "Both"]
    let wedingCatering = ["Available"]
    let capacityArr = ["0-20", "20-50", "50-100", "100-200"]

    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: FilterHeaderCell.identifire, bundle: nil), forHeaderFooterViewReuseIdentifier: FilterHeaderCell.identifire)
            
            tableView.register(UINib(nibName: YearSelectCell.identifire, bundle: nil), forCellReuseIdentifier: YearSelectCell.identifire)
            tableView.register(UINib(nibName: MultiselectCell.identifire, bundle: nil), forCellReuseIdentifier: MultiselectCell.identifire)
            tableView.register(UINib(nibName: SearchCell.identifire, bundle: nil), forCellReuseIdentifier: SearchCell.identifire)
            tableView.register(UINib(nibName: CheckboxCell.identifire, bundle: nil), forCellReuseIdentifier: CheckboxCell.identifire)


        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func dismissBtn(_ sender: Any) {
        self.dismiss(animated:true)
    }
    

}

extension CafeFilterVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerArr.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: FilterHeaderCell.identifire) as! FilterHeaderCell
        let index = headerArr[section]
        cell.headerTxt.text = index
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = headerArr[indexPath.section]
        if index == "Opening Year"{
            let cell = tableView.dequeueReusableCell(withIdentifier: YearSelectCell.identifire, for: indexPath) as! YearSelectCell
            return cell
            
        }
        if index == "Capacity"{
            let cell = tableView.dequeueReusableCell(withIdentifier: MultiselectCell.identifire, for: indexPath) as! MultiselectCell
            cell.arr = capacityArr
            return cell
            
        }
        if index == "Meeting Room"{
            let cell = tableView.dequeueReusableCell(withIdentifier: CheckboxCell.identifire, for: indexPath) as! CheckboxCell
            cell.arr = meetingRoom
            return cell
            
        }
        if index == "Location"{
            let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.identifire, for: indexPath) as! SearchCell

            return cell
            
        }
        if index == "Wedding Catering"{
            let cell = tableView.dequeueReusableCell(withIdentifier: CheckboxCell.identifire, for: indexPath) as! CheckboxCell
            cell.arr = wedingCatering
            return cell
            
        }
        if index == "Seating Area"{
            let cell = tableView.dequeueReusableCell(withIdentifier: CheckboxCell.identifire, for: indexPath) as! CheckboxCell
            cell.arr = searingArea
            return cell
            
        }
        return UITableViewCell()
    }
    
    
}
