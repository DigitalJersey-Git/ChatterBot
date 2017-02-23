//
//  ViewController.swift
//  ChatterBot
//
//  Created by Chris Mousdale on 23/02/2017.
//  Copyright © 2017 Chris Mousdale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    @IBAction func signInAction(_ sender: UIButton) {
        
        if usernameTextField.text != "" {
            performSegue(withIdentifier: "signInSegue", sender: nil)
            defaults.set(usernameTextField.text, forKey: "username")
        } else {
          
            let alertController = UIAlertController(title: "Error", message: "Please enter a username before proceeding", preferredStyle: UIAlertControllerStyle.alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel) {
                (result : UIAlertAction) -> Void in
            }
            
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    


}

