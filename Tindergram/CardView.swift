//
//  CardView.swift
//  Tindergram
//
//  Created by thomas on 3/31/15.
//  Copyright (c) 2015 thomas. All rights reserved.
//

import Foundation
import UIKit

class CardView: UIView {
  
  private let imageView: UIImageView = UIImageView()
  private let nameLabel: UILabel = UILabel()
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initialize()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initialize()
  }
  
  override init() {
    super.init()
    initialize()
  }
  
  private func initialize() {
    imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
    imageView.backgroundColor = UIColor.redColor()
    addSubview(imageView)
    
    nameLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
    addSubview(nameLabel)
    
    backgroundColor = UIColor.whiteColor()
    layer.borderWidth = 0.5
    layer.borderColor = UIColor.lightGrayColor().CGColor // converts UIColor to correct type
    layer.cornerRadius = 5
    layer.masksToBounds = true // things cannot exceed the cardview's bounds
    
    setConstraints()
  }
  
  private func setConstraints() {
    
    // imageView Constraints
    addConstraint(NSLayoutConstraint(item: imageView, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: 0))
    addConstraint(NSLayoutConstraint(item: imageView, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1.0, constant: 0))
    addConstraint(NSLayoutConstraint(item: imageView, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 1.0, constant: 0))
    addConstraint(NSLayoutConstraint(item: imageView, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 1.0, constant: 0))
    
    // nameLabel Constraints
    addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .Top, relatedBy: .Equal, toItem: imageView, attribute: .Top, multiplier: 1.0, constant: 0))
    addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1.0, constant: 10))
    addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1.0, constant: -10))
    addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .Bottom, relatedBy: .Equal, toItem: imageView, attribute: .Bottom, multiplier: 1.0, constant: 0))
  }
}