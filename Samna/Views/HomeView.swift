//
//  HomeView.swift
//  Samna
//
//  Created by Hafizh Mo on 28/04/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModelImpl
    @State private var isPresented = false
    @State private var content = ""
    @State private var selectedItem: ItemModel = ItemModel(link: "", category: "")
    
    init() {
        self._viewModel = StateObject(wrappedValue: HomeViewModelImpl())
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                if viewModel.getLinks().count == 0 {
                    EmptyView()
                } else {
                    List(viewModel.getLinks()) { item in
                        Link(destination: URL(string: item.link)!) {
                            ItemView(item: item)
                        }
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                viewModel.delete(selectedLink: item)
                            }
                            Button("Edit") {
                                isPresented = true
                                content = "edit"
                                selectedItem = item
                                
                            }
                            .tint(.blue)
                        }
                    }
                }
            }
            .navigationTitle("Home")
            .navigationBarItems(trailing: Button(action: {
                isPresented = true
                content = "add"
                viewModel.add(newItem: ItemModel(link: "https://youtube.com", chapter: (viewModel.getLinks().count + 1), category: "Article"))
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $isPresented,
                   content: {
                if content == "add" {
                    AddLinkView(isPresented: $isPresented)
                } else if content == "edit" {
                    EditLinkView(isPresented: $isPresented, item: selectedItem)
                }
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().preview(displayName: "Home View")
    }
}
