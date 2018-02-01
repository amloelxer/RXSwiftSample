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
    @IBOutlet weak var clickMeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToggle()
        createObservables()
        bindButton()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func bindToggle() {
        toggleSwitch.rx.isOn
            .map({ (enabled) -> String in
                if enabled == true {
                    return "The Toggle is enabled"
                } else {
                    return "The toggle is disabled"
                }
            })
            .subscribe(onNext: { [weak self] enabledText in
                self?.toggleLabel.text = enabledText
            })
    }
    
    func bindButton() {
        clickMeButton.rx.tap
            .subscribe(onNext: { [weak self ] tap in
                let vc = MyTableVC(nibName: "MyTableVC", bundle: nil)
                self?.present(vc, animated: true, completion: nil)
            })
    }

    // creating Observables
    
    func createObservables() {
        let one = 1
        let two = 2
        let three = 3
        let observable = Observable.of([one, two, three])
        observable.subscribe(
        onNext: { element in
            print(element)
        },
        onError: { print($0)},
        onCompleted: {
            print("done with my stuff man")
        })
    }
}

