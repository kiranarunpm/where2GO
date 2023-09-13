//
//  WTGButton.swift
//  Where2Go
//
//  Created by Kiran on 17/08/23.
//

import Foundation
import UIKit
@IBDesignable class WTGIButton: UIButton {
    
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
    
    var shadowLayer: CAShapeLayer!
    
    override func awakeFromNib() {
        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    //MARK: LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch style {
            
        case 0:
            if shadowLayer == nil {
                
                addShadowPathLayer(fillColor: UIColor.secondaryColor)
                self.setTitleColor(UIColor.black, for: .normal)
                self.titleLabel?.font =  UIFont.WTGfont(.semibold, size: 14)

            }
            
        case 1:
            
            addShadowPathLayer(fillColor: UIColor.darkGreen)
            self.setTitleColor(UIColor.white, for: .normal)
            self.titleLabel?.font =  UIFont.WTGfont(.semibold, size: 14)

            
        case 2:
            
            addShadowPathLayer(fillColor: UIColor.mangoYellowColor)
            self.setTitleColor(UIColor.white, for: .normal)
            self.titleLabel?.font =  UIFont.WTGfont(.semibold, size: 14)

            
        case 3:
            
            self.setTitleColor(UIColor.lightGreenColor, for: .normal)
            self.titleLabel?.font =  UIFont.WTGfont(.regular, size: 14)

        case 4:
            
            self.setTitleColor(UIColor.darkGray, for: .normal)
            self.titleLabel?.font =  UIFont.WTGfont(.semibold, size: 14)

            
        case 5:
            addShadowPathLayer(fillColor: UIColor.darkBrownColor)
            self.setTitleColor(UIColor.white, for: .normal)
            self.titleLabel?.font =  UIFont.WTGfont(.semibold, size: 14)

            
        case 6:
            self.setTitleColor(UIColor.white, for: .normal)
            self.tintColor = UIColor.white
            layer.backgroundColor = UIColor.darkGreen.cgColor
            layer.cornerRadius = frame.height/2
            self.imageView?.tintColor =  UIColor.white
            self.titleLabel?.font =  UIFont.WTGfont(.semibold, size: 14)



        case 7:
            layer.backgroundColor = UIColor.white.cgColor
            layer.borderWidth = 1
            layer.borderColor = UIColor.darkGreen.cgColor
            self.setTitleColor(UIColor.darkGreen, for: .normal)
            self.tintColor = UIColor.darkGreen
            layer.cornerRadius = frame.height/2
            self.imageView?.tintColor =  UIColor.black
            self.titleLabel?.font =  UIFont.WTGfont(.semibold, size: 14)



        case 8:
            addShadowPathLayer(fillColor: UIColor.darkGreen)
            self.setTitleColor(UIColor.white, for: .normal)
            self.imageView?.tintColor =  UIColor.primaryColor
            self.titleLabel?.font =  UIFont.WTGfont(.semibold, size: 14)


        case 9:
            addShadowPathLayer(fillColor: UIColor.darkGreen)
            self.imageView?.tintColor =  UIColor.white
            self.titleLabel?.font =  UIFont.WTGfont(.semibold, size: 14)

            
            
        case 10:
            layer.backgroundColor = UIColor.secondaryColor.cgColor
            self.setTitleColor(UIColor.mangoYellowColor, for: .normal)
            self.imageView?.tintColor =  UIColor.mangoYellowColor
            layer.cornerRadius = frame.height/2
            self.titleLabel?.font =  UIFont.WTGfont(.semibold, size: 14)

            
        case 11:
            layer.backgroundColor = UIColor.white.cgColor
            self.setTitleColor(UIColor.black, for: .normal)
            self.imageView?.tintColor =  UIColor.secondaryColor
            layer.cornerRadius = frame.height/2
            layer.borderColor = UIColor.secondaryColor.cgColor
            layer.borderWidth = 1
            self.titleLabel?.font =  UIFont.WTGfont(.semibold, size: 14)

            
        case 12:
            addShadowPathLayer(fillColor: UIColor.darkGreen)
            self.setTitleColor(UIColor.secondaryColor, for: .normal)
            self.titleLabel?.font =  UIFont.WTGfont(.regular, size: 14)

            
        case 13:
            layer.backgroundColor = UIColor.white.cgColor
            self.setTitleColor(UIColor.black, for: .normal)
            layer.cornerRadius = frame.height/2
            layer.borderColor = UIColor.black.cgColor
            layer.borderWidth = 1
            self.titleLabel?.font =  UIFont.WTGfont(.semibold, size: 14)

            
        case 14:
            layer.backgroundColor = UIColor.white.cgColor
            self.setTitleColor(UIColor.mangoYellowColor, for: .normal)
            self.imageView?.tintColor =  UIColor.mangoYellowColor
            layer.cornerRadius = frame.height/2
            layer.borderColor = UIColor.mangoYellowColor.cgColor
            layer.borderWidth = 1
            self.titleLabel?.font =  UIFont.WTGfont(.semibold, size: 14)

        case 15:
            
            layer.backgroundColor = UIColor.lightMangoColor.cgColor
            self.setTitleColor(UIColor.mangoYellowColor, for: .normal)
            layer.cornerRadius = frame.height/2
            self.titleLabel?.font =  UIFont.WTGfont(.semibold, size: 14)
            
        default: break
            
        }
    }
    
    
    
    func updateView() {
        
        switch style {
            
    
        case 6:
            self.setTitleColor(UIColor.white, for: .normal)
            self.tintColor = UIColor.white
            self.titleLabel?.font =  UIFont.WTGfont(.semibold, size: 14)
            layer.backgroundColor = UIColor.darkGreen.cgColor
            layer.cornerRadius = frame.height/2

        case 7:
            layer.backgroundColor = UIColor.white.cgColor
            layer.borderWidth = 1
            layer.borderColor = UIColor.darkGreen.cgColor
            self.setTitleColor(UIColor.darkGreen, for: .normal)
            self.tintColor = UIColor.darkGreen
            self.titleLabel?.font =  UIFont.WTGfont(.semibold, size: 14)
            layer.cornerRadius = frame.height/2
            
        case 9:
            addShadowPathLayer(fillColor: UIColor.darkGreen)
            self.imageView?.tintColor =  UIColor.white
            
            
        case 10:
            layer.backgroundColor = UIColor.secondaryColor.cgColor
            self.setTitleColor(UIColor.mangoYellowColor, for: .normal)
            self.imageView?.tintColor =  UIColor.mangoYellowColor
            layer.cornerRadius = frame.height/2
            self.titleLabel?.font =  UIFont.WTGfont(.semibold, size: 14)

        case 14:
            layer.backgroundColor = UIColor.white.cgColor
            self.setTitleColor(UIColor.mangoYellowColor, for: .normal)
            self.imageView?.tintColor =  UIColor.mangoYellowColor
            layer.cornerRadius = frame.height/2
            layer.borderColor = UIColor.mangoYellowColor.cgColor
            layer.borderWidth = 1
            self.titleLabel?.font =  UIFont.WTGfont(.semibold, size: 14)
            

        default: break
            
        }
    }
    
    //MARK: AddShadowPathLayer
    func addShadowPathLayer(fillColor: UIColor) {
        shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: self.frame.height/2).cgPath
        shadowLayer.fillColor = fillColor.cgColor
        layer.cornerRadius = frame.height/2
        layer.insertSublayer(shadowLayer, at: 0)
    }
}
