//
//  EditViewModel.swift
//  Samna
//
//  Created by Hafizh Mo on 28/04/22.
//

import Foundation
import CoreData

protocol EditViewModel: ObservableObject {
    func edit(current: LinkData, newUrl: String, newChapter: Int?, context: NSManagedObjectContext)
}

@MainActor
final class EditViewModelImpl: EditViewModel {
    func edit(current: LinkData, newUrl: String, newChapter: Int?, context: NSManagedObjectContext) {
        current.url = newUrl
        current.favicon = ExtractUrl(baseUrl: newUrl).getFaviconUrl()
        current.chapter = Int64(newChapter!)
        
        LinkController().save(context: context)
    }
    
    
}
