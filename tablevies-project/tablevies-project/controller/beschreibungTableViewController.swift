//
//  beschreibungTableViewController.swift
//  tablevies-project
//
//  Created by Fabian Kirchmann / BBS2H20A on 21.12.21.
//

import UIKit

class BeschreibungTableViewController: UITableViewController {
    
    
    @IBOutlet weak var KanzlerImage: UIImageView!
    @IBOutlet weak var KanzlerLabel: UILabel!
    @IBOutlet weak var Kanzlergebdatum: UILabel!
    @IBOutlet weak var Partei: UILabel!
    @IBOutlet weak var Amtszeit: UILabel!
    
    
    
    
    var kanzler: model?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()

        
        
        KanzlerImage.image = UIImage(named: kanzler?.imageName ?? "olaf")
        KanzlerLabel.text = kanzler?.name
        Kanzlergebdatum.text = kanzler?.gebdate
        Partei.text = kanzler?.partei
        Amtszeit.text = kanzler?.amtszeit
        
    }

    

}
