//
//  GroupDetailViewController.swift
//  ChatterBot
//
//  Created by Chris Mousdale on 27/02/2017.
//  Copyright © 2017 Chris Mousdale. All rights reserved.
//

import UIKit

class GroupDetailViewController: UIViewController {

    @IBOutlet weak var messageUserText: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageUserText!.layer.borderWidth = 1
        messageUserText!.layer.cornerRadius = 20
        messageUserText!.layer.borderColor = UIColor.lightGray.cgColor

        print(testString)
    }
    
    var testString = ""
    
    


}
