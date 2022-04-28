//
//  EditLinkView.swift
//  Samna
//
//  Created by Hafizh Mo on 28/04/22.
//

import SwiftUI

struct EditLinkView: View {
    @Binding var isPresented: Bool
    var item: ItemModel
    
    @State private var newItem = ItemModel(link: "", category: "")
    
    var body: some View {
        NavigationView {
            
            Form {
                
                Section(header: Text("Info")) {
                    
                    TextField("\(item.link)",
                              text: $newItem.link)
                    
                    TextField("\(item.category)",
                              text: $newItem.category)
                    
                    TextField("\(item.chapter!)",
                              value: $newItem.chapter, formatter: NumberFormatter())
                }
            }
            .navigationTitle("Edit Link")
            .navigationBarItems(
                leading: Button(action: {
                    isPresented = false
                }, label: {
                    Text("Cancel")
                }),
                trailing: Button(action: {
                    isPresented = false
                }, label: {
                    Text("Save")
                })
            )
        }
    }
}

struct EditLinkView_Previews: PreviewProvider {
    static var previews: some View {
        EditLinkView(isPresented: .constant(false), item: ItemModel.data)
            .preview(displayName: "Edit Link View")
    }
}
