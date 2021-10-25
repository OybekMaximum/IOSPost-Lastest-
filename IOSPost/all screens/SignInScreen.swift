//
//  SignInScreen.swift
//  IOSPost
//
//  Created by Oybek To’laboyev on 11/10/21.
//

import SwiftUI
import Firebase

struct SignInScreen: View {
    @EnvironmentObject var session: SessionStore
    @State var email = "treyktoriya@gmail.com"
    @State var password = "Oybek1234"
    @State var isLoading = false
    
    func doSignIn(){
        isLoading = true
        SessionStore().signIn(email: email, password: password, handler: {(res, err) in
            isLoading = false
            if err != nil{
                print("check email or password")
                return
            }
            print("user signed in")
            session.listen()
            
        
        })
    }
    
    var body: some View {
        NavigationView{
            ZStack{
        VStack{
            Spacer()
            Text("welcome back").font(.system(size: 30))
            TextField("email", text: $email)
                .frame(height: 45).padding(.leading, 10)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            SecureField("password", text: $password)
                .frame(height: 45).padding(.leading, 10)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            Button(action: {
                doSignIn()
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
                   Text("Don't have an account?")
                    NavigationLink (
                        destination: SignUpScreen(),
                        label: {
                            Text("Sign Up")
                        })
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


struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}
