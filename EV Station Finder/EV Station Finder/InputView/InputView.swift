//
//  ContentView.swift
//  EV Station Finder
//
//  Created by Nikolas Gianoglou on 22/06/25.
//

import SwiftUI

struct InputView: View {
    
    @StateObject var viewModel = InputViewModel()
    @State var text: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                Color("white")
                
                VStack(spacing: 30) {
                    Text("EV Station Finder")
                    
                    textField
                    
                    searchButton
                    
                    NavigationLink(
                        destination: ListStationView(viewModel: ListStationViewModel(zipCode: text)),
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
    InputView()
}

extension InputView {
    // MARK: - Components
    var textField: some View {
        TextField("Type Zip Code here", text: $text)
            .padding()
            .padding(.horizontal)
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .keyboardType(.numberPad)
    }
    
    var searchButton: some View {
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
    }
    
    //MARK: - Functions
    func getAlert() -> Alert {
        Alert(
            title: Text("Invalid ZIP Code"),
            message: Text("Please enter a valid 5-digit ZIP code."),
            dismissButton: .default(Text("OK"))
        )
    }
}
