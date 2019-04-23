//
//  ViewController.swift
//  SuperPassWord
//
//  Created by Leandro Roberto Medeiros on 22/04/19.
//  Copyright © 2019 Leandro Roberto Medeiros. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfCharacters: UITextField!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swCapitalNumbers: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordViewController
        
        
        if let numberOfPasswords = Int(tfTotalPasswords.text!){
            passwordsViewController.numberOfPasswords = numberOfPasswords
        }
        
        if let numberOfCharacters = Int(tfNumberOfCharacters.text!){
            passwordsViewController.numberOfCharacters = numberOfCharacters
        }
        
        passwordsViewController.useLetters = swLetters.isOn
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useCapitalLetters = swCapitalNumbers.isOn
        passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn
        view.endEditing(true)
    
    }


}

