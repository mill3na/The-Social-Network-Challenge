//
//  RegisterScreen.swift
//  The Social Network Challenge
//
//  Created by Milena Maia Araújo on 16/08/22.
//

import SwiftUI

struct RegisterScreen: View {
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack{
            Text("Sign In")
                .font(.title)
                .fontWeight(.regular)
                .kerning(1.9) // espaçamento das letras
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text("User email")
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
                Text("User password")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                SecureField("********", text: $password)
                    .font(.system(size: 20, weight: .semibold))
                    .disableAutocorrection(true)
                    .padding(.top, 5)
                Divider()
            })
            .padding(.top, 20)
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text("Confirm password")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                SecureField("********", text: $confirmPassword)
                    .font(.system(size: 20, weight: .semibold))
                    .disableAutocorrection(true)
                    .padding(.top, 5)
                Divider()
            })
            .padding(.top, 20)
            Button(action: {
                Task {
                    let newUser = NewUser(name: "Milena maia", email: "maia@teste.br", password: "batman")
                    await viewModel.createNewUser(newUser: newUser)
                    
                    print("User created! Email: \(email). ")
                }

            }, label: {
                Text("Sign  In")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.3), radius: 12, x: 0, y: 0)
            })
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 10)
            HStack{
                Text("Already a member?")
                NavigationLink(destination: LoginView()){
                    Text("Log In")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                .padding(.top, 5)
            }
            Spacer()
            Text("By creating an account, you agree with the Terms of Privacy and Services.")
                .font(.callout)
            
        }
        .padding()
    }
}


struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
