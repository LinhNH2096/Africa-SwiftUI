//
//  ContentView.swift
//  Africa
//
//  Created by Nguyễn Hồng Lĩnh on 08/12/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    let animals: [Animal] = Bundle.main.decode(file: "animals.json")
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals) { animal in
                    AnimalListItemView(animal: animal)
                    
                }
            } //: List
            .listStyle(PlainListStyle())
            .navigationBarTitle("Africa", displayMode: .large)
        } //: Navigation
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
