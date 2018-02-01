//
//  ViewController.swift
//  RXSwiftSample
//
//  Created by Alexander Moller on 1/30/18.
//  Copyright © 2018 Alexander Moller. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    
    @IBOutlet weak var toggleSwitch: UISwitch!
    @IBOutlet weak var toggleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toggleSwitch.rx.isOn
            .subscribe(onNext: { [weak self] enabled in
                if enabled == true {
                    self?.toggleLabel.text = "The Toggle is enabled"
                } else {
                    self?.toggleLabel.text = "The toggle is disbaled"
                }
            })
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

