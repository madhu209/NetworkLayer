//
//  HTTPHeaders.swift
//  UmaCooks
//
//  Created by Madhusudhan.Putta on 17/04/23.
//

import Foundation

protocol HTTPHeaders {
    var defaultHeaders: [String: String] { get }
    var headers: [String: String] { get set }
    func setHeader(value: String, key: String)
}

public class Header: HTTPHeaders {

    public init() {}

    public var defaultHeaders: [String : String] = [HeaderFieldKeys.contentType: HeaderFieldValues.contentType]

    public var headers: [String: String] = [:] {
        willSet(newHeaders) {
            debugPrint("custom headers is: \(newHeaders)")
        } didSet {
            headers = headers.merging(defaultHeaders) { (current, _) in current }
            debugPrint("headers is: \(headers)")
        }
    }

    public func setHeader(value: String, key: String) {
        self.headers[key] = value
    }

}
