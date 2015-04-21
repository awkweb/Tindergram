//
//  CardsViewController.swift
//  Tindergram
//
//  Created by thomas on 3/31/15.
//  Copyright (c) 2015 thomas. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
  
  struct Card {
    let cardView: CardView
    let swipeView: SwipeView
    let user: User
  }
  
  let frontCardTopMargin: CGFloat = 0
  let backCardTopMargin: CGFloat = 10
  
  @IBOutlet weak var cardStackView: UIView!
  
  @IBOutlet weak var nahButton: UIButton!
  @IBOutlet weak var yeahButton: UIButton!
  
  var backCard: Card?
  var frontCard: Card?
  
  var users: [User]?
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationItem.titleView = UIImageView(image: UIImage(named: "nav-header"))
    let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "profile-button"), style: .Plain, target: self, action: "goToProfile:")
    navigationItem.setLeftBarButtonItem(leftBarButtonItem, animated: true)
    let rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "chat-header"), style: .Plain, target: self, action: "goToMatches:")
    navigationItem.setRightBarButtonItem(rightBarButtonItem, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    cardStackView.backgroundColor = UIColor.clearColor()
    nahButton.setImage(UIImage(named: "nah-button-pressed"), forState: .Highlighted)
    yeahButton.setImage(UIImage(named: "yeah-button-pressed"), forState: .Highlighted)
    
    fetchUnviewedUsers({
      returnUsers in
      self.users = returnUsers
      
      if let card = self.popCard() {
        self.frontCard = card
        self.cardStackView.addSubview(self.frontCard!.swipeView)
      }
      
      if let card = self.popCard() {
        self.backCard = card
        self.backCard!.swipeView.frame = self.createCardFrame(self.backCardTopMargin)
        self.cardStackView.insertSubview(self.backCard!.swipeView, belowSubview: self.frontCard!.swipeView)
      }
    })
  }
  
  @IBAction func nahButtonPressed(sender: UIButton) {
    if let card = frontCard {
      card.swipeView.swipeDirection(.Left)
    }
  }
  
  @IBAction func yeahButtonPressed(sender: UIButton) {
    if let card = frontCard {
      card.swipeView.swipeDirection(.Right)
    }
  }
  
  func goToProfile(button: UIBarButtonItem) {
      pageController.goToPreviousVC()
  }
  
  func goToMatches(button: UIBarButtonItem) {
    pageController.goToNextVC()
  }

  private func createCardFrame(topMargin: CGFloat) -> CGRect {
    return CGRect(x: 0, y: topMargin, width: cardStackView.frame.width, height: cardStackView.frame.height)
  }
  
  private func createCard(user: User) -> Card {
    let cardView = CardView()
    
    cardView.name = user.name
    user.getPhoto({
      image in
      cardView.image = image
    })
    
    let swipeView = SwipeView(frame: createCardFrame(frontCardTopMargin))
    swipeView.delegate = self
    swipeView.innerView = cardView
    return Card(cardView: cardView, swipeView: swipeView, user: user)
  }
  
  private func popCard() -> Card? {
    if users != nil && users?.count > 0 {
      return createCard(users!.removeLast())
    }
    return nil
  }
  
  private func switchCards() {
    if let card = backCard {
      frontCard = card
      UIView.animateWithDuration(0.2, animations: {
        self.frontCard!.swipeView.frame = self.createCardFrame(self.frontCardTopMargin)
      })
    }
    
    if let card = self.popCard() {
      backCard = card
      backCard!.swipeView.frame = createCardFrame(backCardTopMargin)
      cardStackView.insertSubview(backCard!.swipeView, belowSubview: frontCard!.swipeView)
    }
  }
  
}


// MARK: SwipeViewDelegate
extension CardsViewController: SwipeViewDelegate {
  
  func swipedLeft() {
    println("left")
    if let frontCard = frontCard {
      frontCard.swipeView.removeFromSuperview()
      saveSkip(frontCard.user)
      switchCards()
    }
  }
  
  func swipedRight() {
    println("right")
    if let frontCard = frontCard {
      frontCard.swipeView.removeFromSuperview()
      saveLike(frontCard.user)
      switchCards()
    }
  }
  
}
