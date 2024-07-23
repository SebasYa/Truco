//
//  ContentView.swift
//  AnotadorTruco
//
//  Created by Sebastian Yanni on 22/07/2024.
//

import SwiftUI

struct AnotadorView: View {
    
    @Binding var ourPoints: Int
    @Binding var theirPoints: Int
    

    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Button(action: {
                    ourPoints = 0
                    theirPoints = 0
                }) {
                    Text("Reset")
                        .font(.subheadline)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.leading, 280.0)
                HStack {
                    Spacer()
                    VStack {
                        Text("Nosotros")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    .padding(.leading, -20.0)
                    
                    Spacer()
                    
                    
                    
                    Spacer()
                    
                    VStack {
                        Text("Ellos")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 5)
                    
                    Spacer()
                }
                .padding(.top, 20)
                
                Divider()
                    .background(.white)
                HStack(alignment: .top) {
                    
                    GeometryReader { geometry in
                        VStack {
                            MatchstickGridView(points: ourPoints)
                                .padding(.trailing)
                        }
                        .frame(width: geometry.size.width / 1)
                    }
                    
                    Divider()
                        .background(Color.white)
                    
                    GeometryReader { geometry in
                        VStack {
                            MatchstickGridView(points: theirPoints)
                                .padding(.leading)
                        }
                        .frame(width: geometry.size.width / 1)
                    }
                }
                .padding()
                
                Spacer()
                
                HStack {
                    HStack {
                        Button(action: { if ourPoints > 0 { ourPoints -= 1 } }) {
                            Image(systemName: "minus")
                                .font(.title)
                                .padding()
                                .background(Color.blue)
                                .clipShape(Circle())
                                .foregroundColor(.white)
                        }
                        Button(action: { if ourPoints < 30 { ourPoints += 1 } }) {
                            Image(systemName: "plus")
                                .font(.title)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .foregroundColor(.black)
                        }
                    }
                    Spacer()
                    HStack {
                        Button(action: { if theirPoints > 0 { theirPoints -= 1 } }) {
                            Image(systemName: "minus")
                                .font(.title)
                                .padding()
                                .background(Color.blue)
                                .clipShape(Circle())
                                .foregroundColor(.white)
                        }
                        Button(action: { if theirPoints < 30 { theirPoints += 1 } }) {
                            Image(systemName: "plus")
                                .font(.title)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    AnotadorView(ourPoints: .constant(0), theirPoints: .constant(0))
}
