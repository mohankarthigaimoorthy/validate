////
////  ProfileViewController.swift
////  validation
////
////  Created by Mohan K on 16/12/22.
////
//
//import UIKit
//
//class ProfileViewController: UITableViewController {
//
//
//    @IBOutlet weak var firstNameTextField: UITextField!
//    
//    @IBOutlet weak var lastNameTextField: UITextField!
//    
//    @IBOutlet weak var userNameTextField: UITextField!
//    
//    @IBOutlet weak var mailIdTextField: UITextField!
//    
//    @IBOutlet weak var passWordTextField: UITextField!
//    
//    @IBOutlet weak var phoneNumberTextField: UITextField!
//    
//    
//    @IBOutlet weak var firstnameError: UILabel!
//    
//    @IBOutlet weak var lastnameError: UILabel!
//    
//    
//    @IBOutlet weak var usernameError: UILabel!
//    
//    @IBOutlet weak var mailidError: UILabel!
//    
//    
//    @IBOutlet weak var passwordError: UILabel!
//    
//    
//    @IBOutlet weak var phonenumberError: UILabel!
//    
//    @IBOutlet weak var submitButton: UIButton!
//    
//    var activeTextField: UITextField!
//    
//
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        resetForm()
//        
//        submitButton.layer.cornerRadius = 8
//        
//        firstNameTextField.delegate = self
//        lastNameTextField.delegate = self
//        userNameTextField.delegate = self
//        mailIdTextField.delegate = self
//        passWordTextField.delegate = self
//        phoneNumberTextField.delegate = self
//        
//
//        let center:NotificationCenter = NotificationCenter.default
//        center.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//        center.addObserver(self, selector: #selector(keyboardHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//    
//@objc func keyboardDidShow(notification: Notification)
//{
//    let info: NSDictionary = notification.userInfo! as NSDictionary
//    let keyboardsize = (info[UIResponder.keyboardFrameEndUserInfoKey] as!
//                        NSValue).cgRectValue
//    let keyboardY = self.view.frame.height - keyboardsize.height
//    let editingTextFieldY = activeTextField.convert(activeTextField.bounds, to:self.view).minY
//    if self.view.frame.minY>=0
//    {
//        if editingTextFieldY>keyboardY-20
//        {
//            UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
//                self.view.frame = CGRect(x: 0, y: self.view
//                    .frame.origin.y-(editingTextFieldY-(keyboardY-50)), width: self.view.bounds.width, height: self.view.bounds.height)
//            }, completion: nil)
//        }
//    }
//}
//
//@objc func keyboardHidden(notification: Notification){
//    UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
//        self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
//    }, completion: nil)
//}
//
//
//        func resetForm(){
//            firstnameError.isHidden = false
//            lastnameError.isHidden = false
//            usernameError.isHidden = false
//            mailidError.isHidden = false
//            passwordError.isHidden = false
//            phonenumberError.isHidden = false
//            
//            firstNameTextField.text = ""
//            lastNameTextField.text = ""
//            userNameTextField.text = ""
//            mailIdTextField.text = ""
//            passWordTextField.text = ""
//            phoneNumberTextField.text = ""
//        
//    }
//
//    @IBAction func endButton(_ sender: Any) {
//        self.view.endEditing(true)
//    }
//    
//    @IBAction func firstNameChanged(_ sender: Any) {
//        if let firstname = firstNameTextField.text {
//            if let errorMessage = invalidFirstName(firstname)
//            {
//                firstnameError.text = errorMessage
//                firstnameError.isHidden = false
//            }
//            else
//            {
//                firstnameError.isHidden = true
//            }
//        }
//        checkForValidForm()
//    }
//    
//    func invalidFirstName(_ value: String) -> String?
//    {
//        let regularExpression = "[A-Za-z]{0,10}"
//        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
//        if !predicate.evaluate(with: value)
//        {
//            return "Invalid First Name"
//        }
//        
//        return nil
//    }
//    @IBAction func lastNameChange(_ sender: Any) {
//        if let lastname = lastNameTextField.text{
//            
//            
//            if let errorMessage = invalidLastName(lastname)
//            {
//                lastnameError.text = errorMessage
//                lastnameError.isHidden =  false
//            }
//            else
//            {
//                lastnameError.isHidden = true
//            }
//        }
//            checkForValidForm()
//        }
//  
//    func invalidLastName(_ value:String)->String? {
//        
//            let regularExpression = "[A-Za-z]{2,}"
//            let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
//            if !predicate.evaluate(with: value)
//            {
//                return "Invalid Last Name"
//            }
//            
//            return nil
//    }
//
//    @IBAction func userNameChange(_ sender: Any) {
//        if let username = userNameTextField.text{
//            if let errorMessage = invalidUserName(username)
//            {
//                usernameError.text = errorMessage
//                usernameError.isHidden = false
//            }
//            else{
//                usernameError.isHidden = true
//            }
//        }
//        checkForValidForm()
//    }
//    
//    func invalidUserName(_ value: String) -> String?
//    {
//        let regularExpression = "\\A\\w{4,12}\\z"
//        let predicate = NSPredicate(format:"SELF MATCHES %@", regularExpression)
//        if !predicate.evaluate(with: value)
//        {
//            return "Invalid user Name"
//        }
//        return nil
//    }
//
//    @IBAction func mailIdchange(_ sender: Any) {
//        if let email = mailIdTextField.text
//        {
//            if let errorMessage = invalidEmail(email)
//            {
//                mailidError.text = errorMessage
//                mailidError.isHidden = false
//            }
//            else{
//                mailidError.isHidden = true
//            }
//        }
//        checkForValidForm()
//    }
//    
//    func invalidEmail(_ value: String) -> String?
//    {
//        let reqularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
//        if !predicate.evaluate(with: value)
//        {
//            return "Invalid Email Address"
//        }
//        
//        return nil
//    }
//    @IBAction func passWordChange(_ sender: Any) {
//        if let password = passWordTextField.text{
//            if let errorMessage = invalidPassWord(password)
//            {
//                passwordError.text = errorMessage
//                passwordError.isHidden = false
//            }
//            else {
//                passwordError.isHidden = true
//            }
//        }
//        checkForValidForm()
//    }
//    
//    func invalidPassWord(_ value: String) -> String?
//    {
//        if value.count < 8
//        {
//            return "Password must be at least 8 characters"
//        }
//        if containsDigit(value)
//        {
//            return "Password must contain at least 1 digit"
//        }
//        if containsLowerCase(value)
//        {
//            return "Password must contain at least 1 lowercase character"
//        }
//        if containsUpperCase(value)
//        {
//            return "Password must contain at least 1 uppercase character"
//        }
//        return nil
//    }
//    
//    func containsDigit(_ value: String) -> Bool
//    {
//        let reqularExpression = ".*[0-9]+.*"
//        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
//        return !predicate.evaluate(with: value)
//    }
//    
//    func containsLowerCase(_ value: String) -> Bool
//    {
//        let reqularExpression = ".*[a-z]+.*"
//        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
//        return !predicate.evaluate(with: value)
//    }
//    
//    func containsUpperCase(_ value: String) -> Bool
//    {
//        let reqularExpression = ".*[A-Z]+.*"
//        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
//        return !predicate.evaluate(with: value)
//    }
//    
//    @IBAction func phoneNumberchange(_ sender: Any) {
//        if let phonenumber = phoneNumberTextField.text {
//            if let errorMessage = invalidPhoneNumber(phonenumber)
//            {
//                phonenumberError.text = errorMessage
//                phonenumberError.isHidden = false
//            }
//            else{
//                phonenumberError.isHidden = true
//            }
//        }
//        checkForValidForm()
//    }
//    
//    func invalidPhoneNumber(_ value: String) -> String?
//    {
//        let set = CharacterSet(charactersIn: value)
//        if !CharacterSet.decimalDigits.isSuperset(of: set)
//        {
//            return "Phone Number Must Contain Only Digits"
//        }
//        
//        if value.count != 10
//        {
//            return "Phone Number must be 10 Digits in Length"
//        }
//        return nil
//    }
//    func checkForValidForm()
//    {
//        if firstnameError.isHidden && lastnameError.isHidden && usernameError.isHidden && mailidError.isHidden &&
//            passwordError.isHidden && phonenumberError.isHidden {
//            submitButton.isEnabled = true
//        }
//        else {
//            submitButton.isEnabled = false
//        }
//    }
//    
//    
//    @IBAction func submitButton(_ sender: Any) {
//        
//        resetForm()
//    }
//    
//}
//
//extension ProfileViewController: UITextFieldDelegate{
//    private func textFieldShouldBeginEditing(_ textField: UITextField) {
//        activeTextField = textField
////        return true
//    }
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.switchBasedNextTextField(textField)
//        return true
//    }
//    
//    private func switchBasedNextTextField(_ textField: UITextField) {
//        switch textField {
//        case self.firstNameTextField:
//            self.lastNameTextField.becomeFirstResponder()
//        case self.lastNameTextField:
//            self.userNameTextField.becomeFirstResponder()
//        case self.userNameTextField:
//            self.mailIdTextField.becomeFirstResponder()
//        case self.mailIdTextField:
//            self.passWordTextField.becomeFirstResponder()
//        case self.passWordTextField:
//            self.phoneNumberTextField.becomeFirstResponder()
//        default:
//            self.phoneNumberTextField.resignFirstResponder()
//        }
//    }
//    
////    func registerForKeyboardNotifications() {
////        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardAppear(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
////        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardDisappear(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
////    }
////
////
////    @objc func onKeyboardAppear(_ notification: NSNotification) {
////        let info = notification.userInfo!
////        let rect: CGRect = info[UIResponder.keyboardFrameBeginUserInfoKey] as! CGRect
////        let kbSize = rect.size
////
////        let insets = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
////
////        // If active text field is hidden by keyboard, scroll it so it's visible
////        // Your application might not need or want this behavior.
//////        var aRect = self.view.frame;
//////        aRect.size.height -= kbSize.height;
//////
//////        let activeField: UITextField? = [firstNameTextField, lastNameTextField, userNameTextField, mailIdTextField, phoneNumberTextField].first { $0.isFirstResponder }
//////        if let activeField = activeField {
//////            if !aRect.contains(activeField.frame.origin) {
//////                let scrollPoint = CGPoint(x: 0, y: activeField.frame.origin.y-kbSize.height)
////////                scrollView.setContentOffset(scrollPoint, animated: true)
//////                self.tableView.setContentOffset(scrollPoint, animated: true)
//////            }
//////        }
////    }
////
////    @objc func onKeyboardDisappear(_ notification: NSNotification) {
//////        scrollView.contentInset = UIEdgeInsets.zero
//////        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
////        self.tableView.contentInset = UIEdgeInsets.zero
////        self.tableView.scrollIndicatorInsets =  UIEdgeInsets.zero
////    }
//}
