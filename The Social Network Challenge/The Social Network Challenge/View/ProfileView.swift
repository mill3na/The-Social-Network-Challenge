//
//  ProfileView.swift
//  The Social Network Challenge
//
//  Created by Natalia Locatelli Barbosa on 17/08/22.
//

import Foundation

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
            }
            .navigationTitle("Profile")
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
