//
//  HTTPBody.swift
//  UmaCooks
//
//  Created by Madhusudhan.Putta on 17/04/23.
//

import Foundation

public protocol HTTPBody {

    /// checking whether body is empty or not
    var isEmpty: Bool { get }

    /// planning to add any additional headers for each and every web api integration
//    var additionalHeaders: [String: String] { get }
    func encode() throws -> Data
}

public struct JSONBody: HTTPBody {
    public var isEmpty: Bool = false
    
//    public var additionalHeaders: [String : String] = [
//        HeaderFieldNames.contentType: "application/json; charset=utf-8"
//    ]

    private let encoding: () throws -> Data

    public init<T: Encodable>(_ value: T, encoder: JSONEncoder = JSONEncoder()) {
        self.encoding = { try encoder.encode(value) }
    }

    public func encode() throws -> Data {
        return try encoding()
    }
}

