//
//  AddLinkView.swift
//  Samna
//
//  Created by Hafizh Mo on 28/04/22.
//

import SwiftUI

struct AddLinkView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @StateObject private var viewModel = AddViewModelImpl()
    @Binding var isPresented: Bool
    
    @State private var url = ""
    @State private var chapter = 0
    
//    init() {
//        self._viewModel = StateObject(wrappedValue: AddViewModelImpl())
//    }
    
    var body: some View {
        NavigationView {
            
            Form {
                
                Section(header: Text("Info")) {
                    
                    TextField("Link",
                              text: $url)
                    
//                    TextField("Category",
//                              text: $newLink.category)
                    
                    TextField("Chapter (Optional)",
                              value: $chapter, formatter: NumberFormatter())
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
                    viewModel.add(url: url, chapter: Int64(chapter), context: managedObjectContext)
                }, label: {
                    Text("Add")
                })
            )
        }
    }
}

//struct AddLinkView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddLinkView(isPresented: .constant(false))
//            .preview(displayName: "Add Link View")
//    }
//}
