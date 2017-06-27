//
//  MainVC.swift
//  LynxOS
//
//  Created by Andrew Foster on 6/25/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "appCell", for: indexPath) as? AppCell {
            return cell
        }
        return AppCell()
    }
    

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToAssistant(_ sender: Any) {
        performSegue(withIdentifier: "goToAssistant", sender: nil)
    }

}
