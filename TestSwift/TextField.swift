//
//  TextField.swift
//  TestSwift
//
//  Created by 이택규 on 2018. 8. 21..
//  Copyright © 2018년 이택규. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TextField: UITextField {

    var counters: [NumberingCounter] = []
    let valueRelay = BehaviorRelay<Int?>(value: nil)
    let disposeBag = DisposeBag()

    override init(frame: CGRect) {
        super.init(frame: frame)

        clipsToBounds = true
        font = UIFont.systemFont(ofSize: 30)

        self.defaultTextAttributes = [
            NSAttributedStringKey.font.rawValue: font!,
            NSAttributedStringKey.foregroundColor.rawValue: UIColor.clear
        ]

        rx.text.map { text -> Int? in
            guard let text = text, !text.isEmpty else { return nil }
            return Int(text.split(separator: ",").joined())
        }.bind(to: valueRelay).disposed(by: disposeBag)

        valueRelay.map { value -> String? in
            guard let value = value else { return nil }

            let string = String(value)
            var result = ""

            string.reversed().enumerated().forEach { (index, character) in
                result += String(character)
                if index < string.count - 1, (index % 3) == 2 {
                    result += ","
                }
            }

            return String(result.reversed())
        }.bind(to: rx.text).disposed(by: disposeBag)

        rx.text.distinctUntilChanged().subscribe(onNext: { [weak self] text in
            self?.updateCounters(animated: true)
        }).disposed(by: disposeBag)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        updateCounters(animated: false)
    }

    func updateCounters(animated: Bool) {
        guard let text = text else { return }

        let rects = characterRects
        let count = text.count
        guard rects.count == count else { return }

        let numberCount = text.split(separator: ",").joined().count
        guard numberCount > 0 else { return }

        if numberCount > counters.count {
            (counters.count ..< numberCount).forEach { _ in
                let counter = NumberingCounter()
                addSubview(counter)
                counters.append(counter)
            }
        }

        var numberIndex = 0
        var remainingCounters: [NumberingCounter] = []

        counters.enumerated().forEach { (index, counter) in
            let character = text[text.index(text.startIndex, offsetBy: index)]

            if character == "," {
                numberIndex += 1
            }

            if index < numberCount {
                counter.frame = CGRect(x: rects[index].minX,
                                       y: 0,
                                       width: rects[index].width,
                                       height: bounds.height).insetBy(dx: -3, dy: 0)
                counter.setValue(Int(String(character)), direction: .descending, animated: true)
                remainingCounters.append(counter)
            } else {
                counter.setValue(nil, direction: .ascending, animated: true) {
                    counter.removeFromSuperview()
                }
            }

            numberIndex += 1
        }

        self.counters = remainingCounters
    }

    var characterRects: [CGRect] {
        guard let attributedText = self.attributedText, !attributedText.string.isEmpty else { return [] }

        let string = attributedText.string
        let count = string.count
        let range = CFRange(location: 0, length: count)

        var characters = [UniChar](repeating: 0, count: count)
        CFStringGetCharacters(string as CFString, range, &characters)

        let font = CTFontCreateWithName(self.font!.fontName as CFString, self.font!.pointSize, nil)
        var glyphs = [CGGlyph](repeating: 0, count: count)
        CTFontGetGlyphsForCharacters(font, &characters, &glyphs, count)

        var characterRects = [CGRect](repeating: .zero, count: count)
        CTFontGetBoundingRectsForGlyphs(font, .default, &glyphs, &characterRects, count)

        let framesetter = CTFramesetterCreateWithAttributedString(attributedText)
        let size = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, range, nil, UILayoutFittingExpandedSize, nil)

        let path = CGPath(rect: CGRect(origin: .zero, size: size), transform: nil)
        let frame = CTFramesetterCreateFrame(framesetter, range, path, nil)

        let lines = CTFrameGetLines(frame) as! [CTLine]

        guard !lines.isEmpty else { return [] }

        let line = lines.first!
        var lineOrigins = [CGPoint](repeating: .zero, count: count)
        CTFrameGetLineOrigins(frame, CFRange(location: 0, length: 0), &lineOrigins)

        let lineRange = CTLineGetStringRange(line)
        let startIndex = lineRange.location
        let endIndex = startIndex + lineRange.length

        (startIndex ..< endIndex).forEach { index in
            let startOffset = CTLineGetOffsetForStringIndex(line, index, nil)

            var rect = characterRects[index]
            rect.origin.x += startOffset
            rect.origin.y += lineOrigins[0].y

            characterRects[index] = CGRect(x: rect.minX,
                                           y: bounds.height - rect.minY - rect.height,
                                           width: rect.width,
                                           height: rect.height)
        }

        return characterRects
    }

}
