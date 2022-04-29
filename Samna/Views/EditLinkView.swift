//
//  EditLinkView.swift
//  Samna
//
//  Created by Hafizh Mo on 28/04/22.
//

import SwiftUI

struct EditLinkView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Binding var isPresented: Bool
    
    @State private var newUrl = ""
    @State private var newChapter = 0
    
    var body: some View {
        NavigationView {
            
            Form {
                Section(header: Text("Info")) {
                    TextField("https://google.com", text: $newUrl)
                    TextField("0", value: $newChapter, formatter: NumberFormatter())
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
