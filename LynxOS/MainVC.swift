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
    
    var apps = [App]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        addApps()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let appDestination = apps[indexPath.row].destination
        performSegue(withIdentifier: appDestination, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.appCell.rawValue, for: indexPath) as? AppCell {
            
            let app = apps[indexPath.row]
            cell.updateUI(app: app)
            
            return cell
        }
        return AppCell()
    }
    

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToAssistant(_ sender: Any) {
        performSegue(withIdentifier: Identifiers.assistant.rawValue, sender: nil)
    }
    
    @IBAction func goToSettings(_ sender: Any) {
        performSegue(withIdentifier: Identifiers.settings.rawValue, sender: nil)
    }
    
    func addApps() {
        apps.append(App(appName: "Camera", appIconImage: "camera", destination: Identifiers.camera.rawValue))
        apps.append(App(appName: "Weather", appIconImage: "weather", destination: Identifiers.notAvailable.rawValue))
        apps.append(App(appName: "Browser", appIconImage: "browser", destination: Identifiers.notAvailable.rawValue))
        apps.append(App(appName: "Music", appIconImage: "music", destination: Identifiers.notAvailable.rawValue))
        apps.append(App(appName: "Calculator", appIconImage: "calculator", destination: Identifiers.notAvailable.rawValue))
        apps.append(App(appName: "Clock", appIconImage: "clock", destination: Identifiers.notAvailable.rawValue))
        apps.append(App(appName: "Brush", appIconImage: "brush", destination: Identifiers.notAvailable.rawValue))
        apps.append(App(appName: "SocialNet", appIconImage: "socialnet", destination: Identifiers.notAvailable.rawValue))
        apps.append(App(appName: "Random", appIconImage: "random", destination: Identifiers.notAvailable.rawValue))
        apps.append(App(appName: "LAplaces", appIconImage: "laplaces", destination: Identifiers.notAvailable.rawValue))
    }
}
