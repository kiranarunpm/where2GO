//
//  itemDetailVC.swift
//  Where2Go
//
//  Created by Kiran on 24/08/23.
//

import UIKit
import ReadMoreTextView
import MapKit
struct ItemModel{
    let name: String
    let image: String
}

class itemDetailVC: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var collapseContactBtn: UIButton!
    @IBOutlet weak var locationBaseView: R_UIView!
    @IBOutlet weak var emailBaseView: R_UIView!
    @IBOutlet weak var phoneBaseView: R_UIView!
    var totalReview : Int = 0
    @IBOutlet weak var descriptionTxt: ReadMoreTextView!
    @IBOutlet weak var contactBaseViewHeight: NSLayoutConstraint!
    @IBOutlet weak var contactBaseView: UIView!
    var totalImg: Int = 10
    var imageIndexArr = [Int]()
    let itemArr = [ItemModel]()
    @IBOutlet weak var rightReviewBaseHeight: NSLayoutConstraint!
    @IBOutlet weak var writeReviewBtn: WTGIButton!
    var indexRow: Int = 0
    @IBOutlet weak var reviewTabHeight: NSLayoutConstraint!
    @IBOutlet weak var pagecontoller: CustomPageControl!
    var locationManager:CLLocationManager!
    var arrData = [String]()
    
    @IBOutlet weak var categoryTabHeight: NSLayoutConstraint!
    var categoryArr = ["Hot Coffee", "Hot Drinks", "Cold Drinks", "All Day Breakfast", "Pizza & Flatbread", "Starters Main Course", "Desserts"]
    let numberOfImages = ["image-0","image-1","image-2","image-3","image-4","image-5","image-6","image-7","image-8","image-9","image-10","image-11","image-12","image-1", "image-3","image-7"]
    var imageArr = [ImageModel]()
    var rowCount = 0
    
    @IBOutlet weak var promoHeight: NSLayoutConstraint!
    @IBOutlet weak var promoBtn: UIButton!
    @IBOutlet weak var promoView: UIView!
    
    @IBOutlet weak var imageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var imageViewBtn: UIButton!
    @IBOutlet weak var imageBaseView: UIView!
    
    @IBOutlet weak var aminitiesViewHeight: NSLayoutConstraint!
    @IBOutlet weak var aminitiesViewBtn: UIButton!
    @IBOutlet weak var aminitiesBaseView: UIView!
    
    @IBOutlet weak var colView : UICollectionView!{
        didSet{
            colView.dataSource = self
            colView.delegate = self
            colView.register(UINib(nibName: AmenitiesCell.identifire, bundle: nil), forCellWithReuseIdentifier: AmenitiesCell.identifire)
            
            let screenSize = CGSize(width: 100, height: 150)
            
            let layout1 = UICollectionViewFlowLayout()
            layout1.scrollDirection = .horizontal
            layout1.itemSize = screenSize
            layout1.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            
            layout1.minimumLineSpacing = 0
            layout1.minimumInteritemSpacing = 10
            colView.setCollectionViewLayout(layout1, animated: true)
            colView.reloadData()
        }
    }
    
    @IBOutlet weak var imageCell : UICollectionView!{
        didSet{
            imageCell.dataSource = self
            imageCell.delegate = self
            imageCell.register(UINib(nibName: ImagCell.identifire, bundle: nil), forCellWithReuseIdentifier: ImagCell.identifire)
            
            let _flowLayout = UICollectionViewFlowLayout()
            _flowLayout.itemSize = CGSize(width: 180, height: 250)
            _flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 5)
            _flowLayout.scrollDirection = .horizontal
            _flowLayout.minimumInteritemSpacing = 0.0
            _flowLayout.minimumLineSpacing = 0
            
            imageCell.collectionViewLayout = _flowLayout
            imageCell.reloadData()
            
        }
    }
    
    @IBOutlet weak var addscolView : UICollectionView!{
        didSet{
            addscolView.dataSource = self
            addscolView.delegate = self
            addscolView.register(UINib(nibName:  AddsCell.identifire, bundle: nil), forCellWithReuseIdentifier: AddsCell.identifire)
            
            let screenSize = CGSize(width: 300, height: 200)
            
            let layout1 = UICollectionViewFlowLayout()
            layout1.scrollDirection = .horizontal
            layout1.itemSize = screenSize
            layout1.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
            
            layout1.minimumLineSpacing = 0
            layout1.minimumInteritemSpacing = 10
            addscolView.setCollectionViewLayout(layout1, animated: true)
            addscolView.reloadData()
        }
    }
    
    @IBOutlet weak var typeCell : UICollectionView!{
        didSet{
            typeCell.dataSource = self
            typeCell.delegate = self
            typeCell.register(UINib(nibName:  ChooseTypeCell.identifire, bundle: nil), forCellWithReuseIdentifier: ChooseTypeCell.identifire)
            
            let screenSize = CGSize(width: 200, height: 50)
            
            let layout1 = UICollectionViewFlowLayout()
            layout1.scrollDirection = .horizontal
            layout1.itemSize = screenSize
            layout1.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            typeCell.setCollectionViewLayout(layout1, animated: true)
            typeCell.reloadData()
        }
    }
    
    @IBOutlet weak var categoryCol : UICollectionView!{
        didSet{
            categoryCol.dataSource = self
            categoryCol.delegate = self
            categoryCol.register(UINib(nibName:  CategoryCell.identifire, bundle: nil), forCellWithReuseIdentifier: CategoryCell.identifire)
            
            let screenSize = CGSize(width: 150, height: 30)
            
            let layout1 = UICollectionViewFlowLayout()
            layout1.scrollDirection = .horizontal
            layout1.itemSize = screenSize
            layout1.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            categoryCol.setCollectionViewLayout(layout1, animated: true)
            categoryCol.reloadData()
        }
    }
    
    @IBOutlet weak var reviewTab : UITableView!{
        didSet{
            reviewTab.dataSource = self
            reviewTab.delegate = self
            reviewTab.register(UINib(nibName: ChatReplayCell.identifire, bundle: nil), forCellReuseIdentifier: ChatReplayCell.identifire)
            reviewTab.register(UINib(nibName: HeaderChatCell.identifire, bundle: nil), forHeaderFooterViewReuseIdentifier: HeaderChatCell.identifire)
            
        }
    }
    
    @IBOutlet weak var categoryTab : UITableView!{
        didSet{
            categoryTab.dataSource = self
            categoryTab.delegate = self
            categoryTab.register(UINib(nibName: MenuCell.identifire, bundle: nil), forCellReuseIdentifier: MenuCell.identifire)
            categoryTab.register(UINib(nibName: itemHorizontalCell.identifire, bundle: nil), forCellReuseIdentifier: itemHorizontalCell.identifire)
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneBaseView.layer.cornerRadius = phoneBaseView.frame.width / 2
        emailBaseView.layer.cornerRadius = emailBaseView.frame.width / 2
        locationBaseView.layer.cornerRadius = locationBaseView.frame.width / 2
        
        descriptionTxt.shouldTrim = true
        descriptionTxt.maximumNumberOfLines = 4
        descriptionTxt.tintColor = UIColor.primaryColor
        let font = UIFont.systemFont(ofSize: 14)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.mangoYellowColor,
        ]
        
        descriptionTxt.attributedReadMoreText = NSAttributedString(string: " Read more",attributes: attributes)
        descriptionTxt.attributedReadLessText = NSAttributedString(string: " Read less", attributes: attributes)
        
        pagecontoller.currentPageImage = UIImage(named: "Shape 1")
        pagecontoller.otherPagesImage = UIImage(named: "Shape 2")
        
        pagecontoller.numberOfPages = 5
        pagecontoller.currentPage = 0
        self.writeReviewBtn.tag = 1
        self.writeReviewBtn(self)
        
        reviewTab.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        
        determineMyCurrentLocation()
        calculateCategoryTabHeight()
        totalReview = 5
        loadImages()
        categoryTabHeight.constant = 0
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if(keyPath == "contentSize"){
            if let newvalue = change?[.newKey]
            {
                DispatchQueue.main.async {
                    let newsize  = newvalue as! CGSize
                    self.reviewTabHeight.constant = newsize.height
                }
                
            }
        }
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func loadImages(){
        
        for i in 0...numberOfImages.count - 1{
            if i % 5 == 0{
                arrData.append("A")
            }else{
                arrData.append("B")
            }
        }
        print("arrData", arrData)
        
        let countA = arrData.filter {$0 == "A"}.count
        let countB = arrData.filter {$0 == "B"}.count
        
        print("countA", countA)
        print("countB", countB)
        let mode = (countB/2) % 2
        self.rowCount = (countA + (countB/2)) + mode
        
        print("Total row", self.rowCount)
        
        var inserted = true
        var image = [Image]()
        
        for j in 0...arrData.count-1{
            if arrData[j] == "A"{
                self.imageArr.append(ImageModel(level: "A", images: [Image(name: numberOfImages[j])]))
            }
            else{
                image.append(Image(name: numberOfImages[j]))
                inserted = false
                if image.count == 2{
                    inserted = true
                    self.imageArr.append(ImageModel(level: "B", images: image))
                    image.removeAll()
                }
            }
            
            
        }
        if inserted == false{
            self.imageArr.append(ImageModel(level: "B", images: image))
            image.removeAll()
            
            
        }
        
        print(" self.imageArr",  self.imageArr)
        self.imageCell.reloadData()
    }
    
    
    @IBAction func collapseContactBtn(_ sender: Any) {
        if collapseContactBtn.tag == 0{
            collapseContactBtn.tag = 1
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn) {
                self.contactBaseViewHeight.constant = 0
                
                self.view.layoutIfNeeded()
                
            }
            
            
        }else{
            collapseContactBtn.tag = 0
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn) {
                self.contactBaseViewHeight.constant = 290
                self.contactBaseView.isHidden = false
                self.view.layoutIfNeeded()
                
            }
        }
    }
    
    
    @IBAction func writeReviewBtn(_ sender: Any) {
        if writeReviewBtn.tag == 0{
            writeReviewBtn.tag = 1
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn) {
                self.rightReviewBaseHeight.constant = 370
                self.view.layoutIfNeeded()
                
            }
        }else{
            writeReviewBtn.tag = 0
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn) {
                self.rightReviewBaseHeight.constant = 0
                self.view.layoutIfNeeded()
                
            }
        }
    }
    
    
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        //        manager.stopUpdatingLocation()
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        
        let coordinatesA = (latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let coordinatesB = (latitude: 9.973283512527098, longitude: 76.310449)
        
        let locationA = CLLocation(latitude: coordinatesA.latitude, longitude: coordinatesA.longitude)
        let locationB = CLLocation(latitude: coordinatesB.latitude, longitude: coordinatesB.longitude)
        
        let distance = locationA.distance(from: locationB)
        print(distance)
        
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
        {
            print("Error \(error)")
        }
    }
    
    func calculateCategoryTabHeight(){
        
        if indexRow == 1{
            let val = (5 * 160) + 150
            self.categoryTabHeight.constant = CGFloat(val)
        }else if indexRow == 0{
            self.categoryTabHeight.constant = 0

        }else{
            let val = (2 * 160) + 150
            self.categoryTabHeight.constant = CGFloat(val)
        }
        
    }
    
    @IBAction func promoBtn(_ sender: Any) {
        if promoBtn.tag == 0{
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn) {
                self.promoHeight.constant = 240
                self.view.layoutIfNeeded()

            }
            promoBtn.tag = 1
        }else{
            promoBtn.tag = 0
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn) {
                self.promoHeight.constant = 0
                self.view.layoutIfNeeded()
       
            }
            
        }
    }
    
    @IBAction func imageViewBtn(_ sender: Any) {
        if imageViewBtn.tag == 0{
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn) {
                self.imageViewHeight.constant = 300
                self.view.layoutIfNeeded()

            }
            imageViewBtn.tag = 1
        }else{
            imageViewBtn.tag = 0
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn) {
                self.imageViewHeight.constant = 0
                self.view.layoutIfNeeded()
       
            }
            
        }
    }
    
    @IBAction func aminitiesViewBtn(_ sender: Any) {
        if aminitiesViewBtn.tag == 0{
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn) {
                self.aminitiesViewHeight.constant = 128
                self.view.layoutIfNeeded()

            }
            aminitiesViewBtn.tag = 1
        }else{
            aminitiesViewBtn.tag = 0
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn) {
                self.aminitiesViewHeight.constant = 0
                self.view.layoutIfNeeded()
       
            }
            
        }
    }
    
    @IBAction func toVistersList(_ sender: Any) {
        
        let vc = GuestVC.instantiate(fromAppStoryboard: .Home)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension itemDetailVC: UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == colView{
            return 4
        } else if collectionView == addscolView{
            return 5
        }
        
        else if collectionView == typeCell{
            return 3
        }
        
        else if collectionView == categoryCol{
            return categoryArr.count
        }
        else{
            return imageArr.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == colView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AmenitiesCell.identifire, for: indexPath) as! AmenitiesCell
            return cell
        }else if collectionView == addscolView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddsCell.identifire, for: indexPath) as! AddsCell
            return cell
        }
        else if collectionView == typeCell{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChooseTypeCell.identifire, for: indexPath) as! ChooseTypeCell
            cell.delegete = self
            cell.indexRow = indexPath.row
            
            if indexPath.row == self.indexRow{
                cell.chooseBtn.layer.backgroundColor = UIColor.darkGreen.cgColor
                cell.chooseBtn.setTitleColor(UIColor.white, for: .normal)
                cell.chooseBtn.imageView?.tintColor =  UIColor.mangoYellowColor
                cell.chooseBtn.layer.cornerRadius = cell.chooseBtn.frame.height/2
                
            }else{
                cell.chooseBtn.layer.backgroundColor = UIColor.secondaryColor.cgColor
                cell.chooseBtn.setTitleColor(UIColor.mangoYellowColor, for: .normal)
                cell.chooseBtn.imageView?.tintColor =  UIColor.secondaryColor
                cell.chooseBtn.layer.cornerRadius = cell.chooseBtn.frame.height/2
            }
            return cell
        }
        else if collectionView == categoryCol{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifire, for: indexPath) as! CategoryCell
            cell.txt.text = categoryArr[indexPath.row]
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImagCell.identifire, for: indexPath) as! ImagCell
            let index = self.imageArr[indexPath.row]
            if index.level == "A"{
                cell.viewB.isHidden = true
                cell.viewAImage.image = UIImage(named: index.images.first?.name ?? "")
            }else{
                if index.images.count == 2{
                    cell.viewAImage.image = UIImage(named: index.images[0].name )
                    cell.viewBImage.image = UIImage(named: index.images[1].name )
                    cell.viewB.isHidden = false
                    
                }else{
                    cell.viewAImage.image = UIImage(named: index.images[0].name )
                    cell.viewB.isHidden = true
                    
                }
                
                
                
                
                
            }
            
            return cell
        }
        
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for cell in addscolView.visibleCells {
            if let indexPath = addscolView.indexPath(for: cell){
                let index = indexPath.row
                pagecontoller.currentPage = index
            }
            
        }
    }
}


