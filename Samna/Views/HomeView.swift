//
//  HomeView.swift
//  Samna
//
//  Created by Hafizh Mo on 28/04/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel : HomeViewModelImpl
    @State private var isPresented = false
    
//    @Environment(\.openURL) var openURL
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var data: FetchedResults<LinkData>
    
    init() {
        self._viewModel = StateObject(wrappedValue: HomeViewModelImpl())
    }
    
    var body: some View {
        
        var detail = ""
        
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
                                    viewModel.delete(item: item, context: managedObjectContext)
                                }
                                Button("Edit") {
                                    print("edit")
                                    detail = "edit"
                                    isPresented = true
                                }
                                .tint(.blue)
                            }
                            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                Button("Next Chapter"){
                                    viewModel.update(item: item, context: managedObjectContext)
//                                    openURL(tempUrl)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Home")
            .navigationBarItems(trailing: Button(action: {
                isPresented = true
                detail = "add"
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $isPresented,
                   content: {
                if detail == "add" {
                    AddLinkView(isPresented: $isPresented)
                } else if detail == "edit" {
                    EditLinkView(isPresented: $isPresented)
                }
            })
        }
    }
}
