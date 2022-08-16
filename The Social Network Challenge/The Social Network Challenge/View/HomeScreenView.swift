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
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                HStack{
                    Button(action: {}) {
                        Image(systemName: "photo.artframe")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "cursorarrow.motionlines.click")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                    }
                }
                .padding()
                
                HStack{
                    Text("Trending")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {}) {
                        
                        Image("sun.min")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .rotationEffect(.init(degrees: 90))
                    }
                }
                .padding(.horizontal)
                
                HStack{
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
                .padding(.horizontal)
                .padding(.top, 10)
                
                // card view
                
                ZStack{
                    
                }
                
                Spacer()
            }
        }
        .background(
            LinearGradient(gradient: .init(colors: [Color.purple, Color.red]), startPoint: .top, endPoint: .bottom))
        .ignoresSafeArea(.all)
        NavigationView{
            
                
            
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
