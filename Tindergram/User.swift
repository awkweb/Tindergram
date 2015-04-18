//
//  User.swift
//  Tindergram
//
//  Created by thomas on 4/14/15.
//  Copyright (c) 2015 thomas. All rights reserved.
//

import Foundation

struct User {
  let id: String
  let name: String
  private let pfUser: PFUser
  
  func getPhoto(callback: (UIImage) -> ()) {
    let imageFile = pfUser.objectForKey("picture") as! PFFile
    
    imageFile.getDataInBackgroundWithBlock({
      data, error in
      if let data = data {
        callback(UIImage(data: data)!)
      }
    })
  }
}

private func pfUserToUser(user: PFUser) -> User {
  return User(id: user.objectId!, name: user.objectForKey("firstName") as! String, pfUser: user)
}

func currentUser() -> User? {
  if let user = PFUser.currentUser() {
    return pfUserToUser(user)
  }
  return nil
}

func fetchUnviewedUsers(callback: ([User] -> ())) {
  
  PFQuery(className: "Action")
  .whereKey("byUser", equalTo: PFUser.currentUser()!.objectId!).findObjectsInBackgroundWithBlock({
    objects, error in
    
    let seenIDS = map(objects!, {$0.objectForKey("toUser")!})
    
    PFUser.query()!
      .whereKey("objectId", notEqualTo: PFUser.currentUser()!.objectId!)
      .whereKey("objectId", notContainedIn: seenIDS)
      .findObjectsInBackgroundWithBlock({
        objects, error in
        
        if let pfUsers = objects as? [PFUser] {
          let users = map(pfUsers, {pfUserToUser($0)})
          callback(users)
        }
      })
  })
}

func saveSkip(user: User) {
  let skip = PFObject(className: "Action")
  skip.setObject(PFUser.currentUser()!.objectId!, forKey: "byUser")
  skip.setObject(user.id, forKey: "toUser")
  skip.setObject("skipped", forKey: "type")
  skip.saveInBackgroundWithBlock(nil)
}

func saveLike(user: User) {
  let like = PFObject(className: "Action")
  like.setObject(PFUser.currentUser()!.objectId!, forKey: "byUser")
  like.setObject(user.id, forKey: "toUser")
  like.setObject("liked", forKey: "type")
  like.saveInBackgroundWithBlock(nil)
}

