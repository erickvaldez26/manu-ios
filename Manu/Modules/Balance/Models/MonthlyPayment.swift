//
//  MonthlyPayment.swift
//  Manu
//
//  Created by Erick Valdez on 18/06/23.
//

import Foundation

struct MonthlyPayment: Hashable {
    var id: Int
    var service: String
    var imageRef: String
    var typeTag: String
    var amount: Double
    var expiration: String
}
