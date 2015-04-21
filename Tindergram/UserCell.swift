//
//  UserCell.swift
//  Tindergram
//
//  Created by thomas on 4/21/15.
//  Copyright (c) 2015 thomas. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
  
  @IBOutlet weak var avatarImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
    avatarImageView.layer.masksToBounds = true
  }
  
}
