//
//  File.swift
//  
//
//  Created by czi on 2023/11/10.
//

import Foundation
import LSSwiftMacros

@propertyWrapper
public struct Localized {
    public var wrappedValue: String
    
    public init(wrappedValue: String) {
        self.wrappedValue = #Localized(wrappedValue)
    }
}
