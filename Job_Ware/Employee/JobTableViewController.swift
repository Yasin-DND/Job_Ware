//
//  JobTableViewController.swift
//  Second App
//
//  Created by Mac on 28/09/2019.
//  Copyright © 2019 DND. All rights reserved.
//

import UIKit
import CoreData

class JobTableViewController: UITableViewController {
    
    
    var jobArray : [NSManagedObject] = []
    var jobObject = JobClass()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    override func viewWillAppear(_ animated: Bool) {
            fetchData()

    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
        return jobArray.count
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobView", for: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
        let label1 = cell.viewWithTag(1001) as! UILabel
        let label2 = cell.viewWithTag(1002) as! UILabel
        let job = jobArray[indexPath.row]
        label.text = job.value(forKey: "jobTitle") as! String
        label1.text = job.value(forKey: "jobDetail") as! String
        label2.text = job.value(forKey: "jobContact") as! String
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 200.0
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        jobObject.jobTitle =  jobArray[indexPath.row].value(forKey: "jobTitle") as! String
        jobObject.jobDetails =  jobArray[indexPath.row].value(forKey: "jobDetail") as! String
        jobObject.contactDetail = jobArray[indexPath.row].value(forKey: "jobContact") as! String
        print(jobObject)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewJob"{
            let nav = segue.destination as! UINavigationController
            let controller = nav.topViewController as! JobDetailsViewController
            controller.jObject = jobObject
        }
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
    
}
