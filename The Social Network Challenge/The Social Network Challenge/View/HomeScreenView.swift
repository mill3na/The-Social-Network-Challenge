//
//  ContentView.swift
//  The Social Network Challenge
//
//  Created by Milena Maia Araújo on 11/08/22.
//

import SwiftUI

struct HomeScreenView: View {
    
    @State var index = 0
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    HStack{
                       Spacer(minLength: 0)
                    }
                    .padding(.horizontal)
                    HStack{
                        buttomPhotos
                        buttomText
                    } // hstack
                    .padding(.horizontal)
                    .padding(.top, 10)
                    Spacer()
                    ZStack{
                    Rectangle()
                        .frame(width: 350, height: 200)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                        .opacity(0.6)
                        .padding()
                    }
                }
                
            }
            .background(
                LinearGradient(gradient: .init(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom))
            .navigationTitle("Explore")
        }
    }
    
    var buttomPhotos: some View {
        Text("Fotos")
            .font(.system(size: 15))
            .foregroundColor(index == 0 ? .white : Color.black.opacity(0.85))
            .fontWeight(.bold)
            .padding(.vertical, 6)
            .padding(.horizontal, 20)
            .background(Color.orange.opacity(index == 0 ? 1 : 0))
            .clipShape(Capsule())
            .onTapGesture {
                index = 0
            }
    }
    
    var buttomText: some View {
        Text("Textos")
            .font(.system(size: 15))
            .foregroundColor(index == 1 ? .white : Color.black.opacity(0.85))
            .fontWeight(.bold)
            .padding(.vertical, 6)
            .padding(.horizontal, 20)
            .background(Color.orange.opacity(index == 01 ? 1 : 0))
            .clipShape(Capsule())
            .onTapGesture {
                index = 1
            }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
