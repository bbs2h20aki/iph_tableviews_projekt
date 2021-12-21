//
//  CustomKanzlerTableviewCell.swift
//  tablevies-project
//
//  Created by Fabian Kirchmann / BBS2H20A on 21.12.21.
//

import UIKit

class CustomKanzlerTableviewCell: UITableViewCell {

    @IBOutlet weak var KanzlerLabel: UILabel!
    @IBOutlet weak var Kanzlerimage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Kanzlerimage.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
   

}
