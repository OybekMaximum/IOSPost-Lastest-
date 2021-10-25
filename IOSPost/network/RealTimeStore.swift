//
//  RealTimeStore.swift
//  IOSPost
//
//  Created by Oybek To’laboyev on 18/10/21.
//


import Foundation
import SwiftUI
import Firebase
import FirebaseDatabase

class RealtimeStore: ObservableObject {
    var ref: DatabaseReference = Database.database().reference(withPath: "posts")
    @Published var items: [Post] = []
    
    func storePost(post: Post, completion: @escaping (_ success: Bool) -> ()) {
        var success = true
        let toBePosted = ["title": post.title!, "content": post.content!]
        
        ref.childByAutoId().setValue(toBePosted){ (error, ref) -> Void in
            if error != nil{
                success =  false
            }
        }
        completion(success)
    }
    
    func loadPosts(completion: @escaping () -> ()) {
        ref.observe(DataEventType.value) { (snapshot) in
            self.items = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot {
                    let value = snapshot.value as? [String: AnyObject]
                    let title = value!["title"] as? String
                    let content = value!["content"] as? String
                    
                    self.items.append(Post(title: title, content: content))
                }
            }
            completion()
        }
    }
}
