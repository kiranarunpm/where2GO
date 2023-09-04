//
//  WTGView.swift
//  Where2Go
//
//  Created by Kiran on 18/08/23.
//

import Foundation
import UIKit
@IBDesignable class WTGView: UIView {
    
    @IBInspectable var style: Int = 0 {
        didSet {
            updateView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateView()
    }
    
    override func prepareForInterfaceBuilder() {
        updateView()
    }
    override func awakeFromNib() {
    }
    //MARK: LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch style {
            
        case 0:
            layer.cornerRadius = frame.height/2
            layer.backgroundColor = UIColor.lightGrayColor.cgColor
            
            
        default: break
            
        }
        
    }
    
    
    func updateView() {
        
        switch style {
            
        case 0:
            layer.cornerRadius = frame.height/2
            layer.backgroundColor = UIColor.lightGrayColor.cgColor

        default:
            break
        }
    }
    
}
