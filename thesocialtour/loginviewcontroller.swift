//
//  loginviewcontroller.swift
//  thesocialtour
//
//  Created by Robson  on 2017/04/03.
//  Copyright © 2017 Robson . All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class loginviewcontroller: UIViewController {
    
    
    
    @IBOutlet weak var emailtextfield: UITextField!
    
        @IBOutlet weak var passwordtextfield: UITextField!
    
    
    
    
    @IBAction func loginbuttonpressed(_ sender: Any) {
        
        if self.emailtextfield.text == "" || self.passwordtextfield.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        else {
            
            FIRAuth.auth()?.signIn(withEmail: self.emailtextfield.text!, password: self.passwordtextfield.text!) { (user, error) in
                
                if error == nil {
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
                    //Go to the HomeViewController if the login is sucessful
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "UITabBarController")
                    self.present(vc!, animated: false, completion: nil)
                    
                } else {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        
    }
    
    
    
}
