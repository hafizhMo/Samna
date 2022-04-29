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
        guard let url = URL(string: "https://stackoverflow.com/questions/54285248/get-title-when-input-url-on-uitextfield-on-swift-4") else { return "" }

        var temp = ""
        DispatchQueue.global().async {
            if let content = try? String(contentsOf: url, encoding: .utf8) {
                DispatchQueue.main.async {
                    if let range = content.range(of: "<title>.*?</title>", options: .regularExpression, range: nil, locale: nil) {
                        let title = content[range].replacingOccurrences(of: "</?title>", with: "", options: .regularExpression, range: nil)
//                        print(title) // prints "ios - Get Title when input URL on UITextField on swift 4 - Stack Overflow"
                        temp = title
                    }
                }
            }
        }
//        return "??"
        return temp
    }
}
