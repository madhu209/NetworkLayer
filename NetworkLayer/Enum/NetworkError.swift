//
//  NetworkError.swift
//  UmaCooks
//
//  Created by Madhusudhan.Putta on 15/04/23.
//

import Foundation

enum NetworkError: String, LocalizedError {
    case unrecoverable = "Oops, something went wrong"
    case unreachable = "Service unreachable"
    case unauthorized = "Unauthorized"
    case temporary = "Service unavailable"

    public var errorDescription: String? {
        return NSLocalizedString(self.rawValue, bundle: Bundle.main, comment: "The description for a network error alert")
   }
}
