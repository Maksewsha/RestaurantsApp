//
//  EateryTableViewCell.swift
//  TableBased
//
//  Created by admin on 21.07.2022.
//

import UIKit

class EateryTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var valueField: UILabel!
    
    @IBOutlet weak var keyField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
