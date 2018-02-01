//
//  MyTableVC.swift
//  RXSwiftSample
//
//  Created by Alexander Moller on 2/1/18.
//  Copyright © 2018 Alexander Moller. All rights reserved.
//

import UIKit
import RxSwift
class MyTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var tableData:[CellViewModel] = []
    
    
    let titleLabelViewModel = TitleLabelViewModel()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mySearchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        subscribeToTextField()
        subscribeToTableTouches()
        addViewModels()

    }
    
    func addViewModels() {
        let viewModel1 = CellViewModel()
        let viewModel2 = CellViewModel()
        let viewModel3 = CellViewModel()

        titleLabelViewModel.title.asObservable().bind(to: titleLabel.rx.text)
        tableData = [viewModel1, viewModel2, viewModel3]
        self.tableView.reloadData()
    }
    
    func subscribeToTableTouches() {
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] index in
                print(index)
            })
    }
    
    func subscribeToTextField() {
        mySearchTextField.rx.value
            .subscribe(onNext: { [weak self] value in
                guard let inputText = value as? String else { return }
                
                let newTableData = self?.tableData.map({ cellViewModel -> CellViewModel in
                    let newViewModel = cellViewModel
                    newViewModel.cellText.value = inputText
                    return newViewModel
                })
                
                self?.titleLabelViewModel.title.value = inputText
            })
        
    }
}

extension MyTableVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let optionalCell = tableView.dequeueReusableCell(withIdentifier: "cell")
        guard let cell = optionalCell else { return UITableViewCell() }
        let viewModel :CellViewModel = tableData[indexPath.row]
        viewModel.cellText.asObservable().bind(to: cell.textLabel!.rx.text)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
}
