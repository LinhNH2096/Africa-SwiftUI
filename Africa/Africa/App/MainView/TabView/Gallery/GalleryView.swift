//
//  GalleryView.swift
//  Africa
//
//  Created by Nguyễn Hồng Lĩnh on 09/12/2021.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - Properties
    
    private var animals: [Animal] = Bundle.main.decode(file: "animals.json")
    
    @State private var gridColumn: Double = 3.0
    
    @State private var gridLayout: [GridItem] = Array(repeating: GridItem(),
                                                      count: 1)
   
    @State private var animalSelected: String = "lion"
    
    func switchGrid() {
        gridLayout = Array(repeating: GridItem(),
                           count: Int(gridColumn))
    }
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 30) {
                // MARK: - Image
                Image(animalSelected)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                // MARK: - Slider
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .onChange(of: gridColumn) { value in
                        switchGrid()
                    }
                
                // MARK: - Grid
                LazyVGrid(columns: gridLayout) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                animalSelected = item.image
                            }
                    }
                } //: Grid
                .animation(.easeIn)
                .onAppear {
                    switchGrid()
                }
            } //: VStack
            .padding(.vertical, 50)
            .padding(.horizontal, 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
