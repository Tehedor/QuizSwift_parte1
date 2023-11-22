//
//  Extensions.swift
//  QuizSwift_parte1
//
//  Created by c142 DIT UPM on 22/11/23.
//

import Foundation


infix operator =+-= : ComparisonPrecedence

extension String {
    static func =+-= (s1:String, s2:String) -> Bool {
        var a = s1.lowercased().trimmingCharacters(in:.whitespaces)
        var b = s2.lowercased().trimmingCharacters(in:.whitespaces)
        return a == b
    }
}


/*
extension String: LocalizedError {
    public var errorDescription: String? {
        return self
    }
}*/
