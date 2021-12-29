//
//  ContentView.swift
//  Africa
//
//  Created by Nguyễn Hồng Lĩnh on 08/12/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    private let animals: [Animal] = Bundle.main.decode(file: "animals.json")
    private let haptic = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridLayoutActive: Bool = false
    @State private var gridColumn: Int = 1
    @State private var gridBarIcon: String = "square.grid.2x2"
    @State private var gridLayout: [GridItem] = Array(repeating: GridItem(), count: 1)
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    private func switchGrid() {
        gridLayout = Array(repeating: GridItem(), count: (gridColumn % 3) + 1)
        gridColumn = gridLayout.count
        switch gridColumn {
        case 1: gridBarIcon = "square.grid.2x2"
        case 2: gridBarIcon = "square.grid.3x2"
        case 3: gridBarIcon = "rectangle.grid.1x2"
        default: gridBarIcon = "square.grid.2x2"
        }
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            Group {
                
                if !isGridLayoutActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                        }
                        
                        CreditsView()
                            .modifier(CenterModifier())
                    } //: List
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { item in
                                NavigationLink(destination: AnimalDetailView(animal: item)) {
                                    AnimalGridItemView(animal: item)
                                } //: Navigation link
                            } //: Loop
                        } //: Grid Layout
                        .padding()
                        .animation(.easeIn)
                    } //: Scroll view
                } //: Condition
            } //: Group
            .listStyle(PlainListStyle())
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        // List Button
                        Button {
                            isGridLayoutActive = false
                            haptic.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridLayoutActive ? .primary : .accentColor)
                        }

                        // Grid Button
                        Button {
                            isGridLayoutActive = true
                            haptic.impactOccurred()
                            switchGrid()
                        } label: {
                            Image(systemName: gridBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridLayoutActive ? .accentColor : .primary)
                        }
                    }
                }
            }
        } //: Navigation
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
