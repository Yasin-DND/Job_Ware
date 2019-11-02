//
//  SignUpViewController.swift
//  Second App
//
//  Created by Mac on 15/09/2019.
//  Copyright © 2019 DND. All rights reserved.
//

import UIKit
import CoreData


class SignUpViewController: UIViewController {
    
    @IBOutlet weak var userName : UITextField!
    @IBOutlet weak var eMail : UITextField!
    @IBOutlet weak var passWord : UITextField!
    @IBOutlet weak var cPassword : UITextField!
    @IBOutlet weak var label1 : UILabel!
        
    var arrayOfUser : [NSManagedObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.isHidden = true
        label1.isEnabled = false

    }
    override var prefersStatusBarHidden: Bool {
        return true
    }

    @IBAction func signUpAction(){
        if userName.text!.count > 0 && passWord.text! == cPassword.text! &&  passWord.text!.count > 0 && eMail.text!.count > 0{
            let user = UserInfo()
            user.name = userName.text!
            user.password = passWord.text!
            user.eMail = eMail.text!
            saveUser(cName: userName.text!, cPassword: passWord.text!, cEmail: eMail.text!)
            print("Item Appended")
            performSegue(withIdentifier: "back", sender: nil)
            //dismiss(animated: true, completion: nil)
        }else{
          label1.isEnabled = true
          label1.isHidden = false
        }
        
    }
    
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }
    
    
    func saveUser(cName : String,cPassword : String,cEmail : String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate  else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Company", in: managedContext)!
        
        let user = NSManagedObject(entity: entity, insertInto: managedContext)
        
        user.setValue(cName, forKey: "cName")
        user.setValue(cPassword, forKey: "cPass")
        user.setValue(cEmail, forKey: "cEmail")
        
        do{
            try managedContext.save()
            arrayOfUser.append(user)
            
        }catch let error as NSError{
            print("Could Not Save.\(error)")
        }
        
    }

}
