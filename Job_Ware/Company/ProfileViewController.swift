//
//  ProfileViewController.swift
//  Job_Ware
//
//  Created by Mac on 03/11/2019.
//  Copyright © 2019 DND. All rights reserved.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {

    var userArray : [NSManagedObject] = []
    var arrayU : [NSManagedObject] = []
    var array : [NSManagedObject] = []
    var jobArray : [NSManagedObject] = []
    var postedBy : String = ""
    
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var emailLabel : UILabel!
    @IBOutlet weak var passLabel : UILabel!
    @IBOutlet weak var countLabel : UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        fetchData()
        fetchUser()
        myJobs()
        myUser()

        countLabel.text = String(array.count)
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        arrayU = []
        array = []
        jobArray = []
    }

    @IBAction func showPass(){
        if passLabel.isHidden{
            passLabel.isHidden = false
        }else{
            passLabel.isHidden = true
        }
    }
    
    func fetchUser(){
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
    func fetchData(){
    guard let appDelegate =
    UIApplication.shared.delegate as? AppDelegate else {
    return
    }
    let managedContext = appDelegate.persistentContainer.viewContext

      let fetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "Job")

    do {
         jobArray = try managedContext.fetch(fetchRequest)
      } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)") }
    }
    func myUser(){
        for i in userArray{
            var temp = i.value(forKey: "cName") as! String
            if temp == postedBy{
                print(i)
                nameLabel.text = i.value(forKey: "cName") as! String
                passLabel.text = i.value(forKey: "cPass") as! String
                emailLabel.text = i.value(forKey: "cEmail") as! String
                passLabel.isHidden = true
            }
        }
    }
    func myJobs(){
        //print(jobArray.count)
        for i in jobArray{
            var temp = i.value(forKey: "postedBy") as! String
            if temp == postedBy{
                array.append(i)
            }
        }
        
    }
}
