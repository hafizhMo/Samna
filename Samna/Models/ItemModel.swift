//
//  ItemModel.swift
//  Samna
//
//  Created by Hafizh Mo on 28/04/22.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    var id = UUID()
    var link: String
    var chapter: Int?
    var category: String
}

extension ItemModel {
    static let data = ItemModel(link: "https://google.com", chapter: 13, category: "Article")
}
