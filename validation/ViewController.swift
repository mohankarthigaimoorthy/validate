//
//  ViewController.swift
//  validation
//
//  Created by Mohan K on 13/12/22.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var fNameTxtField: UITextField!
    
    @IBOutlet weak var lNameTxtField: UITextField!
    
    @IBOutlet weak var mIdTxtField: UITextField!
    
    
    @IBOutlet weak var PWrdTxtField: UITextField!
    
    
    @IBOutlet weak var userName: UITextField!
    
    
    @IBOutlet weak var pNumberTxtField: UITextField!
    
    @IBOutlet weak var fNameError: UILabel!
    
    @IBOutlet weak var lNameError: UILabel!
    
    @IBOutlet weak var emailError: UILabel!
    
    @IBOutlet weak var pwdError: UILabel!
    
    @IBOutlet weak var numberError: UILabel!
    
    
    @IBOutlet weak var userNameError: UILabel!
    
    @IBOutlet weak var submitBtn: UIButton!
    
    var activeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetForm()
        submitBtn.layer.cornerRadius = 8
        
        scrollView.delegate = self
        fNameTxtField.delegate = self
        lNameTxtField.delegate = self
        mIdTxtField.delegate = self
        PWrdTxtField.delegate = self
        pNumberTxtField.delegate = self
        userName.delegate = self
        
        
        let center:NotificationCenter = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardDidShow(notification: Notification)
    {
        let info: NSDictionary = notification.userInfo! as NSDictionary
        let keyboardsize = (info[UIResponder.keyboardFrameEndUserInfoKey] as!
                            NSValue).cgRectValue
        let keyboardY = self.view.frame.height - keyboardsize.height
        if let activeTextField = activeTextField{
            let editingTextFieldY = activeTextField.convert(activeTextField.bounds, to:self.view).minY
            if self.view.frame.minY>=0
            {
                if editingTextFieldY>keyboardY-20
                {
                    UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                        self.view.frame = CGRect(x: 0, y: self.view
                            .frame.origin.y-(editingTextFieldY-(keyboardY-50)), width: self.view.bounds.width, height: self.view.bounds.height)
                    }, completion: nil)
                }
            }
        }
    }
    
    @objc func keyboardHidden(notification: Notification)
    
    {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        }, completion: nil)
    }
    
    
    
    
    func resetForm(){
        submitBtn.isEnabled = false
        
        fNameError.isHidden = false
        lNameError.isHidden = false
        emailError.isHidden = false
        pwdError.isHidden = false
        numberError.isHidden = false
        userNameError.isHidden = false
        
        
        fNameTxtField.text = ""
        lNameTxtField.text = ""
        mIdTxtField.text = ""
        PWrdTxtField.text = ""
        pNumberTxtField.text = ""
        userName.text = ""
    }
    
    
    @IBAction func dldClickCloseButton(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func fName(_ sender: Any) {
        if let firstname = fNameTxtField.text{
            print(firstname)
            if let errorMessage = invalidFirstName(firstname)
            {
                fNameError.text = errorMessage
                fNameErraor.isHidden = false
            }
            else
            {
                fNameError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    func invalidFirstName(_ value: String) -> String?
    {
        let regularExpression = "[A-Za-z]{0,10}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        if !predicate.evaluate(with: value)
        {
            return "Invalid First Name"
        }
        
        return nil
    }
    @IBAction func lName(_ sender: Any) {
        if let lastname = lNameTxtField.text
        {
            print(lastname)
            if let errorMessage = invalidLastName(lastname)
            {
                lNameError.text = errorMessage
                lNameError.isHidden = false
            }
            else
            {
                lNameError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    func invalidLastName(_ value: String) -> String?
    {
        let regularExpression = "[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        if !predicate.evaluate(with: value)
        {
            return "Invalid Last Name"
        }
        
        return nil
    }
    
    @IBAction func mailId(_ sender: Any)
    {
        if let email = mIdTxtField.text
        {
            print(email)
            if let errorMessage = invalidEmail(email)
            {
                emailError.text = errorMessage
                emailError.isHidden = false
            }
            else
            {
                emailError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    func invalidEmail(_ value: String) -> String?
    {
        let reqularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        if !predicate.evaluate(with: value)
        {
            return "Invalid Email Address"
        }
        
        return nil
    }
    
    
    @IBAction func passWord(_ sender: Any)
    {
        if let password = PWrdTxtField.text
        {
            print(password)
            if let errorMessage = invalidPassword(password)
            {
                pwdError.text = errorMessage
                pwdError.isHidden = false
            }
            else
            {
                pwdError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    func invalidPassword(_ value: String) -> String?
    {
        if value.count < 8
        {
            return "Password must be at least 8 characters"
        }
        if containsDigit(value)
        {
            return "Password must contain at least 1 digit"
        }
        if containsLowerCase(value)
        {
            return "Password must contain at least 1 lowercase character"
        }
        if containsUpperCase(value)
        {
            return "Password must contain at least 1 uppercase character"
        }
        return nil
    }
    
    func containsDigit(_ value: String) -> Bool
    {
        let reqularExpression = ".*[0-9]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func containsLowerCase(_ value: String) -> Bool
    {
        let reqularExpression = ".*[a-z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func containsUpperCase(_ value: String) -> Bool
    {
        let reqularExpression = ".*[A-Z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }
    
    
    @IBAction func userName(_ sender: Any) {
        
        
        if let username = userName.text{
            print(username)
            if let errorMessage = invalidUserName(username)
            {
                userNameError.text = errorMessage
                userNameError.isHidden = false
            }
            else
            {
                userNameError.isHidden = true
            }
        }
        checkForValidForm()
        
    }
    func invalidUserName(_ value: String) -> String?
    {
        let regularExpression = "\\A\\w{4,12}\\z"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regularExpression)
        if !predicate.evaluate(with: value)
        {
            return "Invalid user Name"
        }
        return nil
    }
    
    
    func checkForValidForm()
    {
        if fNameError.isHidden && lNameError.isHidden && emailError.isHidden &&  pwdError.isHidden && userNameError.isHidden
        {
            submitBtn.isEnabled = true
        }
        else {
            submitBtn.isEnabled = false
        }
    }
    
    func invalidPhoneNumber(_ value: String) -> String?
    {
        if value.count != 10 {
            return "Phone number must be 10 digits in length"
        }
        return nil
    }
    
    @IBAction func submitButton(_ sender: Any) {
        //        resetForm()
        
        fNameError.isHidden = true
        lNameError.isHidden = true
        emailError.isHidden = true
        pwdError.isHidden = true
        //        numberError.isHidden = true
        userNameError.isHidden = true
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "dataDetailsViewController") as! dataDetailsViewController
        vc.firstname = fNameTxtField.text!
        vc.lastname = lNameTxtField.text!
        vc.username = userName.text!
        vc.mailid =  mIdTxtField.text!
        vc.password = PWrdTxtField.text!
        vc.phonenumber = pNumberTxtField.text!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == pNumberTxtField{
            if let phoneNumber = pNumberTxtField.text?.trimmingCharacters(in: .whitespacesAndNewlines){
                print("invalidPhoneNumber stringCount: \(phoneNumber.count)")
                if let errorMessage = invalidPhoneNumber(phoneNumber){
                    numberError.text = errorMessage
                    numberError.isHidden = false
                }else{
                    numberError.text = ""
                    numberError.isHidden = true
                }
            }
        }
    }
    
}
    
extension ViewController:UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.fNameTxtField:
            self.lNameTxtField.becomeFirstResponder()
            
        case self.lNameTxtField:
            self.userName.becomeFirstResponder()
        case self.userName:
            self.mIdTxtField.becomeFirstResponder()
        case self.mIdTxtField:
            self.PWrdTxtField.becomeFirstResponder()
        case self.PWrdTxtField:
            self.pNumberTxtField.becomeFirstResponder()
        default:
            self.pNumberTxtField.resignFirstResponder()
        }
    }
   
  
}
