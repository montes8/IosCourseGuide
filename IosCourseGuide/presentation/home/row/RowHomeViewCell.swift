//
//  RowHomeViewCell.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 13/07/23.
//

import UIKit

class RowHomeViewCell: UITableViewCell {

    @IBOutlet weak var rowView: UIStackView!
    @IBOutlet weak var rowDescription: UILabel!
    @IBOutlet weak var rowTitle: UILabel!
    @IBOutlet weak var rowImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        rowView.frame = CGRectMake(0,0,20,120)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
