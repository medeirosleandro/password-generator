//
//  PasswordGenerator.swift
//  SuperPassWord
//
//  Created by Leandro Roberto Medeiros on 22/04/19.
//  Copyright © 2019 Leandro Roberto Medeiros. All rights reserved.
//

import Foundation

class PasswordGenerator {
    var numberOfCharacters: Int
    var useNumbers: Bool
    var useLetters: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacters: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let numbers = "0123456789"
    private let specialCharacters = "!#$%&'()*+,-./:;<=>?@[]^_`{|}~"
    
    init(numberOfCharacters: Int, useNumbers: Bool, useLetters: Bool,useCapitalLetters: Bool,useSpecialCharacters: Bool) {
        
        var numchars = min(numberOfCharacters, 16)
        numchars = max(numchars, 1)
        
        
        self.numberOfCharacters = numchars
        self.useNumbers = useNumbers
        self.useLetters = useLetters
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacters = useSpecialCharacters
    }
    
    func generate(total: Int) ->[String]{
        
        passwords.removeAll()
        var universe: String = ""
        
        if useLetters {
            universe += letters
        }
        
        if useNumbers {
            universe += numbers
        }
        
        if useSpecialCharacters {
            universe += specialCharacters
        }
        
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        
        let universeArray = Array(universe)
        while passwords.count < total {
            var password = ""
            for _ in 1 ... numberOfCharacters {
                let index = Int(arc4random_uniform(UInt32(universe.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        return passwords
    }
}
