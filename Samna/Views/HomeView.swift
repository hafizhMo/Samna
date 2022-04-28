//
//  HomeView.swift
//  Samna
//
//  Created by Hafizh Mo on 28/04/22.
//

import SwiftUI

struct HomeView: View {
//    @StateObject private var viewModel: HomeViewModelImpl
    @State private var isPresented = false
    @State private var content = "add"
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var data: FetchedResults<LinkData>
    
//    var tempData: FetchedResults<LinkData>.Element
    
//    init() {
//        self._viewModel = StateObject(wrappedValue: HomeViewModelImpl())
//    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                if data.count == 0 {
                    EmptyView()
                } else {
                    List(data) { item in
                        
                            if let tempUrl = URL(string: item.url ?? "") {
                        Link(destination: tempUrl) {
                                    ItemView(item: item)
                                }
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                print("delete: \(item)")
//                                delete()
                                managedObjectContext.delete(item)
                                LinkController().save(context: managedObjectContext)
                            }
                            Button("Edit") {
                                isPresented = true
                                content = "edit"
                                print("edit: \(item)")
                            }
                            .tint(.blue)
                        }
                            }
                        
                        
//                        .onDelete(perform: delete)
                    }
                }
            }
            .navigationTitle("Home")
            .navigationBarItems(trailing: Button(action: {
                content = "add"
                isPresented = true
                
//                viewModel2.add(url: "https://google.com", chapter: 0, context: managedObjectContext)
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $isPresented,
                   content: {
                if content == "add" {
                    AddLinkView(isPresented: $isPresented)
                } else if content == "edit" {
//                    EditLinkView(isPresented: $isPresented, data: tempData)
                }
            })
        }
    }
    
    private func delete(offsets: IndexSet) {
        withAnimation {
            print(offsets)
            offsets.map { data[$0] }.forEach(managedObjectContext.delete)
            
            LinkController().save(context: managedObjectContext)
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView().preview(displayName: "Home View")
//    }
//}
