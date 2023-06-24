//
//  SmallLoan.swift
//  Manu
//
//  Created by Erick Valdez on 22/06/23.
//

import Foundation

struct SmallLoan: Hashable {
    var id: Int
    var personName: String
    var hasYape: Bool
    var hasPlin: Bool
    var phoneNumber: String
    var interbankAccountNumber: String
    var loans: [Loan]
}
