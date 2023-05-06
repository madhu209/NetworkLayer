//
//  Dictionary+URLQuery.swift
//  NetworkLayer
//
//  Created by Madhusudhan.Putta on 01/05/23.
//

import Foundation

extension Dictionary {
    public func queryItems() -> [URLQueryItem] {
        // Removes Null values
        let dict  = self.compactMapValues {$0}
        let keys = dict.keys
        var queryItems = [URLQueryItem]()
        keys.forEach { (key) in
            if let value = dict[key] {
                let queryItem = URLQueryItem(name: key as? String ?? "", value: "\(value)")
                queryItems.append(queryItem)
            }
        }
        return queryItems
    }
}
