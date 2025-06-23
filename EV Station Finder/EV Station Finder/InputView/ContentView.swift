//
//  ContentView.swift
//  EV Station Finder
//
//  Created by Nikolas Gianoglou on 22/06/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = InputViewModel()
    @State var text: String = ""
//    @State var isValid: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("white")
                
                VStack(spacing: 30) {
                    Text("EV Station Finder")
                    
                    TextField("Type something here", text: $text)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .keyboardType(.numberPad)
                    
                    Button(action: {
                        viewModel.validateZipCode(text)
                    }) {
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
                    
                    NavigationLink(
                        destination: Text("Teste"),
                        isActive: $viewModel.isValidZip
                    ) {
                        EmptyView()
                    }
                }
                .alert(isPresented: $viewModel.showError) {
                    getAlert()
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    func getAlert() -> Alert {
        Alert(
            title: Text("Invalid ZIP Code"),
            message: Text("Please enter a valid 5-digit ZIP code."),
            dismissButton: .default(Text("OK"))
        )
    }
}
