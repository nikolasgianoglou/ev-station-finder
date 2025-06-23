//
//  ContentView.swift
//  EV Station Finder
//
//  Created by Nikolas Gianoglou on 22/06/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var text: String = ""
    
    var body: some View {
        ZStack {
            Color("white")
            
            VStack(spacing: 30) {
                Text("EV Station Finder")
                
                TextField("Type something here", text: $text)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Button {
                    // action
                } label: {
                    Text("Search".uppercased())
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 10)
                        .background(
                            Color("red")
                                .cornerRadius(10)
                                .shadow(radius: 10)
                        )
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
