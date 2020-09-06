//
//  CocktailViewController.swift
//  CreatBaseVC
//
//  Created by Boss on 9/6/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import UIKit

class CocktailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var strInstructionsTextView: UITextView!
    @IBOutlet weak var strDrinkThumbTextView: UITextView!
    @IBOutlet weak var dateModifiedTextView: UITextView!
    var listCocktail = [CocktailModel]()
    var list = CocktailModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MasterTableViewCell.nib(), forCellReuseIdentifier: MasterTableViewCell.identifier())
        callAPI()
    }
    func callAPI() {
        if listCocktail.count == 0 {
            let url = URL(string: "https://www.thecocktaildb.com")
            let path = "/api/json/v1/1/search.php?f=a"
            let urlWithPath = url?.appendingPathComponent(path).absoluteString.removingPercentEncoding
            print(urlWithPath!)
            DataService.sharing.getData(urlString: urlWithPath!) {(data: BaseDataModel) in
                if let drinks = data.drinks {
                    self.listCocktail = drinks
                    self.tableView.reloadData()
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DisplayCocktailVC") as! DisplayCocktailVC
        vc.linkString = listCocktail[indexPath.row].strDrinkThumb
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCocktail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MasterTableViewCell.identifier(), for: indexPath) as! MasterTableViewCell
        cell.infoCocktail = listCocktail[indexPath.row]
        cell.fillData()
        
        cell.passData = { [weak self] data in
            self?.list = data
            self?.listCocktail[indexPath.row] = data
            self?.fillData(data: data)
            tableView.beginUpdates()
            tableView.endUpdates()
        }
        return cell
    }
    
    func fillData(data: CocktailModel) {
        strInstructionsTextView.text = data.strInstructions
        strDrinkThumbTextView.text = data.strDrinkThumb
        dateModifiedTextView.text = data.dateModified
        
        
    }
    
}
