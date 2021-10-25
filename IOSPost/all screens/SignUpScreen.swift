//
//  SignUpScreen.swift
//  IOSPost
//
//  Created by Oybek To’laboyev on 11/10/21.
//

import SwiftUI
import Firebase

struct SignUpScreen: View {
    
    @Environment(\.presentationMode) var presentation
    @State var fullname = ""
    @State var email = ""
    @State var password = ""
    @State var isLoading = false
    
    func doSignUp(){
        isLoading = true
        SessionStore().signUp(email: email, password: password, handler: {(res, err) in
            isLoading = false
            if err != nil{
                print("user not created")
                return
            }
            print("user created")
            presentation.wrappedValue.dismiss()
        
        })
    }
    
    var body: some View {
        NavigationView{
            ZStack{
        VStack{
            Spacer()
            Text("Creat Your Account").font(.system(size: 30))
            TextField("Fullname", text: $fullname)
                .frame(height: 45).padding(.leading, 10)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            TextField("Email", text: $email)
                .frame(height: 45).padding(.leading, 10)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            SecureField("Password", text: $password)
                .frame(height: 45).padding(.leading, 10)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            Button(action: {
                doSignUp()
            },label: {
                Spacer()
                Text("Sign In").foregroundColor(.white)
                Spacer()
            })
                .frame(height: 45).background(Color.blue)
            .cornerRadius(8)
            Spacer()
                        
            VStack{
                HStack{
                    Spacer()
                   Text("Already have an account?")
                    Button {
                        presentation.wrappedValue.dismiss()
                    } label: {
                        Text("Sign In")
                    }

                    Spacer()
                    }
                
                }
            }.padding()
                
                if isLoading{
                                ProgressView()
                            }
        }
            
        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
