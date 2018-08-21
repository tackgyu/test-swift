//
//  ViewController.swift
//  TestSwift
//
//  Created by 이택규 on 2018. 5. 22..
//  Copyright © 2018년 이택규. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var counter: NumberingCounter!

    override func viewDidLoad() {
        super.viewDidLoad()

        let value1: Int? = nil
        let value2: Int? = nil
        print(value1 == value2)

        counter = NumberingCounter()
        counter.animatingBehavior = .alwaysAscending
        counter.frame = CGRect(x: 50, y: 50, width: 30, height: 50)
        view.addSubview(counter)

        let textField = TextField()
        view.addSubview(textField)

        textField.snp.makeConstraints { make in
//            make.height.equalTo(60)
            make.leading.trailing.equalTo(0)
            make.centerY.equalToSuperview().offset(-100)
        }

        textField.becomeFirstResponder()

//        update()
    }

    func update() {
        var nextValue = counter.value ?? 0

//        while nextValue == counter.value {
//            nextValue = Int(arc4random_uniform(10))
//        }

        nextValue += 1
        if nextValue >= 10 { nextValue = 0 }

        counter.value = nextValue

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.update()
        })
    }

}
