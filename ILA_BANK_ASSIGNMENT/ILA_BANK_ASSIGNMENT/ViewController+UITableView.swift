//
//  File.swift
//  ILA_BANK_ASSIGNMENT
//
//  Created by Guna  Maddali on 20/02/24.
//

import UIKit

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isSearching ? filteredArray.count : namesArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemsTableViewCell", for: indexPath) as! ItemsTableViewCell
        if isSearching {
            cell.configureCell(image: imagesArray[indexPath.row], name: filteredArray[indexPath.row])
        } else {
            cell.configureCell(image: imagesArray[indexPath.row], name: namesArray[indexPath.row])
        }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
}
