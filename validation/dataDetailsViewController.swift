//
//  dataDetailsViewController.swift
//  validation
//
//  Created by Mohan K on 14/12/22.
//

import UIKit

class dataDetailsViewController: UIViewController {

    @IBOutlet weak var firstNameLbl: UILabel!
    
    @IBOutlet weak var lastNameLbl: UILabel!
    
    @IBOutlet weak var userNameLbl: UILabel!
    
    @IBOutlet weak var mailIdLbl: UILabel!
    
    @IBOutlet weak var passWordLbl: UILabel!
    
    @IBOutlet weak var phoneNumberLbl: UILabel!
    
    private let button: UIButton = {
        var button = UIButton(frame: CGRect(x: 100, y: 350, width: 200, height: 50))
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPink
        button.setTitle("confirm", for: .normal)
        return button
    }()
    
    var firstname = ""
    var lastname = ""
    var username = ""
    var mailid = ""
    var password = ""
    var phonenumber = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.layer.cornerRadius = 8
        firstNameLbl.text = "FirstName: \(firstname)"
        lastNameLbl.text = "LastName: \(lastname)"
        userNameLbl.text = "UserName: \(username)"
        mailIdLbl.text = "MailId: \(mailid)"
        passWordLbl.text = "PassWord: \(password)"
        phoneNumberLbl.text = "PhoneNumber: \(phonenumber)"
        
    }
    
    @objc private func didTapButton() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "oneViewController") as! oneViewController
        vc.modalTransitionStyle = .flipHorizontal
//        vc.modalPresentationStyle = .popover
//        vc.popoverPresentationController?.sourceView = button
        present(vc, animated: true)
    }

}