extension itemDetailVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == reviewTab{
            return totalReview
        }else{
            return 1
            
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == reviewTab{
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderChatCell.identifire) as! HeaderChatCell
            headerView.delegate = self
            return headerView
        }else{
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            view.backgroundColor = UIColor.red
            return view
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == reviewTab{
            return UITableView.automaticDimension
        }
        else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == reviewTab{
            if section == 1{
                return 2
            }
        }else{
            if indexRow == 1{
                return 5
            }else{
                return 2
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == reviewTab{
            if indexPath.section == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: ChatReplayCell.identifire, for: indexPath) as! ChatReplayCell
                cell.delegate = self
                return cell
            }
            else{
                let cell = tableView.dequeueReusableCell(withIdentifier: DetailChatCell.identifire, for: indexPath) as! DetailChatCell
                
                return cell
            }
        }else{
            if indexRow == 1{
                let cell = categoryTab.dequeueReusableCell(withIdentifier: MenuCell.identifire, for: indexPath) as! MenuCell
                return cell
            }else if indexRow == 2{
                let cell = categoryTab.dequeueReusableCell(withIdentifier: itemHorizontalCell.identifire, for: indexPath) as! itemHorizontalCell
                return cell
            }
            
        }
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == reviewTab{
            
        }else{
            if indexRow == 1{
                let storyboard = MenuDetailVC.instantiate(fromAppStoryboard: .Home)
                
                if let presentationController = storyboard.presentationController as? UISheetPresentationController {
                    presentationController.detents = [.custom(resolver: { context in
                        return 600
                    }) ,.medium() , .large()] /// change to [.medium(), .large()] for a half *and* full screen sheet
                }
                
                self.present(storyboard, animated: true)
            }else{
                let storyboard = EventDetailVC.instantiate(fromAppStoryboard: .Home)
                
                if let presentationController = storyboard.presentationController as? UISheetPresentationController {
                    presentationController.detents = [.custom(resolver: { context in
                        return 600
                    }) ,.medium() , .large()] /// change to [.medium(), .large()] for a half *and* full screen sheet
                }
                
                self.present(storyboard, animated: true)
            }
        }
    }
    
}

extension itemDetailVC: ChooseTypeCellDelegate{
    func loadIndex(indexRow: Int) {
        self.indexRow = indexRow
        self.typeCell.reloadData()
        
        if indexRow == 0{
            totalReview = 5
            calculateCategoryTabHeight()
            reviewTab.reloadData()
        }
        if indexRow == 1 || indexRow == 2{
            calculateCategoryTabHeight()
            totalReview = 0
            DispatchQueue.main.async {
                self.categoryTab.reloadData()
                self.reviewTab.reloadData()
            }
        }
    }
    
    
}
extension itemDetailVC: HeaderChatCellDelegate, ChatReplayCellDelegate{
    func toProfilePage() {
        let vc = PersonProfileVC.instantiate(fromAppStoryboard: .Home)
        self.navigationController?.pushViewController(vc, animated:true)
    }
    
    
}
