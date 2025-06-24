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
                
                title
                
                textField
                
                searchButton
                
                if let lastZip = viewModel.lastZip {
                    lastZipButton(zipCode: lastZip)
                }
                
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

#Preview {
    InputView()
}

extension InputView {
    // MARK: - Components
    var title: some View {
        HStack(spacing: 12) {
            Image(systemName: "bolt.car")
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 36)
                .foregroundColor(Color("red"))
            
            Text("EV Station Finder")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundColor(.primary)
        }
        .padding(.bottom, 16)
    }
    
    var textField: some View {
        TextField("Type ZIP Code here", text: $text)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .keyboardType(.numberPad)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
    }
    
    var searchButton: some View {
        Button(action: {
            viewModel.validateZipCode(text)
        }) {
            buttonText(label: "Search")
        }
    }
    
    func lastZipButton(zipCode: String) -> some View {
        Button(action: {
            text = zipCode
            viewModel.validateZipCode(text)
        }) {
            buttonText(label: "Use Last ZipCode")
        }
    }
    
    func buttonText(label: String) -> some View {
        Text(label.uppercased())
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
    
    //MARK: - Functions
    func getAlert() -> Alert {
        Alert(
            title: Text("Invalid ZIP Code"),
            message: Text("Please enter a valid 5-digit ZIP code."),
            dismissButton: .default(Text("OK"))
        )
    }
}
