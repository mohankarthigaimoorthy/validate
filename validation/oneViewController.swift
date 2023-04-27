//
//  oneViewController.swift
//  validation
//
//  Created by Mohan K on 15/12/22.
//

import UIKit

class oneViewController: UIViewController {

    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 8
       
    }
    

  
    @IBAction func didClickNextBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
