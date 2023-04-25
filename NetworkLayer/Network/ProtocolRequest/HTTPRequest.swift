//
//  HTTPRequest.swift
//  UmaCooks
//
//  Created by Madhusudhan.Putta on 17/04/23.
//

import Foundation

public protocol HTTPRequest {
    associatedtype BodyType: HTTPBody

    var urlComponents: URLComponents { get }
    var method: URLRequest.HTTPMethod { get }
    var headers: [String: String] { get }
    var body: BodyType { get }
}

public extension HTTPRequest {
    var scheme: String { urlComponents.scheme ?? "https" }
    var host: String { urlComponents.host! }
    var path: String { urlComponents.path }
}

public extension HTTPRequest {
    func adding(headers: [String: String]) -> [String: Any] {
        self.headers.merging(headers) { _, custom in return custom }
    }
}

// MARK: - UnauthHTTPRequest
public struct URLHTTPRequest: HTTPRequest {
    public var urlComponents: URLComponents
    public var method = URLRequest.HTTPMethod.get
    public var headers: [String: String] = [:]

    public var body = JSONBody(Empty())

    public init(urlComponents: URLComponents, method: URLRequest.HTTPMethod = .get, headers: [String: String] = [:]) {
        self.urlComponents = urlComponents
        self.urlComponents.queryItems = nil
        self.method = method
        self.headers = headers
    }
}

public struct Empty: Encodable {
    public init() { }
}
