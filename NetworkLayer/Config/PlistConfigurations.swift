//
//  PlistConfigurations.swift
//  UmaCooks
//
//  Created by Madhusudhan.Putta on 17/04/23.
//

import Foundation

public struct PlistConfigurations {
    static let baseUrl: String = value(for: "BASE_URL")
}

extension PlistConfigurations {
    public static func value<T>(for key: String) -> T {
        guard let value = Bundle.main.infoDictionary?[key] as? T else {
            fatalError("Invalid or missing Info.plist key: \(key)")
        }
        return value
    }
}
