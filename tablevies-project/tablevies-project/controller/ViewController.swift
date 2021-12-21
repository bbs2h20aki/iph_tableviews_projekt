//
//  ViewController.swift
//  tablevies-project
//
//  Created by Fabian Kirchmann / BBS2H20A on 21.12.21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mySearchbar: UISearchBar!
    @IBOutlet weak var myTableView: UITableView!
    
    //MARK: = Data
    var allKanzler = KanzlerData
    var selectedKanzler: kanzlermodel?
    var filteredKanzler = KanzlerData
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        myTableView.rowHeight = 100
        
        mySearchbar.delegate = self
        myTableView.keyboardDismissMode = .onDrag
    }
    //MARK: = segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBeschreibung"{
            let zielTableVC = segue.destination as! BeschreibungTableViewController
            zielTableVC.kanzler = selectedKanzler
        }
    }

}

//MARK: = extensions
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        selectedKanzler = filteredKanzler[indexPath.row]
        performSegue(withIdentifier: "showBeschreibung", sender: nil)
    }
    
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredKanzler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell",for: indexPath) as! CustomKanzlerTableviewCell
        
        cell.KanzlerLabel.text = filteredKanzler[indexPath.row].name
        cell.Kanzlerimage.image = UIImage(named: filteredKanzler[indexPath.row].imageName)
        
        return cell
    }
    
    
}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchText = searchText.lowercased()
        if searchText != ""{
            filteredKanzler = allKanzler.filter({kanzler in
                if kanzler.name.lowercased().contains(searchText){
                    return true
                }
                return false
            })
        }else{
            filteredKanzler = allKanzler
        }
        self.myTableView.reloadData()
    }
}
