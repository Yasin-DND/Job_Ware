//
//  LoginViewController.swift
//  Second App
//
//  Created by Mac on 15/09/2019.
//  Copyright © 2019 DND. All rights reserved.
//

import UIKit
import CoreData


class LoginViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var userError : UILabel!
    @IBOutlet weak var passError : UILabel!

    var cObject = UserInfo()
    var userArray : [NSManagedObject] = []
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
        reset()
    }
    override func viewDidAppear(_ animated: Bool) {
        fetchData()
    }

    
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }
        
    func fetchData(){
        guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
        return
        }
        let managedContext = appDelegate.persistentContainer.viewContext

          let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Company")

        do {
             userArray = try managedContext.fetch(fetchRequest)
          } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)") }
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "Dashboard"{
            let nav = segue.destination as! UINavigationController
            let controller = nav.topViewController as! DashBoardViewController
           // print("Login Ki Screen\(userName.text!)")
            controller.cObject = userName.text!
        }
    }
    
   @IBAction func loginAction() {
    let strU = userName.text!
    let strP = passWord.text!
        for user in userArray{
            let str1 = user.value(forKey: "cName") as! String
            let str2 = user.value(forKey: "cPass") as! String
           if str1 == strU && userName.text!.count > 0{
                if  str2 == strP{
                    print("Login")
                    performSegue(withIdentifier: "Dashboard", sender: self)
                }else{
                    passError.isEnabled = true
                    passError.isHidden = false
                    userError.isHidden = false
                    userError.isEnabled = true
                }
            }else{
                passError.isEnabled = true
                passError.isHidden = false
                userError.isHidden = false
                userError.isEnabled = true
            }
        }
   }
    
    func reset(){
        passError.isEnabled = false
        passError.isHidden = true
        userError.isEnabled = false
        userError.isHidden = true
        userName.text = ""
        userName.placeholder = "Username"
        passWord.text = ""
        passWord.placeholder = "Password"
    }
}
