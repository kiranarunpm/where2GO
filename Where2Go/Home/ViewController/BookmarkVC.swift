//
//  BookmarkVC.swift
//  Where2Go
//
//  Created by Kiran on 04/09/23.
//

import UIKit

class BookmarkVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!{
        didSet{
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.register(UINib(nibName: BookMarkCell.identifire, bundle: nil), forCellReuseIdentifier: BookMarkCell.identifire)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.goBack()
    }
    
}

extension BookmarkVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookMarkCell.identifire, for: indexPath) as! BookMarkCell
        cell.selectionStyle = .none
        return cell
    }
}
