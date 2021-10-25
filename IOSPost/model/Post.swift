//
//  Post.swift
//  IOSPost
//
//  Created by Oybek To’laboyev on 18/10/21.
//

import Foundation
import Foundation

struct Post: Hashable {
    var title: String?
    var content: String?
    var imgUrl: String?
    
    init(title: String?, content: String?) {
        self.title = title
        self.content = content
    }
    
    init(title: String?, content: String?, imgUrl: String?) {
        self.title = title
        self.content = content
        self.imgUrl = imgUrl
    }
}
