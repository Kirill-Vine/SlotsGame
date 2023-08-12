//
//  ContentView.swift
//  SlotsGame
//
//  Created by kv on 8/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var score = 0
    @State private var count = 0
    private let images = ["apple", "cherry", "star"]
    @State private var leftImage = "apple"
    @State private var centerImage = "cherry"
    @State private var rightImage = "star"
    var body: some View {
        ZStack{
            Image(systemName: "squareshape.fill")
                .renderingMode(.template)
                .resizable(resizingMode: .stretch)
                .foregroundColor(Color.orange)
                .ignoresSafeArea()
            VStack(spacing: -10.0) {
                Spacer()
                Text("Slots Machine")
                    .fontWeight(.medium)
                    .foregroundColor(Color.red)
                    .multilineTextAlignment(.center) .font(.system(size: 50)).padding(.top, -150)
                Spacer()
                HStack{
                    Spacer()
                    Text("Credits: ")
                        .fontWeight(.semibold)
                        .font(.system(size: 30)).foregroundColor(.indigo)
                    Text(String(score))
                        .fontWeight(.semibold)
                        .font(.system(size: 30)).foregroundColor(.indigo)
                    Spacer()
                    
                }.padding(.top, -150)
                HStack{
                    Image(leftImage).resizable().aspectRatio(contentMode: .fit)
                    Spacer()
                    Image(centerImage).resizable().aspectRatio(contentMode: .fit)
                    Spacer()
                    Image(rightImage).resizable().aspectRatio(contentMode: .fit)
                }
                Spacer()
                Button {
                    leftImage = images.randomElement()!
                    centerImage = images.randomElement()!
                    rightImage = images.randomElement()!
                    if leftImage == centerImage && centerImage == rightImage{
                        score+=3
                    }else if leftImage == centerImage || leftImage == rightImage || centerImage == rightImage{
                        score+=1
                    }else{
                        score-=4
                    }
                    count+=1
                } label: {
                    Text("Click to spin!")
                        .foregroundColor(Color.red).font(.system(size: 35)).padding().background( LinearGradient(
                            colors: [.green, .blue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )).cornerRadius(40)
                }
                Spacer()
                Text("Spin #"+String(count))
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
