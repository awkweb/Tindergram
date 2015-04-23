//
//  ChatViewController.swift
//  Tindergram
//
//  Created by thomas on 4/22/15.
//  Copyright (c) 2015 thomas. All rights reserved.
//

import Foundation

class ChatViewController: JSQMessagesViewController {
  
  var messages: [JSQMessage] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  func sendersDisplayName() -> String! {
    return currentUser()!.id
  }
  
  func sendersId() -> String! {
    return currentUser()!.id
  }
  
  override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
    var data = self.messages[indexPath.row]
    return data
  }
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return messages.count
  }
  
}