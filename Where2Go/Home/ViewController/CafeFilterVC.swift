//
//  CafeFilterVC.swift
//  Where2Go
//
//  Created by Kiran on 05/09/23.
//

import UIKit

class CafeFilterVC: UIViewController {

    var headerArr = ["Opening Year", "Capacity","Meeting Room", "Location", "Wedding Catering", "Seating Area"]
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: FilterHeaderCell.identifire, bundle: nil), forHeaderFooterViewReuseIdentifier: FilterHeaderCell.identifire)
            
            tableView.register(UINib(nibName: YearSelectCell.identifire, bundle: nil), forCellReuseIdentifier: YearSelectCell.identifire)
            tableView.register(UINib(nibName: MultiselectCell.identifire, bundle: nil), forCellReuseIdentifier: MultiselectCell.identifire)

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
            return cell
            
        }
        return UITableViewCell()
    }
    
    
}
