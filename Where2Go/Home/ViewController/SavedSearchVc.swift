//
//  SavedSearchVc.swift
//  Where2Go
//
//  Created by Kiran on 04/09/23.
//

import UIKit

class SavedSearch: UIViewController {

    @IBOutlet weak var tableView: UITableView!{
        didSet{
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.register(UINib(nibName: SavedSearchCell.identifire, bundle: nil), forCellReuseIdentifier: SavedSearchCell.identifire)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.goBack()
    }
    
    
}

extension SavedSearch: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SavedSearchCell.identifire, for: indexPath) as! SavedSearchCell
        return cell
    }
}
