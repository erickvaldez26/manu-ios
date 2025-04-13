//
//  ManuRequestError.swift
//  Manu
//
//  Created by Erick Valdez on 4/04/25.
//

import Foundation

struct MANURequestError: Error {
    let code: String
    let description: String
    
    init(from error: Error) {
        if let nsError = error as? NSError {
            self.code = "Code-\(nsError.code)"
            self.description = nsError.localizedDescription
        } else {
            self.code = "UNKNOWN_ERROR"
                        self.description = error.localizedDescription
        }
    }
}
