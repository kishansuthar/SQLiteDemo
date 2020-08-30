//
//  StudentListVC.swift
//  SQLiteDemo
//
//  Created by Kishan Suthar on 29/08/20.
//  Copyright © 2020 Kishan Suthar. All rights reserved.
//

import UIKit

class StudentListVC: UIViewController {

    
    var students:[Student] = []
    
    @IBOutlet weak var tblStudentList: UITableView!
    var db:DBHelper = DBHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        students = db.read()
        tblStudentList.reloadData()
    }
}

extension StudentListVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblStudentList.dequeueReusableCell(withIdentifier: "StudentListCell", for: indexPath) as! StudentListCell
        let data = students[indexPath.row]
        cell.lblName.text = data.name
        cell.lblAge.text = "\(data.age)"
        cell.lblCollege.text = data.college
        cell.lblCGPA.text = "\(data.cgpa)"
        
//        let dataDecoded = Data(base64Encoded: data.image, options: Data.Base64DecodingOptions(rawValue: 0))!
        let dataDecoded = Data(base64Encoded: data.image, options: .init(arrayLiteral: .ignoreUnknownCharacters))!
        let decodedimage:UIImage = UIImage(data: dataDecoded)!
        
        cell.imgPro.image = decodedimage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 343.0
    }
    
}
