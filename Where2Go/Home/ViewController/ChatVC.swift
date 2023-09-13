//
//  ChatVC.swift
//  Where2Go
//
//  Created by Kiran on 02/09/23.
//

import UIKit

class ChatVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.separatorStyle = .none

        self.tableView.register(UINib(nibName: ChatBubbleLeft.identifire, bundle: nil), forCellReuseIdentifier:  ChatBubbleLeft.identifire)
        self.tableView.register(UINib(nibName: ChatBubbleRight.identifire, bundle: nil), forCellReuseIdentifier:  ChatBubbleRight.identifire)
        // Do any additional setup after loading the view.
    }

    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.goBack()
    }
    
}
extension ChatVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        if index == 1 || index == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: ChatBubbleRight.identifire, for:indexPath) as! ChatBubbleRight
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: ChatBubbleLeft.identifire, for:indexPath) as! ChatBubbleLeft
            cell.selectionStyle = .none
            return cell
        }

    }

}
