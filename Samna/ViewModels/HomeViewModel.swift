//
//  HomeViewModel.swift
//  Samna
//
//  Created by Hafizh Mo on 28/04/22.
//

import Foundation
import SwiftUI

protocol HomeViewModel: ObservableObject {
    func getLinks() -> [ItemModel]
    func add(newItem: ItemModel)
    func delete(selectedLink: ItemModel)
}

@MainActor
final class HomeViewModelImpl: HomeViewModel {
    @Published private var items = [ItemModel]()
    
    func getLinks() -> [ItemModel] {
        return items
    }
    
    func delete(selectedLink: ItemModel) {
        let index = items.firstIndex(where: { $0.chapter == selectedLink.chapter })!
        withAnimation {
            items.remove(at: index)
        }
    }
    
    func add(newItem: ItemModel) {
        withAnimation {
            items.insert(newItem, at: 0)
        }
    }
}
