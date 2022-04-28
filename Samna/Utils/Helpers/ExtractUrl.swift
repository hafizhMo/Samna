//
//  ExtractUrl.swift
//  Samna
//
//  Created by Hafizh Mo on 28/04/22.
//

import Foundation

class ExtractUrl {
    private var baseUrl: String
    
    init(baseUrl: String){
        self.baseUrl = baseUrl
    }
    
    func getFaviconUrl() -> String {
        return "https://www.google.com/s2/favicons?sz=64&domain=\(baseUrl)"
    }

    func getTitleUrl() -> String {
        return "??"
    }
}
