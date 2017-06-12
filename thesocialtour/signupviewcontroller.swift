//
//  signupviewcontroller.swift
//  thesocialtour
//
//  Created by Robson  on 2017/04/03.
//  Copyright © 2017 Robson . All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase

class signupviewcontroller : UIViewController {
    
    var ref :FIRDatabaseReference?
    
    //below is email address not username
    @IBOutlet weak var nametextfield: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var handicap: UITextField!
    @IBOutlet weak var passwordtextfield: UITextField!
    
    @IBAction func singuppressed(_ sender: Any) {
        ref = FIRDatabase.database().reference() 
        
        

        
        
        if nametextfield.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your Username", preferredStyle: .alert)
            
            
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        }
        
        if passwordtextfield.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your password", preferredStyle: .alert)
            
            
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        }
            
            
            
        else {
            FIRAuth.auth()?.createUser(withEmail: nametextfield.text!, password: passwordtextfield.text!) { (user, error) in
                
                let userid : String = user!.uid
                let useremail: String = self.username.text!
                let username: String = self.nametextfield.text!
                let handicap: String = self.handicap.text!
             
                self.ref?.child("users").child(userid).setValue(["email": useremail, "username": username, "handicap": handicap])

                
                
                if error == nil {
                    
                    
                   
                    
                    let alertController = UIAlertController(title: "Congratulations", message: "you have succesfully signed up", preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                    
                    
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginvc")
                    self.present(vc!, animated: true, completion: nil)

                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    
    }
    
    
}
