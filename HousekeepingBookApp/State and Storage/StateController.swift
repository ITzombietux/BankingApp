//
//  StateController.swift
//  HousekeepingBookApp
//
//  Created by zombietux on 25/01/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import Foundation

class StateController {
    fileprivate let storageController: StorageController
    fileprivate(set) var accounts: [Account]
    
    init(storageController: StorageController) {
        self.storageController = storageController
        self.accounts = storageController.fetchAccounts()
    }
    
    func add(_ account: Account) {
        accounts.append(account)
        storageController.save(accounts)
    }
    
    func update(_ account: Account) {
        for (index, storedAccount) in accounts.enumerated() {
            guard storedAccount.number == account.number else {
                continue
            }
            accounts[index] = account
            storageController.save(accounts)
            break
        }
    }
}
