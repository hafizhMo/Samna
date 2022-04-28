//
//  ItemView.swift
//  Samna
//
//  Created by Hafizh Mo on 28/04/22.
//

import SwiftUI

struct ItemView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading,
                   spacing: 8) {
                HStack {
                    Image(systemName: "safari")
                        .font(.system(size: 12, weight: .black))
                    Text(item.link)
                }

                Text(makeAttributedString(title: "Next Chapter", label: "\(item.chapter!)"))
            }
            .padding()
            .foregroundColor(.black)
            Spacer()
            AsyncImage(url: ExtractUrl(baseUrl: item.link).getFaviconUrl())
                .frame(width: 48, height: 48)
                .padding()
        }
    }
    
    private func makeAttributedString(title: String, label: String) -> AttributedString {
        
        var string = AttributedString("\(title): \(label)")
        string.foregroundColor = .black
        string.font = .system(size: 16, weight: .bold)
        
        if let range = string.range(of: label) {
            string[range].foregroundColor = .black.opacity(0.8)
            string[range].font = .system(size: 16, weight: .regular)

        }
        return string
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: ItemModel.data)
            .preview(displayName: "Item View")
    }
}
