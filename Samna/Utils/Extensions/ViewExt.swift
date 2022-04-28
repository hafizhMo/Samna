//
//  ViewExt.swift
//  Samna
//
//  Created by Hafizh Mo on 28/04/22.
//

import SwiftUI

struct PreviewComponentModifier: ViewModifier {
    
    let displayName: String
    
    func body(content: Content) -> some View {
        content
            .previewDisplayName(displayName)
            .previewLayout(.sizeThatFits)
    }
}

extension View {
    
    func preview(displayName: String = "") -> some View {
        self.modifier(PreviewComponentModifier(displayName: displayName))
    }
}
