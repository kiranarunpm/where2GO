//
//  WalkThroughVC.swift
//  Where2Go
//
//  Created by Kiran on 17/08/23.
//

import UIKit

struct WalkthroughModel{
    let image: String
    let header: String
    let subtitle: String
}

class WalkThroughVC: UIViewController {
    @IBOutlet weak var dotView: CustomPageControl!
    
    @IBOutlet weak var startBtn: WTGIButton!
    @IBOutlet weak var nextBtn: WTGIButton!
    @IBOutlet weak var backBtn: WTGIButton!
    
    var arrData = [WalkthroughModel]()
    @IBOutlet weak var colView: UICollectionView!{
        didSet{
            colView.dataSource = self
            colView.delegate = self
            colView.register(UINib(nibName: WalkThroughCell.identifire, bundle: nil), forCellWithReuseIdentifier: WalkThroughCell.identifire)
            colView.isPagingEnabled = true
            let screen_width = ScreenSize.SCREEN_WIDTH
            let screenSize = CGSize(width: screen_width, height: colView.frame.height)

            let layout1 = UICollectionViewFlowLayout()
            layout1.scrollDirection = .horizontal
            layout1.itemSize = screenSize

            colView.setCollectionViewLayout(layout1, animated: true)
            colView.reloadData()
            
            arrData = [WalkthroughModel(image: "122", header: "Easy check in", subtitle: "orem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"),
                       WalkthroughModel(image: "", header: "List of Premium Café and Restaurants", subtitle: "orem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"),WalkthroughModel(image: "", header: "List of Premium Café and Restaurants", subtitle: "orem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")]
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dotView.currentPageImage = UIImage(named: "Shape 1")
        dotView.otherPagesImage = UIImage(named: "Shape 2")

        dotView.numberOfPages = self.arrData.count
        dotView.currentPage = 0
    }
    
    @IBAction private func nextbtn(_ sender: AnyObject) {
           let visibleItems: NSArray = self.colView.indexPathsForVisibleItems as NSArray
           let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
           let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
   // This part here
           if nextItem.row < arrData.count {
               self.colView.scrollToItem(at: nextItem, at: .left, animated: true)
               self.view.layoutIfNeeded()
               dotView.currentPage = nextItem.row

           }
         
       }
    
    @IBAction  func getStartedBtn(_ sender: AnyObject) {
        User.shared.saveWalkthrough(with: .walkthough, value: true)
        let vc = LoginVC.instantiate(fromAppStoryboard: .Authentication)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}

extension WalkThroughVC: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WalkThroughCell.identifire, for: indexPath) as! WalkThroughCell
        let index = arrData[indexPath.row]
        cell.img.image = UIImage(named: index.image)
        cell.headerTxt.text = index.header
        cell.subTitleTxt.text = index.subtitle
        return cell
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for cell in colView.visibleCells {
            if let indexPath = colView.indexPath(for: cell){
            let index = indexPath.row
            dotView.currentPage = index
                if indexPath.row == self.arrData.count - 1{

                        self.nextBtn.isHidden = true
                        self.backBtn.isHidden = true
                        self.startBtn.isHidden = false
                        self.view.layoutIfNeeded()
                    
                }
                else{
               
                        self.nextBtn.isHidden = false
                        self.backBtn.isHidden = false
                        self.startBtn.isHidden = true
                        self.view.layoutIfNeeded()

                    
                   
                }
                print(indexPath)

            }

        }
    }
    
    
}



