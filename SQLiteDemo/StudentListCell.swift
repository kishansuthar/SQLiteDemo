//
//  StudentListCell.swift
//  SQLiteDemo
//
//  Created by Kishan Suthar on 29/08/20.
//  Copyright © 2020 Kishan Suthar. All rights reserved.
//

import UIKit

class StudentListCell: UITableViewCell {

    @IBOutlet weak var imgPro: UIImageView!
    
    @IBOutlet weak var lblCGPA: UILabel!
    @IBOutlet weak var lblCollege: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
