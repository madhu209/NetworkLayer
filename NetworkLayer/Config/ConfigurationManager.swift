//
//  ConfigurationManager.swift
//  NetworkLayer
//
//  Created by Madhusudhan.Putta on 02/05/23.
//

import Foundation

public struct ConfigurationManager {
    static public var isDebug: Bool {
        #if DEBUG
            return true
        #endif
    }
}
