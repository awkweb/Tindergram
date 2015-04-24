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
  let outgoingBubble = JSQMessagesBubbleImageFactory().outgoingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleBlueColor())
  let incomingBubble = JSQMessagesBubbleImageFactory().incomingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleLightGrayColor())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    senderDisplayName = currentUser()!.id
    senderId = currentUser()!.id
    
    collectionView.collectionViewLayout.incomingAvatarViewSize = CGSizeZero
    collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSizeZero
  }
  
  override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
    var data = self.messages[indexPath.row]
    return data
  }
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return messages.count
  }
  
  override func collectionView(collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource! {
    
    var data = messages[indexPath.row]
    if data.senderId == PFUser.currentUser()!.objectId! {
      return outgoingBubble
    } else {
      return incomingBubble
    }
  }
  
  override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {
    
    let m = JSQMessage(senderId: senderId, senderDisplayName: senderDisplayName, date: date, text: text)
    messages.append(m)
    finishSendingMessage()
  }
  
}