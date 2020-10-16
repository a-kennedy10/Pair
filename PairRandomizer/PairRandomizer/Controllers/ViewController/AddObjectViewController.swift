//
//  AddObjectViewController.swift
//  PairRandomizer
//
//  Created by Alex Kennedy on 10/16/20.
//  Copyright © 2020 Alex Kennedy. All rights reserved.
//

import UIKit

class AddObjectViewController: UIViewController {

    // MARK: - outlets
    @IBOutlet weak var addObjectTextField: UITextField!
    
    // MARK: - properties
    var object: List?
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let newObject = addObjectTextField.text, !newObject.isEmpty else { return }
        ListController.shared.createListObject(object: newObject)
        self.navigationController?.popViewController(animated: true)
    }

}
