//
//  ViewController.swift
//  tippy
//
//  Created by Olga Birulia on 2/8/17.
//  Copyright © 2017 Olga Birulia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var grandTotal: UILabel!
    @IBOutlet weak var peopleNumberField: UITextField!
    
    var passedBill:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        backButton.titleLabel?.font = UIFont.fontAwesome(ofSize: 30)
        backButton.setTitle(String.fontAwesomeIcon(name: .close), for: .normal)
        billLabel.text = passedBill
        peopleNumberField.becomeFirstResponder()
        calculate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func calculateTip(_ sender: Any) {
        calculate()
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    func calculate(){
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(billLabel.text!) ?? 0
        let people = Double(peopleNumberField.text!) ?? 1
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = (bill + tip)/people
        
        tipLabel.text = String(format: "$%.2f", tip)
        grandTotal.text = String(format: "$%.2f", total)
    }
    
}

