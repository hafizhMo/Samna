//
//  AddViewModel.swift
//  Samna
//
//  Created by Hafizh Mo on 28/04/22.
//

import Foundation
import CoreData

protocol AddViewModel: ObservableObject {
    func add(url: String, chapter: Int64, context: NSManagedObjectContext)
}

@MainActor
final class AddViewModelImpl: AddViewModel {
    
    func add(url: String, chapter: Int64, context: NSManagedObjectContext) {
        let temp = LinkData(context: context)
        temp.id = UUID()
        temp.url = url
        temp.favicon = ExtractUrl(baseUrl: url).getFaviconUrl()
        temp.chapter = chapter
        
        LinkController().save(context: context)
    }
    
}
