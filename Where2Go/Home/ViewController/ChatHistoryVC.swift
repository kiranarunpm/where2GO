//
//  ChatHistoryVC.swift
//  Where2Go
//
//  Created by Kiran on 02/09/23.
//

import UIKit

class ChatHistoryVC: UIViewController {

    @IBOutlet weak var tableView : UITableView!{
        didSet{
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: ChatHistoryCell.identifire, bundle: nil), forCellReuseIdentifier: ChatHistoryCell.identifire)
            
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ChatHistoryVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatHistoryCell.identifire, for: indexPath) as! ChatHistoryCell
        return cell
    }
    
    
}
