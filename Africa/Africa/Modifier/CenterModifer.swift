//
//  CenterModifer.swift
//  Africa
//
//  Created by Nguyễn Hồng Lĩnh on 29/12/2021.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
