//
//  URL+Endpoint.swift
//  UmaCooks
//
//  Created by Madhusudhan.Putta on 14/04/23.
//

import Foundation

extension URL {
    public static func with(baseUrl: String, endPoint: String) -> URL {
        guard let url = URL(string: baseUrl + endPoint) else {
            fatalError("Invalid Url")
        }
        return url
    }
}
