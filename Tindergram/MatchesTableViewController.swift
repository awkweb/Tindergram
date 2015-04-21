//
//  MatchesTableViewController.swift
//  Tindergram
//
//  Created by thomas on 4/21/15.
//  Copyright (c) 2015 thomas. All rights reserved.
//

import UIKit

class MatchesTableViewController: UITableViewController {
  
  var matches: [Match] = []
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationItem.titleView = UIImageView(image: UIImage(named: "chat-header"))
    let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav-back-button"), style: UIBarButtonItemStyle.Plain, target: self, action: "goToPreviousVC:")
    navigationItem.setLeftBarButtonItem(leftBarButtonItem, animated: true)
    
    fetchMatches({
      matches in
      self.matches = matches
      self.tableView.reloadData()
    })
  }
  
  func goToPreviousVC(button: UIBarButtonItem) {
    pageController.goToPreviousVC()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return matches.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("UserCell", forIndexPath: indexPath) as! UserCell
    
    let user = matches[indexPath.row].user
    cell.nameLabel.text = user.name
    user.getPhoto({
      image in
      cell.avatarImageView.image = image
    })
    return cell
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
  
}
