//
//  HomeViewModel.swift
//  Samna
//
//  Created by Hafizh Mo on 28/04/22.
//

import Foundation
import CoreData
import SwiftUI

protocol HomeViewModel: ObservableObject {
    func delete(item: FetchedResults<LinkData>.Element, context: NSManagedObjectContext)
    func update(item: FetchedResults<LinkData>.Element, context: NSManagedObjectContext)
    
}

@MainActor
final class HomeViewModelImpl: HomeViewModel {
    
    func update(item: FetchedResults<LinkData>.Element, context: NSManagedObjectContext) {
        withAnimation {
            item.chapter = item.chapter+1
        
            LinkController().save(context: context)
        }
    }
    
    func delete(item: FetchedResults<LinkData>.Element, context: NSManagedObjectContext) {
        withAnimation {
            context.delete(item)
            
            LinkController().save(context: context)
        }
    }
    
}
