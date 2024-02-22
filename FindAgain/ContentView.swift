//
//  ContentView.swift
//  FindAgain
//
//  Created by Chidera on 2/21/24.
//

import SwiftUI

struct ContentView: View {
    private var search = listOfItems
    @State var searchText = ""
    
    var body: some View {
        VStack {
            HStack {
                Image("icons8-filter-50")
                Text("Found")
                Image("icons8-location-50")
            }.frame(maxWidth: .infinity).background(Color.indigo)
            Spacer()
        }
        VStack {

            NavigationView {
                List {
                    
                }
                .searchable(text: $searchText)
                .background(Color.indigo)
            }
        }
        
        
    }
    var things: [String] {
        let lcItems = search.map {$0.lowercased() }
        return  searchText == "" ? lcItems : lcItems.filter {
            $0.contains(searchText.lowercased())
        }
    }
}

#Preview {
    ContentView()
}
