//
//  MyTableVC.swift
//  RXSwiftSample
//
//  Created by Alexander Moller on 2/1/18.
//  Copyright © 2018 Alexander Moller. All rights reserved.
//

import UIKit

class MyTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let someArray = ["Alex", "Allan", "Annie"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return someArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let optionalCell = tableView.dequeueReusableCell(withIdentifier: "cell")
        guard let cell = optionalCell else { return UITableViewCell() }
        cell.textLabel?.text = someArray[indexPath.row]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
}
