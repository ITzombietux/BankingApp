//
//  AccountsDataSource.swift
//  HousekeepingBookApp
//
//  Created by zombietux on 25/01/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

class AccountsDataSource: NSObject {

    var accounts: [Account]
    
    init(accounts: [Account]) {
        self.accounts = accounts
    }
}

extension AccountsDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountCell
        let index = indexPath.row
        let account = accounts[index]
        cell.model = AccountCell.Model(account: account, index: index)
        return cell
    }
}
