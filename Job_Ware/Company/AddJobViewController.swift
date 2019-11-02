//
//  AddJobViewController.swift
//  Second App
//
//  Created by Mac on 01/10/2019.
//  Copyright © 2019 DND. All rights reserved.
//

import UIKit
import CoreData

class AddJobViewController: UIViewController {
    @IBOutlet weak var Jobt: UITextField!
    @IBOutlet weak var JobD: UITextField!
    @IBOutlet weak var JobC: UITextField!
    var postedBy : String  = ""
  
    var jobss : [NSManagedObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    @IBAction func close(){
           dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneJobAdding(){
        var job = JobClass()
        job = JobClass()
        job.jobTitle = Jobt.text!
        job.jobDetails = JobD.text!
        job.contactDetail = JobC.text!
        saveJob(jobTitle: Jobt.text!, jobDetails: JobD.text!, jobContact: JobC.text!, jobPosted: postedBy)
        //jobss.append(job)
        dismiss(animated: true, completion: nil)
    }
    func saveJob(jobTitle : String,jobDetails : String,jobContact : String,jobPosted :String){
           guard let appDelegate = UIApplication.shared.delegate as? AppDelegate  else {
               return
           }
           let managedContext = appDelegate.persistentContainer.viewContext
           
           let entity = NSEntityDescription.entity(forEntityName: "Job", in: managedContext)!
           
           let user = NSManagedObject(entity: entity, insertInto: managedContext)
           
           user.setValue(jobTitle, forKey: "jobTitle")
           user.setValue(jobDetails, forKey: "jobDetail")
           user.setValue(jobContact, forKey: "jobContact")
           user.setValue(jobPosted, forKey: "PostedBy")
           
           do{
               try managedContext.save()
               jobss.append(user)
               
           }catch let error as NSError{
               print("Could Not Save.\(error)")
           }
           
    }
   
    
    

}
