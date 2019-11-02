//
//  EmpLoginViewController.swift
//  Second App
//
//  Created by Mac on 20/10/2019.
//  Copyright © 2019 DND. All rights reserved.
//

import UIKit
import CoreData
class EmpLoginViewController: UIViewController{


       @IBOutlet weak var userName: UITextField!
       @IBOutlet weak var passWord: UITextField!
       @IBOutlet weak var userError : UILabel!
       @IBOutlet weak var passError : UILabel!

       var userArray : [NSManagedObject] = []

 
       override var prefersStatusBarHidden: Bool {
           return true
       }
       
       override func viewDidLoad() {
           super.viewDidLoad()
           reset()
           fetchData()
            
       }
       override func viewWillAppear(_ animated: Bool) {
           reset()
           fetchData()
       }
    override func viewDidAppear(_ animated: Bool) {
           reset()
           fetchData()
    }
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }

    
    @IBAction func loginAction() {
          var strU = userName.text!
          var strP = passWord.text!
              for user in userArray{
                  var str1 = user.value(forKey: "eName") as! String
                  var str2 = user.value(forKey: "ePass") as! String
                 if str1 == strU && userName.text!.count > 0{
                      if  str2 == strP{
                          print("Login")
                          reset()
                          performSegue(withIdentifier: "Employee", sender: self)
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
          var j = 0
          for i in userArray{
              print(i.value(forKey: "eName"))
              print(i.value(forKey: "ePass"))
              print(j)
              j += 1
          }
       }
       
    
    
    func fetchData(){
    guard let appDelegate =
    UIApplication.shared.delegate as? AppDelegate else {
    return
    }
    let managedContext = appDelegate.persistentContainer.viewContext

      let fetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "Employee")

    do {
         userArray = try managedContext.fetch(fetchRequest)
      } catch let error as NSError {
    print("Could not fetch. \(error), \(error.userInfo)") }
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
