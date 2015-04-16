//
//  ProfileViewController.swift
//  Tindergram
//
//  Created by thomas on 4/14/15.
//  Copyright (c) 2015 thomas. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationItem.titleView = UIImageView(image: UIImage(named: "profile-header"))
    let rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav-back-button"), style: .Plain, target: self, action: "goToCards:")
    navigationItem.setRightBarButtonItem(rightBarButtonItem, animated: true)
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    nameLabel.text = currentUser()?.name
    currentUser()?.getPhoto({
      image in
      self.imageView.layer.masksToBounds = true
      self.imageView.contentMode = .ScaleAspectFill
      self.imageView.image = image
    })
  }
  
  func goToCards(button: UIBarButtonItem) {
    pageController.goToNextVC()
  }
  
}
