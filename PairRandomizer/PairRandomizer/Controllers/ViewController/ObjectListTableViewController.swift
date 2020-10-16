//
//  ObjectListTableViewController.swift
//  PairRandomizer
//
//  Created by Alex Kennedy on 10/16/20.
//  Copyright © 2020 Alex Kennedy. All rights reserved.
//

import UIKit

class ObjectListTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    // MARK: - actions
    @IBAction func randomizeButtonTapped(_ sender: Any) {
        ListController.shared.randomize()
        tableView.reloadData()
    }
    
    @IBAction func addObjectButtonTapped(_ sender: Any) {
        
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        ListController.shared.saveToPersistenStore()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel()
        headerLabel.text = "Group \(section.self + 1)"
        headerLabel.backgroundColor = .lightGray
        return headerLabel
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {

        return ListController.shared.objects.count / 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        if section == 1 {
            return 2
        }
        if section == 2 {
            return 2
        }
        if section == 3 {
            return 2
        }
        if section == 4 {
            return 2
        }
        if section == 5 {
            return 2
        }
    
        return 2
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "objectCell", for: indexPath)
        let list = ListController.shared.objects[indexPath.row]
        cell.textLabel?.text = "\(list.object)"

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let object = ListController.shared.objects[indexPath.row]
            ListController.shared.deleteObject(object: object)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddObjectVC" {
            guard let index = tableView.indexPathForSelectedRow,
                let destination = segue.destination as? AddObjectViewController else { return }
            let object = ListController.shared.objects[index.row]
            destination.object = object
        }
    }
    
}
