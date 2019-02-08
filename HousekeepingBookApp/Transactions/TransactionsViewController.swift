//
//  TransactionsViewController.swift
//  HousekeepingBookApp
//
//  Created by zombietux on 25/01/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    // unwind segue
    @IBAction func cancelTransactionCreation(_ segue: UIStoryboardSegue) {}
    @IBAction func saveTransaction(_ segue: UIStoryboardSegue) {}
    
    var stateController: StateController!
    var account: Account!

    fileprivate var dataSource: TransactionsDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = account.number.accountNumberFormatting
        navigationItem.title = account.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        totalLabel.text = account.total.dollarsFormatting
        super.viewWillAppear(animated)
        dataSource = TransactionsDataSource(transactions: account.transactions)
        tableView.dataSource = dataSource
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationController = segue.destination as? UINavigationController,
            let createTransactionViewController = navigationController.viewControllers.first as? CreateTransactionViewController {
            createTransactionViewController.delegate = self
        }
    }
}

extension TransactionsViewController: CreateTransactionViewControllerDelegate {
    func add(newTransaction: Transaction) {
        account.transactions.append(newTransaction)
        stateController.update(account)
    }
}
