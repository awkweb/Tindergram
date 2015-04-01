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
  
  enum Direction {
    case None
    case Right
    case Left
  }
  
  private let card: CardView = CardView()
  private var originalPoint: CGPoint?
  
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
    backgroundColor = UIColor.redColor() // Change back to clearColor
    addSubview(card)
    
    addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "dragged:"))
    card.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
  }
  
  func dragged(gestureRecognizer: UIPanGestureRecognizer) {
    let distance = gestureRecognizer.translationInView(self)
    println("distance x: \(distance.x), y: \(distance.y)")
    
    switch gestureRecognizer.state {
    case .Began:
     originalPoint = center
    case .Changed:
      let rotationPercentage = min(distance.x/(self.superview!.frame.width/2), 1)
      let rotationAngle = (CGFloat(2*M_PI/16)*rotationPercentage)
      transform = CGAffineTransformMakeRotation(rotationAngle)
      center = CGPointMake(originalPoint!.x + distance.x, originalPoint!.y + distance.y)
    case .Ended:
      resetViewPositionAndTransformations()
    default:
      println("Default triggered for GestureRecognizer")
      break
    }
  }
  
  func swipe(direction: Direction) {
    if direction == .None {
      return
    }
    var parentWidth = superview!.frame.size.width
    if direction == .Left {
      parentWidth *= -1
    }
    UIView.animateWithDuration(0.2, animations: { () -> Void in
      self.center.x = self.frame.origin.x + parentWidth
    })
  }
  
  private func resetViewPositionAndTransformations() {
    UIView.animateWithDuration(0.2, animations: { () -> Void in
      self.center = self.originalPoint!
      self.transform = CGAffineTransformMakeRotation(0)
    })
  }
  
}