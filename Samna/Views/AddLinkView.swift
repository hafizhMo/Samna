//
//  AddLinkView.swift
//  Samna
//
//  Created by Hafizh Mo on 28/04/22.
//

import SwiftUI

struct AddLinkView: View {
    @Binding var isPresented: Bool
    @State var newLink = ItemModel(link: "", chapter: nil, category: "")
    
    var body: some View {
        NavigationView {
            
            Form {
                
                Section(header: Text("Info")) {
                    
                    TextField("Link",
                              text: $newLink.link)
                    
                    TextField("Category",
                              text: $newLink.category)
                    
                    TextField("Chapter",
                              value: $newLink.chapter, formatter: NumberFormatter())
                }
            }
            .navigationTitle("Add New Link")
            .navigationBarItems(
                leading: Button(action: {
                    isPresented = false
                }, label: {
                    Text("Cancel")
                }),
                trailing: Button(action: {
                    isPresented = false
                }, label: {
                    Text("Add")
                })
            )
        }
    }
}

struct AddLinkView_Previews: PreviewProvider {
    static var previews: some View {
        AddLinkView(isPresented: .constant(false))
            .preview(displayName: "Add Link View")
    }
}
