//
//  AccountsViewController.swift
//  HousekeepingBookApp
//
//  Created by zombietux on 25/01/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController {
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    var stateController: StateController!
    
    fileprivate var dataSource: AccountsDataSource!
    
    // unwind segue
    @IBAction func cancelAccountCreation(_ segue: UIStoryboardSegue) {}
    @IBAction func saveAccount(_ segue: UIStoryboardSegue) {}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataSource = AccountsDataSource(accounts: stateController.accounts)
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "CreateAccountSegue":
            if let navigationController = segue.destination as? UINavigationController,
                let createAccountViewController = navigationController.viewControllers.first as? CreateAccountViewController {
                createAccountViewController.stateController = stateController
            }
        case "TransactionsSegue":
            if let transactionsViewController = segue.destination as? TransactionsViewController,
                let selectedIndex = tableView.indexPathForSelectedRow?.row {
                let account = dataSource.accounts[selectedIndex]
                transactionsViewController.account = account
                transactionsViewController.stateController = stateController
            }
        default:
            break
        }
    }
    

}
