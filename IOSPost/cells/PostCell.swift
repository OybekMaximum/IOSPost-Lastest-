//
//  PostCell.swift
//  IOSPost
//
//  Created by Oybek To’laboyev on 18/10/21.
//

import SwiftUI

struct PostCell: View {
    var post: Post
    
    var body: some View {
        
        
        VStack(alignment: .leading){
            
            Text(post.title!.uppercased())
                .fontWeight(.bold)
            Text(post.content!).padding(.top,5)
        }
    }
    
    
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {

        PostCell(post: Post(title: "helo", content: "salom"))
    }
}
