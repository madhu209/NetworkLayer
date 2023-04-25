//
//  URLRequest.swift
//  UmaCooks
//
//  Created by Madhusudhan.Putta on 14/04/23.
//

import Foundation

extension URLRequest {
    /// Holding type of HTTP methods
    public enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
        case head = "HEAD"
        case options = "OPTIONS"
        case trace = "TRACE"
        case connect = "CONNECT"
        case patch = "PATCH"
    }
}
