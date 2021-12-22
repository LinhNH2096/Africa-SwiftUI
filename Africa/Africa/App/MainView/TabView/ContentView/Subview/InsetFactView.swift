//
//  InsetFactView.swift
//  Africa
//
//  Created by Nguyễn Hồng Lĩnh on 20/12/2021.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: - Properties
    let animal: Animal
    
    
    // MARK: - Body
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
                
            } //: TabView
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } //: Box
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static var animals: [Animal] = Bundle.main.decode(file: "animals.json")
    
    static var previews: some View {
        InsetFactView(animal: animals[1]).previewLayout(.sizeThatFits)
            .padding()
    }
}
