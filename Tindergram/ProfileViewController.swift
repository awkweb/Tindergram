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
  
}
