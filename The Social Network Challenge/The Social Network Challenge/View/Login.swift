//
//  Login.swift
//  The Social Network Challenge
//
//  Created by Milena Maia Araújo on 16/08/22.
//

import Foundation


import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationView{
            VStack{
                Text("Login")
                    .font(.title)
                    .fontWeight(.regular)
                    .kerning(1.9) // espaçamento das letras
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("User name:")
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                    TextField("user@gmail.com", text: $email)
                        .font(.system(size: 20, weight: .semibold))
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                        .padding(.top, 5)
                    Divider()
                })
                .padding(.top, 20)
                
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("User password:")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    SecureField("********", text: $password)
                        .font(.system(size: 20, weight: .semibold))
                        .disableAutocorrection(true)
                        .padding(.top, 5)
                    Divider()
                })
                .padding(.top, 20)
                
                Button(action: {}, label: {
                    Text("Forgot password?")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                })
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 10)
                
                NavigationLink(destination: ContentView()){
                    Text("Log In")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .background(.blue)
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.3), radius: 12, x: 0, y: 0)
                }
                
//                Button(action: {
//
//                    print($email)
//                    print($password)
//                }, label: {
//                    Text("Log In")
//                        .font(.system(size: 24, weight: .semibold))
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(.blue)
//                        .cornerRadius(12)
//                        .shadow(color: .black.opacity(0.3), radius: 12, x: 0, y: 0)
//                })
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 10)
                HStack{
                    Text("Don't have an account?")

                    // Usar binding e passar ele pra Register Screen pra que ela faça o "Back" funcionar setando binding pra false
                    //NavigationLink(destination: , isActive: , label: )

                    NavigationLink(destination: RegisterScreen()){
                        Text("Sign In")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 5)
                }
                Spacer()
                
            }
            .padding()
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
