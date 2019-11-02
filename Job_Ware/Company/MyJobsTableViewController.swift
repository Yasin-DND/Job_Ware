//
//  MyJobsTableViewController.swift
//  Job_Ware
//
//  Created by Mac on 03/11/2019.
//  Copyright © 2019 DND. All rights reserved.
//

import UIKit
import CoreData
class MyJobsTableViewController: UITableViewController {

   var jobArray : [NSManagedObject] = []
      var jobObject = JobClass()
      var postedBy = ""
      var array = [NSManagedObject]()
      
      override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        myJobs()

      }

      override func viewWillAppear(_ animated: Bool) {
        fetchData()
        myJobs()

      }
      override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
        return array.count
      }

      
      
      override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "JobView", for: indexPath)
          let label = cell.viewWithTag(1000) as! UILabel
          let label1 = cell.viewWithTag(1001) as! UILabel
          let label2 = cell.viewWithTag(1002) as! UILabel
          let job = array[indexPath.row]
          label.text = job.value(forKey: "jobTitle") as! String
          label1.text = job.value(forKey: "jobDetail") as! String
          label2.text = job.value(forKey: "jobContact") as! String
          return cell
      }
      override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
          return 200.0
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
    func myJobs(){
        print(jobArray.count)
        for i in jobArray{
            print("Yahan Tak agaya\(postedBy)")
            var temp = i.value(forKey: "postedBy") as! String
            print(i.value(forKey: "postedBy"))
            
            if temp == postedBy{
                array.append(i)
            }
        }
        
    }
    
    
   

}
