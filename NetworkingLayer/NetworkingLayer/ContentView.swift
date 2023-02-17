//
//  ContentView.swift
//  NetworkingLayer
//
//  Created by Мельник Всеволод on 03.02.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button("pressMe") {
                QuotesWorker().fetchQuotes { response in
                    print(response.quotes)
                }
            }
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
