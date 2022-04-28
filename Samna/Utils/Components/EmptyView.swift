//
//  EmptyView.swift
//  Samna
//
//  Created by Hafizh Mo on 28/04/22.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack {
            
            Text("No Links")
                .font(.system(size: 16,
                              weight: .bold))
            Text("It seems that there are no links, why don't you add some above")
                .multilineTextAlignment(.center)
                .font(.system(size: 13,
                              weight: .regular))
                .padding(.horizontal, 16)
                .padding(.top, 4)
            
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
            .preview(displayName: "Empty View")
    }
}
