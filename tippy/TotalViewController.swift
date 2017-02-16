//
//  ViewController.swift
//  tippy
//
//  Created by Olga Birulia on 2/8/17.
//  Copyright © 2017 Olga Birulia. All rights reserved.
//

import UIKit
import FontAwesome_swift
class TotalViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nextButton.titleLabel?.font = UIFont.fontAwesome(ofSize: 30)
        nextButton.setTitle(String.fontAwesomeIcon(name: .arrowDown), for: .normal)
        billField.becomeFirstResponder()
        self.nextButton.alpha = 0
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "tipScreen"){
            let svc = segue.destination as! ViewController;
            svc.passedBill = billField.text
        }
    }
    
    @IBAction func onBillChanged(_ sender: Any) {
        if(self.billField.text != ""){
            UIView.animate(withDuration: 0.4, animations: {
                // This causes first view to fade in and second view to fade out
                self.nextButton.alpha = 1
            })
        }
        else{
            UIView.animate(withDuration: 0.4, animations: {
                // This causes first view to fade in and second view to fade out
                self.nextButton.alpha = 0
            })
        }
    }
    
         
}
