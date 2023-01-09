//
//  ContentView.swift
//  WCTest3 WatchKit Extension
//
//  Created by Samantha Chang on 3/20/21.
//

import SwiftUI
import WatchConnectivity

struct ContentView: View {
    let animals = ["cat", "dog", "dragon"]
    let emojiAnimals = ["🐱", "🐶", "🐲"]
    var viewModel = AnimalListViewModel()
    @State private var isReachable = "NO"
    
    var body: some View {
        List(0 ..< animals.count) { index in
            
            HStack {
                Text(self.emojiAnimals[index])
                    .font(.title)
                    .padding()
                    .onTapGesture {
                        //print(stuff)
                        self.isReachable = self.viewModel.session.isReachable ? "YES": "NO"
                    }
                
                Text(isReachable)
            }
        }
        .listStyle(CarouselListStyle())
        .navigationBarTitle(Text("Animal List"))
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
