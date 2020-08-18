//
//  HomeController.swift
//  LoginPage
//
//  Created by kuh on 18/07/20.
//  Copyright © 2020 kuhCompany. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var toDoList: UITableView!
    var homeModel = HomeModel()
    var popUpTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoList.delegate = self
        toDoList.dataSource = self
        setupUi()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeModel.agendas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = homeModel.agendas[indexPath.row]
        return cell
    }
    
    func setupUi() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onTapAddButton))
        navigationItem.rightBarButtonItem = addButton
    }
    @objc func onTapAddButton() {
            let popUpEntry = UIAlertController(title: "Add New Agenda", message: nil, preferredStyle: .alert)
        popUpEntry.addTextField(configurationHandler: entryTextField)
            let addButtonAction = UIAlertAction(title: "Add", style: .default, handler: self.addNew)
            popUpEntry.addAction(addButtonAction)
            let cancelButtonAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            popUpEntry.addAction(cancelButtonAction)
        self.present(popUpEntry, animated: true)
    }
    
    func entryTextField(textField: UITextField){
        popUpTextField = textField
        popUpTextField.placeholder = "..."
    }

    func addNew(alert: UIAlertAction) {
         guard popUpTextField.text != nil else{return}
               homeModel.agendas.append(popUpTextField.text!)
        toDoList.reloadData()
    }
    
}

