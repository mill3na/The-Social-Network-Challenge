//
//  UsersView.swift
//  The Social Network Challenge
//
//  Created by Milena Maia Araújo on 15/08/22.
//

import SwiftUI

struct UsersView: View {
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                Text("oi")
            }
            
            
            .navigationTitle("Find Users")
            .frame(maxWidth: .infinity)
            .background {
                LinearGradient(
                    gradient: .init(colors: [Color.blue,Color.white]), startPoint: .top, endPoint: .bottom
                )
            }
            .ignoresSafeArea(.all)
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
