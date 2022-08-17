//
//  FavoritesView.swift
//  The Social Network Challenge
//
//  Created by Milena Maia Araújo on 15/08/22.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
            }
            .navigationTitle("Favorite Posts")
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

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
