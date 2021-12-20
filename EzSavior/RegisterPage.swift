//
//  RegisterPage.swift
//  EzSavior
//
//  Created by Hatto on 3/10/2563 BE.
//

import UIKit
import Firebase

class RegisterPage: UIViewController {
    
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfConfrimPassword: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfSurname: UITextField!
    
    @IBAction func btnRegister(_ sender: Any) {
        self.view.endEditing(true)
        if tfUsername.text == "" && tfEmail.text == "" && tfPassword.text == "" && tfConfrimPassword.text == "" && tfName.text == "" && tfSurname.text == "" {
            let alert = UIAlertController(title: .none, message: "Please fill all information", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else if tfPassword.text != tfConfrimPassword.text {
            let alert = UIAlertController(title: .none, message: "Password doesn't match", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else {
            let ref = Database.database().reference()
            ref.child("\(tfUsername.text!)").setValue(
                ["username" : "\(tfUsername.text!)" ,
                 "email" : "\(tfEmail.text!)" ,
                 "password" : "\(tfPassword.text!)" ,
                 "name" : "\(tfName.text!)" ,
                 "surname" : "\(tfSurname.text!)" ,
                ])
            let alert = UIAlertController(title: "Register done", message: .none, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Login", style: .default, handler: { action in
                self.performSegue(withIdentifier: "login", sender: nil)
            }))
            self.present(alert, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKB()
        // Do any additional setup after loading the view.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


