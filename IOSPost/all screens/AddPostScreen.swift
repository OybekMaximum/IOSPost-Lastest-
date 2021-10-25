//
//  AddPostScreen.swift
//  IOSPost
//
//  Created by Oybek To’laboyev on 18/10/21.
//

import SwiftUI

struct AddPostScreen: View {
    
    @ObservedObject var database = RealtimeStore()
    
    @Environment(\.presentationMode) var presentation
    @State var isLoading = false
    @State var title: String = ""
    @State var content: String = ""
    
    func addNewPost(){
        let post = Post(title: title, content: content)
        database.storePost(post: post, completion: { success in
            isLoading = false
            if success {
                self.presentation.wrappedValue.dismiss()
            }
        })
    }
    
    
    
    var body: some View {
       
        ZStack{
            VStack{
                
                TextField("Title", text: $title)
                    .frame(height: 50).padding(.leading, 10)
                    .background(Color.gray.opacity(0.2)).cornerRadius(8)
                TextField("Content", text: $content)
                    .frame(height: 70).padding(.leading, 10)
                    .background(Color.gray.opacity(0.2)).cornerRadius(8)
                
                Button(action: {
                    addNewPost()
                   
                }, label: {
                    Spacer()
                    Text("Add").foregroundColor(.white)
                    Spacer()
                })
                .frame(height: 45).background(Color.blue).cornerRadius(8)
                Spacer()
            }.padding()
            if isLoading {
                ProgressView()
            }
        }
    }
}


struct AddPostScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddPostScreen()
    }
}
