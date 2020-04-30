//
//  PostListTableViewController.swift
//  Reddit
//
//  Created by Pete Parks on 4/29/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

import UIKit

class StudentListTableViewController: UITableViewController {
    
    var students: [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFetchData()
    }
    
    func loadFetchData() {
     StudentController.fetchStudent { (result) in
         DispatchQueue.main.async() {
             switch result {
             case .success(let students):
                 self.students = students
                 self.tableView.reloadData()
             case .failure(let error):
                 print(error)
             }
         }
     }
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as? StudentTableViewCell else  { return UITableViewCell () }
            
        let student = students[indexPath.row]
        //print("Student: \(student.name)")
        //print("Cell")
        DispatchQueue.main.async() {
            cell.studentName.text = student.name
            cell.studentHouse.text = student.house ?? ""
            if let houseName = student.house {
                let image = UIImage(named: houseName)
                cell.studentHouseImage?.image = image
            }
        }

        
        return cell
    }
    
    
}
