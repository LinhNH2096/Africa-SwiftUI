//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Nguyễn Hồng Lĩnh on 20/12/2021.
//

import SwiftUI

struct ExternalWebLinkView: View {
    // MARK: - Properties
    let animal: Animal
    
    
    // MARK: - Body
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: URL(string: animal.link)!)
                }
                .foregroundColor(.accentColor)
            } //: HStack
        } //: Box
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    static var animals: [Animal] = Bundle.main.decode(file: "animals.json")
    
    static var previews: some View {
        ExternalWebLinkView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
