//
//  Login.swift
//  The Social Network Challenge
//
//  Created by Natalia Locatelli Barbosa on 16/08/22.
//

import Foundation


import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack{
            Text("Login")
                .font(.title)
                .fontWeight(.semibold)
                .kerning(1.9) // espaçamento das letras
                .frame(maxWidth: .infinity, alignment: .leading)

            VStack(alignment: .leading, spacing: 8, content: {
                Text("User name")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                TextField("user@gmail.com", text: $email)
                    .font(.system(size: 20, weight: .semibold))
                    .disableAutocorrection(true)
                    .padding(.top, 5)
                Divider()
            })
            .padding(.top, 20)

                        VStack(alignment: .leading, spacing: 8, content: {
                            Text("User password")
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                            TextField("**", text: $password)
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

                        Button(action: {}, label: {
                            Text("Log In")
                                .font(.system(size: 24, weight: .semibold))
                                .foregroundColor(.white)
                                .padding()
                                .background(.blue)
                                .cornerRadius(12)
                        })
                    }
                    .padding()
                }
            }

            struct LoginView_Previews: PreviewProvider {
                static var previews: some View {
                    LoginView()
                }
            }
