//
//  NumberingCounter.swift
//  TestSwift
//
//  Created by 이택규 on 2018. 8. 21..
//  Copyright © 2018년 이택규. All rights reserved.
//

import UIKit
import QuartzCore

class NumberingCounter: UIView {

    enum AnimatingBehavior {
        case ascendingWhenIncreasing
        case descendingWhenIncreasing
        case alwaysAscending
        case alwaysDescending
    }

    enum Direction {
        case ascending
        case descending
    }

    var animationDuration: TimeInterval = 0.45
    var animatingBehavior: AnimatingBehavior = .ascendingWhenIncreasing
    var font = UIFont.systemFont(ofSize: 30)

    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        label1.textAlignment = .center
        label2.textAlignment = .center
        label3.textAlignment = .center

        label1.font = font
        label2.font = font
        label3.font = font

        addSubview(label1)
        addSubview(label2)
        addSubview(label3)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var value: Int? {
        get { return internalValue }
        set { setValue(newValue, animated: true) }
    }

    var internalValue: Int?

    func setValue(_ value: Int?, animated: Bool, completion: (() -> Void)? = nil) {
        guard value != internalValue else { return }

        let fromValue = internalValue ?? 0
        let toValue = value ?? 0
        let isIncreasing = toValue > fromValue
        let direction: Direction

        switch animatingBehavior {
        case .ascendingWhenIncreasing:
            direction = isIncreasing ? .ascending : .descending

        case .descendingWhenIncreasing:
            direction = isIncreasing ? .descending : .ascending

        case .alwaysAscending:
            direction = .ascending

        case .alwaysDescending:
            direction = .descending
        }

        setValue(value, direction: direction, animated: animated, completion: completion)
    }

    func setValue(_ value: Int?, direction: Direction, animated: Bool, completion: (() -> Void)? = nil) {
        guard value != internalValue else { return }

        label1.text = value?.string
        label2.text = internalValue?.string
        label3.text = value?.string

        label1.alpha = 0
        label2.alpha = 1
        label3.alpha = 0

        label2.frame = bounds
        label1.frame = label2.frame.offsetBy(dx: 0, dy: -bounds.height)
        label3.frame = label2.frame.offsetBy(dx: 0, dy: bounds.height)

        let offsetY = direction.coefficient * bounds.height

        UIView.animate(withDuration: animationDuration,
                       delay: 0,
                       usingSpringWithDamping: 0.75,
                       initialSpringVelocity: 0.15,
                       options: [],
                       animations: {
            self.label1.alpha = 1
            self.label2.alpha = 0
            self.label3.alpha = 1

            self.label1.frame = self.label1.frame.offsetBy(dx: 0, dy: offsetY)
            self.label2.frame = self.label2.frame.offsetBy(dx: 0, dy: offsetY)
            self.label3.frame = self.label3.frame.offsetBy(dx: 0, dy: offsetY)
        })

        internalValue = value
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        setValue(value, animated: false)
    }

}

extension NumberingCounter.Direction {

    var coefficient: CGFloat {
        switch self {
        case .ascending: return -1
        case .descending: return 1
        }
    }

}

extension Int {

    var string: String? {
        return String(self)
    }

}
