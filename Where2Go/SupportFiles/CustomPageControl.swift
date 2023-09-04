//
//  CustomPageControl.swift
//  Where2Go
//
//  Created by Kiran on 17/08/23.
//

import Foundation
import UIKit

class CustomPageControl: UIPageControl {

@IBInspectable var currentPageImage: UIImage?

@IBInspectable var otherPagesImage: UIImage?

override var numberOfPages: Int {
    didSet {
        updateDots()
    }
}

override var currentPage: Int {
    didSet {
        updateDots()
    }
}

override func awakeFromNib() {
    super.awakeFromNib()
}

private func defaultConfigurationForiOS14AndAbove() {
    if #available(iOS 14.0, *) {
        for index in 0..<numberOfPages {
            let image = index == currentPage ? currentPageImage : otherPagesImage
            setIndicatorImage(image, forPage: index)
        }

    }
}

private func updateDots() {
    if #available(iOS 14.0, *) {
        defaultConfigurationForiOS14AndAbove()
    } else {
        for (index, subview) in subviews.enumerated() {
            let imageView: UIImageView
            if let existingImageview = getImageView(forSubview: subview) {
                imageView = existingImageview
            } else {
                imageView = UIImageView(image: otherPagesImage)
                
                imageView.center = subview.center
                subview.addSubview(imageView)
                subview.clipsToBounds = false
            }
            imageView.image = currentPage == index ? currentPageImage : otherPagesImage
        }
    }
}

private func getImageView(forSubview view: UIView) -> UIImageView? {
    if let imageView = view as? UIImageView {
        return imageView
    } else {
        let view = view.subviews.first { (view) -> Bool in
            return view is UIImageView
        } as? UIImageView

        return view
    }
}
}
