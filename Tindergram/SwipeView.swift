//
//  SwipeView.swift
//  Tindergram
//
//  Created by thomas on 3/31/15.
//  Copyright (c) 2015 thomas. All rights reserved.
//

import Foundation
import UIKit

class SwipeView: UIView {
  
  private let card: CardView = CardView()
  
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
    backgroundColor = UIColor.clearColor()
    addSubview(card)
    
    card.setTranslatesAutoresizingMaskIntoConstraints(false) // remove any predefined constraints
    
    setConstraints()
  }
  
  private func setConstraints() {
    
    addConstraint(NSLayoutConstraint(item: card, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: 0))
    addConstraint(NSLayoutConstraint(item: card, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: 0))
    addConstraint(NSLayoutConstraint(item: card, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1.0, constant: 0))
    addConstraint(NSLayoutConstraint(item: card, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1.0, constant: 0))
  }
}