//
//  PasswordViewController.swift
//  SuperPassWord
//
//  Created by Leandro Roberto Medeiros on 22/04/19.
//  Copyright © 2019 Leandro Roberto Medeiros. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {

    @IBOutlet weak var tfPasswords: UITextView!
    
    var numberOfPasswords: Int = 1
    var numberOfCharacters:Int = 10
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Total de senhas: \(numberOfPasswords)"
        passwordGenerator = PasswordGenerator(numberOfCharacters: numberOfCharacters, useNumbers: useNumbers, useLetters: useLetters, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCharacters)

        generatePasswords()
    }
    
    func generatePasswords() {
        tfPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        tfPasswords.text = ""
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords{
            tfPasswords.text.append(password + "\n\n")
        }
        
    }
    

    @IBAction func generate(_ sender: UIButton) {
        generatePasswords()
    }
    
}
