//
//  Color.swift
//  Trust
//
//  Created by YoonBong Kim on 28/02/2018.
//  Copyright © 2018 viva.republica. All rights reserved.
//

import UIKit

extension UIColor {
    /// Color Opacity의 사용은 Black Opacity의 수치와 같은 수치를 사용한다.
    public struct Opacity: RawRepresentable, Equatable, Hashable {
        
        public typealias RawValue = CGFloat
        
        public var rawValue: CGFloat
        
        public init(rawValue: CGFloat) {
            self.rawValue = rawValue
        }
        
        public var hashValue: Int {
            return rawValue.hashValue
        }
    }
    
    /**
     Palette에 정의된 색상에 Opacity를 적용함.
     - parameters:
         - opacity: Black Opacity에 정의된 tone을 따라 정의한 투명도.
     */
    public func withOpacity(_ opacity: Opacity) -> UIColor {
        return withAlphaComponent(opacity.rawValue / 100.0)
    }
    
    /**
     Palette에 정의된 색상위에 다른 투명한 색상을 Overlay함.
     - parameters:
        - color: 현재 색상 위에 Overlay할 색. 주로 Black / White Opacity를 Overlay함.
     */
    public func withOverlay(_ color: UIColor) -> UIColor {
        var bgR: CGFloat = 0; var bgG: CGFloat = 0; var bgB: CGFloat = 0; var bgA: CGFloat = 0
        var fgR: CGFloat = 0; var fgG: CGFloat = 0; var fgB: CGFloat = 0; var fgA: CGFloat = 0
        
        self.getRed(&bgR, green: &bgG, blue: &bgB, alpha: &bgA)
        color.getRed(&fgR, green: &fgG, blue: &fgB, alpha: &fgA)
        
        let red = fgA * fgR + (1 - fgA) * bgR
        let green = fgA * fgG + (1 - fgA) * bgG
        let blue = fgA * fgB + (1 - fgA) * bgB
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

extension UIColor.Opacity {
    /// 3% / #05
    public static let tone50: UIColor.Opacity = .init(rawValue: 3)
    
    /// 4% / #0A
    public static let tone100: UIColor.Opacity = .init(rawValue: 4)
    
    /// 7% / #12
    public static let tone200: UIColor.Opacity = .init(rawValue: 7)
    
    /// 12% / #1F
    public static let tone300: UIColor.Opacity = .init(rawValue: 12)
    
    /// 26% / #42
    public static let tone400: UIColor.Opacity = .init(rawValue: 26)
    
    /// 38% / #61
    public static let tone500: UIColor.Opacity = .init(rawValue: 38)
    
    /// 54% / #8A
    public static let tone600: UIColor.Opacity = .init(rawValue: 54)
    
    /// 62% / #9E
    public static let tone700: UIColor.Opacity = .init(rawValue: 62)
    
    /// 74% / #BD
    public static let tone800: UIColor.Opacity = .init(rawValue: 74)
    
    /// 87% / #DE
    public static let tone900: UIColor.Opacity = .init(rawValue: 87)
}

extension UIColor {
    /// #F7F8FA, (R: 247.0, G: 248.0, B: 250.0, A: 1.0)
    public static let tossElephant50 = UIColor(
        red: 247.0 / 255.0, green: 248.0 / 255.0, blue: 250.0 / 255.0, alpha: 1.0
    )
    /// #F0F2F5, (R: 240.0, G: 242.0, B: 245.0, A: 1.0)
    public static let tossElephant100 = UIColor(
        red: 240.0 / 255.0, green: 242.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0
    )
    /// #E4E6EB, (R: 228.0, G: 230.0, B: 235.0, A: 1.0)
    public static let tossElephant200 = UIColor(
        red: 228.0 / 255.0, green: 230.0 / 255.0, blue: 235.0 / 255.0, alpha: 1.0
    )
    /// #D3D7DE, (R: 211.0, G: 215.0, B: 222.0, A: 1.0)
    public static let tossElephant300 = UIColor(
        red: 211.0 / 255.0, green: 215.0 / 255.0, blue: 222.0 / 255.0, alpha: 1.0
    )
    /// #A2ABBA, (R: 162.0, G: 171.0, B: 186.0, A: 1.0)
    public static let tossElephant400 = UIColor(
        red: 162.0 / 255.0, green: 171.0 / 255.0, blue: 186.0 / 255.0, alpha: 1.0
    )
    /// #768399, (R: 118.0, G: 131.0, B: 153.0, A: 1.0)
    public static let tossElephant500 = UIColor(
        red: 118.0 / 255.0, green: 131.0 / 255.0, blue: 153.0 / 255.0, alpha: 1.0
    )
    /// #4D5D75, (R:  77.0, G:  93.0, B: 117.0, A: 1.0)
    public static let tossElephant600 = UIColor(
        red: 77.0 / 255.0, green: 93.0 / 255.0, blue: 117.0 / 255.0, alpha: 1.0
    )
    /// #3A4961, (R:  58.0, G:  73.0, B:  97.0, A: 1.0)
    public static let tossElephant700 = UIColor(
        red: 58.0 / 255.0, green: 73.0 / 255.0, blue: 97.0 / 255.0, alpha: 1.0
    )
    /// #283447, (R:  40.0, G:  52.0, B:  71.0, A: 1.0)
    public static let tossElephant800 = UIColor(
        red: 40.0 / 255.0, green: 52.0 / 255.0, blue: 71.0 / 255.0, alpha: 1.0
    )
    /// #1C232E, (R:  28.0, G:  35.0, B:  46.0, A: 1.0)
    public static let tossElephant900 = UIColor(
        red: 28.0 / 255.0, green: 35.0 / 255.0, blue: 46.0 / 255.0, alpha: 1.0
    )
    
    /// #FAFAFA, (R: 250.0, G: 250.0, B: 250.0, A: 1.0)
    public static let tossGray50 = UIColor(
        white: 250.0 / 255.0, alpha: 1.0
    )
    /// #F2F2F5, (R: 242.0, G: 242.0, B: 245.0, A: 1.0)
    public static let tossGray100 = UIColor(
        red: 242.0 / 255.0, green: 242.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0
    )
    /// #EBEBED, (R: 235.0, G: 235.0, B: 237.0, A: 1.0)
    public static let tossGray200 = UIColor(
        red: 235.0 / 255.0, green: 235.0 / 255.0, blue: 237.0 / 255.0, alpha: 1.0
    )
    /// #DCDCE0, (R: 220.0, G: 220.0, B: 224.0, A: 1.0)
    public static let tossGray300 = UIColor(
        red: 220.0 / 255.0, green: 220.0 / 255.0, blue: 224.0 / 255.0, alpha: 1.0
    )
    /// #B7B7BD, (R: 183.0, G: 183.0, B: 189.0, A: 1.0)
    public static let tossGray400 = UIColor(
        red: 183.0 / 255.0, green: 183.0 / 255.0, blue: 189.0 / 255.0, alpha: 1.0
    )
    /// #95959E, (R: 149.0, G: 149.0, B: 158.0, A: 1.0)
    public static let tossGray500 = UIColor(
        red: 149.0 / 255.0, green: 149.0 / 255.0, blue: 158.0 / 255.0, alpha: 1.0
    )
    /// #6E6E78, (R: 110.0, G: 110.0, B: 120.0, A: 1.0)
    public static let tossGray600 = UIColor(
        red: 110.0 / 255.0, green: 110.0 / 255.0, blue: 120.0 / 255.0, alpha: 1.0
    )
    /// #585861, (R:  88.0, G:  88.0, B:  97.0, A: 1.0)
    public static let tossGray700 = UIColor(
        red: 88.0 / 255.0, green: 88.0 / 255.0, blue: 97.0 / 255.0, alpha: 1.0
    )
    /// #3C3C42, (R:  60.0, G:  60.0, B:  66.0, A: 1.0)
    public static let tossGray800 = UIColor(
        red: 60.0 / 255.0, green: 60.0 / 255.0, blue: 66.0 / 255.0, alpha: 1.0
    )
    /// #1E1E21, (R:  30.0, G:  30.0, B:  33.0, A: 1.0)
    public static let tossGray900 = UIColor(
        red: 30.0 / 255.0, green: 30.0 / 255.0, blue: 33.0 / 255.0, alpha: 1.0
    )
    
    /// #000000, (R:   0.0, G:   0.0, B:   0.0, A: 1.0)
    public static let tossBlack = UIColor(
        white: 0.0, alpha: 1.0
    )
    /// #000000, (R:   0.0, G:   0.0, B:   0.0, A: 0.03)
    public static let tossBlackOpacity50 = UIColor(
        white: 0.0, alpha: 0.03
    )
    /// #000000, (R:   0.0, G:   0.0, B:   0.0, A: 0.04)
    public static let tossBlackOpacity100 = UIColor(
        white: 0.0, alpha: 0.04
    )
    /// #000000, (R:   0.0, G:   0.0, B:   0.0, A: 0.07)
    public static let tossBlackOpacity200 = UIColor(
        white: 0.0, alpha: 0.07
    )
    /// #000000, (R:   0.0, G:   0.0, B:   0.0, A: 0.12)
    public static let tossBlackOpacity300 = UIColor(
        white: 0.0, alpha: 0.12
    )
    /// #000000, (R:   0.0, G:   0.0, B:   0.0, A: 0.26)
    public static let tossBlackOpacity400 = UIColor(
        white: 0.0, alpha: 0.26
    )
    /// #000000, (R:   0.0, G:   0.0, B:   0.0, A: 0.38)
    public static let tossBlackOpacity500 = UIColor(
        white: 0.0, alpha: 0.38
    )
    /// #000000, (R:   0.0, G:   0.0, B:   0.0, A: 0.54)
    public static let tossBlackOpacity600 = UIColor(
        white: 0.0, alpha: 0.54
    )
    /// #000000, (R:   0.0, G:   0.0, B:   0.0, A: 0.62)
    public static let tossBlackOpacity700 = UIColor(
        white: 0.0, alpha: 0.62
    )
    /// #000000, (R:   0.0, G:   0.0, B:   0.0, A: 0.74)
    public static let tossBlackOpacity800 = UIColor(
        white: 0.0, alpha: 0.74
    )
    /// #000000, (R:   0.0, G:   0.0, B:   0.0, A: 0.87)
    public static let tossBlackOpacity900 = UIColor(
        white: 0.0, alpha: 0.87
    )
    
    /// #FFFFFF, (R: 255.0, G: 255.0, B: 255.0, A: 1.0)
    public static let tossWhite = UIColor(
        white: 1.0, alpha: 1.0
    )
    /// #FFFFFF, (R: 255.0, G: 255.0, B: 255.0, A: 0.02)
    public static let tossWhiteOpacity50 = UIColor(
        white: 1.0, alpha: 0.02
    )
    /// #FFFFFF, (R: 255.0, G: 255.0, B: 255.0, A: 0.04)
    public static let tossWhiteOpacity100 = UIColor(
        white: 1.0, alpha: 0.04
    )
    /// #FFFFFF, (R: 255.0, G: 255.0, B: 255.0, A: 0.07)
    public static let tossWhiteOpacity200 = UIColor(
        white: 1.0, alpha: 0.07
    )
    /// #FFFFFF, (R: 255.0, G: 255.0, B: 255.0, A: 0.12)
    public static let tossWhiteOpacity300 = UIColor(
        white: 1.0, alpha: 0.12
    )
    /// #FFFFFF, (R: 255.0, G: 255.0, B: 255.0, A: 0.26)
    public static let tossWhiteOpacity400 = UIColor(
        white: 1.0, alpha: 0.26
    )
    /// #FFFFFF, (R: 255.0, G: 255.0, B: 255.0, A: 0.38)
    public static let tossWhiteOpacity500 = UIColor(
        white: 1.0, alpha: 0.38
    )
    /// #FFFFFF, (R: 255.0, G: 255.0, B: 255.0, A: 0.54)
    public static let tossWhiteOpacity600 = UIColor(
        white: 1.0, alpha: 0.54
    )
    /// #FFFFFF, (R: 255.0, G: 255.0, B: 255.0, A: 0.62)
    public static let tossWhiteOpacity700 = UIColor(
        white: 1.0, alpha: 0.62
    )
    /// #FFFFFF, (R: 255.0, G: 255.0, B: 255.0, A: 0.74)
    public static let tossWhiteOpacity800 = UIColor(
        white: 1.0, alpha: 0.74
    )
    /// #FFFFFF, (R: 255.0, G: 255.0, B: 255.0, A: 0.87)
    public static let tossWhiteOpacity900 = UIColor(
        white: 1.0, alpha: 0.87
    )
    
    /// #3785F7, (R:  55.0, G: 133.0, B: 247.0, A: 1.0)
    public static let tossBlueA100 = UIColor(
        red: 55.0 / 255.0, green: 133.0 / 255.0, blue: 247.0 / 255.0, alpha: 1.0
    )
    /// #0F6AE5, (R:  15.0, G: 106.0, B: 229.0, A: 1.0)
    public static let tossBlueA200 = UIColor(
        red: 15.0 / 255.0, green: 106.0 / 255.0, blue: 229.0 / 255.0, alpha: 1.0
    )
    /// #144BE0, (R:  20.0, G:  75.0, B: 224.0, A: 1.0)
    public static let tossBlueA300 = UIColor(
        red: 20.0 / 255.0, green: 75.0 / 255.0, blue: 224.0 / 255.0, alpha: 1.0
    )
    /// #0034C5, (R:   0.0, G:  52.0, B: 197.0, A: 1.0)
    public static let tossBlueA400 = UIColor(
        red: 0.0, green: 52.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0
    )
    
    /// #EDF3FF, (R: 237.0, G: 243.0, B: 255.0, A: 1.0)
    public static let tossBlue50 = UIColor(
        red: 237.0 / 255.0, green: 243.0 / 255.0, blue: 1.0, alpha: 1.0
    )
    /// #CFDFFF, (R: 207.0, G: 223.0, B: 255.0, A: 1.0)
    public static let tossBlue100 = UIColor(
        red: 207.0 / 255.0, green: 223.0 / 255.0, blue: 1.0, alpha: 1.0
    )
    /// #9EBEFF, (R: 158.0, G: 190.0, B: 255.0, A: 1.0)
    public static let tossBlue200 = UIColor(
        red: 158.0 / 255.0, green: 190.0 / 255.0, blue: 1.0, alpha: 1.0
    )
    /// #6D9EFF, (R: 109.0, G: 158.0, B: 255.0, A: 1.0)
    public static let tossBlue300 = UIColor(
        red: 109.0 / 255.0, green: 158.0 / 255.0, blue: 1.0, alpha: 1.0
    )
    /// #4782F7, (R:  71.0, G: 130.0, B: 247.0, A: 1.0)
    public static let tossBlue400 = UIColor(
        red: 71.0 / 255.0, green: 130.0 / 255.0, blue: 247.0 / 255.0, alpha: 1.0
    )
    /// #3369E8, (R:  51.0, G: 105.0, B: 232.0, A: 1.0)
    public static let tossBlue500 = UIColor(
        red: 51.0 / 255.0, green: 105.0 / 255.0, blue: 232.0 / 255.0, alpha: 1.0
    )
    /// #2D56B9, (R:  45.0, G:  86.0, B: 185.0, A: 1.0)
    @objc public static let tossBlue600 = UIColor(
        red: 45.0 / 255.0, green: 86.0 / 255.0, blue: 185.0 / 255.0, alpha: 1.0
    )
    /// #2E4996, (R:  46.0, G:  73.0, B: 150.0, A: 1.0)
    public static let tossBlue700 = UIColor(
        red: 46.0 / 255.0, green: 73.0 / 255.0, blue: 150.0 / 255.0, alpha: 1.0
    )
    /// #283D77, (R:  40.0, G:  61.0, B: 119.0, A: 1.0)
    public static let tossBlue800 = UIColor(
        red: 40.0 / 255.0, green: 61.0 / 255.0, blue: 119.0 / 255.0, alpha: 1.0
    )
    /// #1F3164, (R:  31.0, G:  49.0, B: 100.0, A: 1.0)
    public static let tossBlue900 = UIColor(
        red: 31.0 / 255.0, green: 49.0 / 255.0, blue: 100.0 / 255.0, alpha: 1.0
    )
    
    /// #FF80AB, (R: 255.0, G: 128.0, B: 171.0, A: 1.0)
    public static let tossPinkA100 = UIColor(
        red: 1.0, green: 128.0 / 255.0, blue: 171.0 / 255.0, alpha: 1.0
    )
    /// #FF4081, (R: 255.0, G:  64.0, B: 129.0, A: 1.0)
    public static let tossPinkA200 = UIColor(
        red: 1.0, green: 64.0 / 255.0, blue: 129.0 / 255.0, alpha: 1.0
    )
    /// #F50057, (R: 245.0, G:   0.0, B:  87.0, A: 1.0)
    public static let tossPinkA300 = UIColor(
        red: 245.0 / 255.0, green: 0.0, blue: 87.0 / 255.0, alpha: 1.0
    )
    /// #FF80AB, (R: 197.0, G:  17.0, B:  98.0, A: 1.0)
    public static let tossPinkA400 = UIColor(
        red: 197.0 / 255.0, green: 17.0 / 255.0, blue: 98.0 / 255.0, alpha: 1.0
    )
    
    /// #FCE4EC, (R: 252.0, G: 228.0, B: 236.0, A: 1.0)
    public static let tossPink50 = UIColor(
        red: 252.0 / 255.0, green: 228.0 / 255.0, blue: 236.0 / 255.0, alpha: 1.0
    )
    /// #F8BBD0, (R: 248.0, G: 187.0, B: 208.0, A: 1.0)
    public static let tossPink100 = UIColor(
        red: 248.0 / 255.0, green: 187.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0
    )
    /// #F48FB1, (R: 244.0, G: 143.0, B: 177.0, A: 1.0)
    public static let tossPink200 = UIColor(
        red: 244.0 / 255.0, green: 143.0 / 255.0, blue: 177.0 / 255.0, alpha: 1.0
    )
    /// #F06292, (R: 240.0, G:  98.0, B: 146.0, A: 1.0)
    public static let tossPink300 = UIColor(
        red: 240.0 / 255.0, green: 98.0 / 255.0, blue: 146.0 / 255.0, alpha: 1.0
    )
    /// #EC407A, (R: 236.0, G:  64.0, B: 122.0, A: 1.0)
    public static let tossPink400 = UIColor(
        red: 236.0 / 255.0, green: 64.0 / 255.0, blue: 122.0 / 255.0, alpha: 1.0
    )
    /// #E91E63, (R: 233.0, G:  30.0, B:  99.0, A: 1.0)
    public static let tossPink500 = UIColor(
        red: 233.0 / 255.0, green: 30.0 / 255.0, blue: 99.0 / 255.0, alpha: 1.0
    )
    /// #D81B60, (R: 216.0, G:  27.0, B:  96.0, A: 1.0)
    public static let tossPink600 = UIColor(
        red: 216.0 / 255.0, green: 27.0 / 255.0, blue: 96.0 / 255.0, alpha: 1.0
    )
    /// #C2185B, (R: 194.0, G:  24.0, B:  91.0, A: 1.0)
    public static let tossPink700 = UIColor(
        red: 194.0 / 255.0, green: 24.0 / 255.0, blue: 91.0 / 255.0, alpha: 1.0
    )
    /// #AD1457, (R: 173.0, G:  20.0, B:  87.0, A: 1.0)
    public static let tossPink800 = UIColor(
        red: 173.0 / 255.0, green: 20.0 / 255.0, blue: 87.0 / 255.0, alpha: 1.0
    )
    /// #880E4F, (R: 136.0, G:  14.0, B:  79.0, A: 1.0)
    public static let tossPink900 = UIColor(
        red: 136.0 / 255.0, green: 14.0 / 255.0, blue: 79.0 / 255.0, alpha: 1.0
    )
    
    /// #FFD180, (R: 255.0, G: 209.0, B: 128.0, A: 1.0)
    public static let tossOrangeA100 = UIColor(
        red: 1.0, green: 209.0 / 255.0, blue: 128.0 / 255.0, alpha: 1.0
    )
    /// #FFAB40, (R: 255.0, G: 171.0, B:  64.0, A: 1.0)
    public static let tossOrangeA200 = UIColor(
        red: 1.0, green: 171.0 / 255.0, blue: 64.0 / 255.0, alpha: 1.0
    )
    /// #FF9100, (R: 255.0, G: 145.0, B:   0.0, A: 1.0)
    public static let tossOrangeA300 = UIColor(
        red: 1.0, green: 145.0 / 255.0, blue: 0.0, alpha: 1.0
    )
    /// #FF6D00, (R: 255.0, G: 109.0, B:   0.0, A: 1.0)
    public static let tossOrangeA400 = UIColor(
        red: 1.0, green: 109.0 / 255.0, blue: 0.0, alpha: 1.0
    )
    
    /// #FFF3E0, (R: 255.0, G: 243.0, B: 224.0, A: 1.0)
    public static let tossOrange50 = UIColor(
        red: 1.0, green: 243.0 / 255.0, blue: 224.0 / 255.0, alpha: 1.0
    )
    /// #FFE0B2, (R: 255.0, G: 224.0, B: 178.0, A: 1.0)
    public static let tossOrange100 = UIColor(
        red: 1.0, green: 224.0 / 255.0, blue: 178.0 / 255.0, alpha: 1.0
    )
    /// #FFCC80, (R: 255.0, G: 204.0, B: 128.0, A: 1.0)
    public static let tossOrange200 = UIColor(
        red: 1.0, green: 204.0 / 255.0, blue: 128.0 / 255.0, alpha: 1.0
    )
    /// #FFB74D, (R: 255.0, G: 183.0, B:  77.0, A: 1.0)
    public static let tossOrange300 = UIColor(
        red: 1.0, green: 183.0 / 255.0, blue: 77.0 / 255.0, alpha: 1.0
    )
    /// #FFA726, (R: 255.0, G: 167.0, B:  38.0, A: 1.0)
    public static let tossOrange400 = UIColor(
        red: 1.0, green: 167.0 / 255.0, blue: 38.0 / 255.0, alpha: 1.0
    )
    /// #FF9800, (R: 255.0, G: 152.0, B:   0.0, A: 1.0)
    public static let tossOrange500 = UIColor(
        red: 1.0, green: 152.0 / 255.0, blue: 0.0, alpha: 1.0
    )
    /// #FB8C00, (R: 251.0, G: 140.0, B:   0.0, A: 1.0)
    public static let tossOrange600 = UIColor(
        red: 251.0 / 255.0, green: 140.0 / 255.0, blue: 0.0, alpha: 1.0
    )
    /// #F57C00, (R: 245.0, G: 124.0, B:   0.0, A: 1.0)
    public static let tossOrange700 = UIColor(
        red: 245.0 / 255.0, green: 124.0 / 255.0, blue: 0.0, alpha: 1.0
    )
    /// #EF6C00, (R: 239.0, G: 108.0, B:   0.0, A: 1.0)
    public static let tossOrange800 = UIColor(
        red: 239.0 / 255.0, green: 108.0 / 255.0, blue: 0.0, alpha: 1.0
    )
    /// #E65100, (R: 230.0, G:  81.0, B:   0.0, A: 1.0)
    public static let tossOrange900 = UIColor(
        red: 230.0 / 255.0, green: 81.0 / 255.0, blue: 0.0, alpha: 1.0
    )
    
    /// #FFFF8D, (R: 255.0, G: 255.0, B: 141.0, A: 1.0)
    public static let tossYellowA100 = UIColor(
        red: 1.0, green: 1.0, blue: 141.0 / 255.0, alpha: 1.0
    )
    /// #FFFF00, (R: 255.0, G: 255.0, B:   0.0, A: 1.0)
    public static let tossYellowA200 = UIColor(
        red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0
    )
    /// #FFEA00, (R: 255.0, G: 234.0, B:   0.0, A: 1.0)
    public static let tossYellowA300 = UIColor(
        red: 1.0, green: 234.0 / 255.0, blue: 0.0, alpha: 1.0
    )
    /// #0034C5, (R: 255.0, G: 214.0, B:   0.0, A: 1.0)
    public static let tossYellowA400 = UIColor(
        red: 1.0, green: 214.0 / 255.0, blue: 0.0, alpha: 1.0
    )
    
    /// #FFFDE7, (R: 255.0, G: 253.0, B: 231.0, A: 1.0)
    public static let tossYellow50 = UIColor(
        red: 1.0, green: 253.0 / 255.0, blue: 231.0 / 255.0, alpha: 1.0
    )
    /// #FFF9C4, (R: 255.0, G: 249.0, B: 196.0, A: 1.0)
    public static let tossYellow100 = UIColor(
        red: 1.0, green: 249.0 / 255.0, blue: 196.0 / 255.0, alpha: 1.0
    )
    /// #FFF59D, (R: 255.0, G: 245.0, B: 157.0, A: 1.0)
    public static let tossYellow200 = UIColor(
        red: 1.0, green: 245.0 / 255.0, blue: 157.0 / 255.0, alpha: 1.0
    )
    /// #FFF176, (R: 255.0, G: 241.0, B: 118.0, A: 1.0)
    public static let tossYellow300 = UIColor(
        red: 1.0, green: 241.0 / 255.0, blue: 118.0 / 255.0, alpha: 1.0
    )
    /// #FFEE58, (R: 255.0, G: 238.0, B:  88.0, A: 1.0)
    public static let tossYellow400 = UIColor(
        red: 1.0, green: 238.0 / 255.0, blue: 88.0 / 255.0, alpha: 1.0
    )
    /// #FFEB3B, (R: 255.0, G: 235.0, B:  59.0, A: 1.0)
    public static let tossYellow500 = UIColor(
        red: 1.0, green: 235.0 / 255.0, blue: 59.0 / 255.0, alpha: 1.0
    )
    /// #FDD835, (R: 253.0, G: 216.0, B:  53.0, A: 1.0)
    public static let tossYellow600 = UIColor(
        red: 253.0 / 255.0, green: 216.0 / 255.0, blue: 53.0 / 255.0, alpha: 1.0
    )
    /// #FBC02D, (R: 251.0, G: 192.0, B:  45.0, A: 1.0)
    public static let tossYellow700 = UIColor(
        red: 251.0 / 255.0, green: 192.0 / 255.0, blue: 45.0 / 255.0, alpha: 1.0
    )
    /// #F9A825, (R: 249.0, G: 168.0, B:  37.0, A: 1.0)
    public static let tossYellow800 = UIColor(
        red: 249.0 / 255.0, green: 168.0 / 255.0, blue: 37.0 / 255.0, alpha: 1.0
    )
    /// #F57F17, (R: 245.0, G: 127.0, B:  23.0, A: 1.0)
    public static let tossYellow900 = UIColor(
        red: 245.0 / 255.0, green: 127.0 / 255.0, blue: 23.0 / 255.0, alpha: 1.0
    )
    
    /// #A7FFEB, (R: 167.0, G: 255.0, B: 235.0, A: 1.0)
    public static let tossTealA100 = UIColor(
        red: 167.0 / 255.0, green: 1.0, blue: 235.0 / 255.0, alpha: 1.0
    )
    /// #64FFDA, (R: 100.0, G: 255.0, B: 218.0, A: 1.0)
    public static let tossTealA200 = UIColor(
        red: 100.0 / 255.0, green: 1.0, blue: 218.0 / 255.0, alpha: 1.0
    )
    /// #1DE9B6, (R:  29.0, G: 233.0, B: 182.0, A: 1.0)
    public static let tossTealA300 = UIColor(
        red: 29.0 / 255.0, green: 233.0 / 255.0, blue: 182.0 / 255.0, alpha: 1.0
    )
    /// #00BFA5, (R:   0.0, G: 191.0, B: 165.0, A: 1.0)
    public static let tossTealA400 = UIColor(
        red: 0.0, green: 191.0 / 255.0, blue: 165.0 / 255.0, alpha: 1.0
    )
    
    /// #E1F0F2, (R: 225.0, G: 240.0, B: 242.0, A: 1.0)
    public static let tossTeal50 = UIColor(
        red: 225.0 / 255.0, green: 240.0 / 255.0, blue: 242.0 / 255.0, alpha: 1.0
    )
    /// #B1DADE, (R: 177.0, G: 218.0, B: 222.0, A: 1.0)
    public static let tossTeal100 = UIColor(
        red: 177.0 / 255.0, green: 218.0 / 255.0, blue: 222.0 / 255.0, alpha: 1.0
    )
    /// #81C7CC, (R: 129.0, G: 199.0, B: 204.0, A: 1.0)
    public static let tossTeal200 = UIColor(
        red: 129.0 / 255.0, green: 199.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0
    )
    /// #4CAEB5, (R:  76.0, G: 174.0, B: 181.0, A: 1.0)
    public static let tossTeal300 = UIColor(
        red: 76.0 / 255.0, green: 174.0 / 255.0, blue: 181.0 / 255.0, alpha: 1.0
    )
    /// #269DA6, (R:  38.0, G: 157.0, B: 166.0, A: 1.0)
    public static let tossTeal400 = UIColor(
        red: 38.0 / 255.0, green: 157.0 / 255.0, blue: 166.0 / 255.0, alpha: 1.0
    )
    /// #008C96, (R:   0.0, G: 140.0, B: 150.0, A: 1.0)
    public static let tossTeal500 = UIColor(
        red: 0.0, green: 140.0 / 255.0, blue: 150.0 / 255.0, alpha: 1.0
    )
    /// #00818A, (R:   0.0, G: 129.0, B: 138.0, A: 1.0)
    public static let tossTeal600 = UIColor(
        red: 0.0, green: 129.0 / 255.0, blue: 138.0 / 255.0, alpha: 1.0
    )
    /// #007278, (R:   0.0, G: 114.0, B: 120.0, A: 1.0)
    public static let tossTeal700 = UIColor(
        red: 0.0, green: 114.0 / 255.0, blue: 120.0 / 255.0, alpha: 1.0
    )
    /// #006369, (R:   0.0, G:  99.0, B: 105.0, A: 1.0)
    public static let tossTeal800 = UIColor(
        red: 0.0, green: 99.0 / 255.0, blue: 105.0 / 255.0, alpha: 1.0
    )
    /// #004D4D, (R:   0.0, G:  77.0, B:  77.0, A: 1.0)
    public static let tossTeal900 = UIColor(
        red: 0.0, green: 77.0 / 255.0, blue: 77.0 / 255.0, alpha: 1.0
    )
    
    /// #B388FF, (R: 179.0, G: 136.0, B: 255.0, A: 1.0)
    public static let tossDeepPurpleA100 = UIColor(
        red: 179.0 / 255.0, green: 136.0 / 255.0, blue: 1.0, alpha: 1.0
    )
    /// #7C4DFF, (R: 124.0, G:  77.0, B: 255.0, A: 1.0)
    public static let tossDeepPurpleA200 = UIColor(
        red: 124.0 / 255.0, green: 77.0 / 255.0, blue: 1.0, alpha: 1.0
    )
    /// #651FFF, (R: 101.0, G:  31.0, B: 255.0, A: 1.0)
    public static let tossDeepPurpleA300 = UIColor(
        red: 101.0 / 255.0, green: 31.0 / 255.0, blue: 1.0, alpha: 1.0
    )
    /// #6200EA, (R:  98.0, G:   0.0, B: 234.0, A: 1.0)
    public static let tossDeepPurpleA400 = UIColor(
        red: 98.0 / 255.0, green: 0.0, blue: 234.0 / 255.0, alpha: 1.0
    )
    
    /// #EDE7F6, (R: 237.0, G: 231.0, B: 246.0, A: 1.0)
    public static let tossDeepPurple50 = UIColor(
        red: 237.0 / 255.0, green: 231.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0
    )
    /// #D1C4E9, (R: 209.0, G: 196.0, B: 233.0, A: 1.0)
    public static let tossDeepPurple100 = UIColor(
        red: 209.0 / 255.0, green: 196.0 / 255.0, blue: 233.0 / 255.0, alpha: 1.0
    )
    /// #B39DDB, (R: 179.0, G: 157.0, B: 219.0, A: 1.0)
    public static let tossDeepPurple200 = UIColor(
        red: 179.0 / 255.0, green: 157.0 / 255.0, blue: 219.0 / 255.0, alpha: 1.0
    )
    /// #9575CD, (R: 149.0, G: 117.0, B: 205.0, A: 1.0)
    public static let tossDeepPurple300 = UIColor(
        red: 149.0 / 255.0, green: 117.0 / 255.0, blue: 205.0 / 255.0, alpha: 1.0
    )
    /// #7E57C2, (R: 126.0, G:  87.0, B: 194.0, A: 1.0)
    public static let tossDeepPurple400 = UIColor(
        red: 126.0 / 255.0, green: 87.0 / 255.0, blue: 194.0 / 255.0, alpha: 1.0
    )
    /// #673AB7, (R: 103.0, G:  58.0, B: 183.0, A: 1.0)
    public static let tossDeepPurple500 = UIColor(
        red: 103.0 / 255.0, green: 58.0 / 255.0, blue: 183.0 / 255.0, alpha: 1.0
    )
    /// #5E35B1, (R:  94.0, G:  53.0, B: 177.0, A: 1.0)
    public static let tossDeepPurple600 = UIColor(
        red: 94.0 / 255.0, green: 53.0 / 255.0, blue: 177.0 / 255.0, alpha: 1.0
    )
    /// #512DA8, (R:  81.0, G:  45.0, B: 168.0, A: 1.0)
    public static let tossDeepPurple700 = UIColor(
        red: 81.0 / 255.0, green: 45.0 / 255.0, blue: 168.0 / 255.0, alpha: 1.0
    )
    /// #4527A0, (R:  69.0, G:  39.0, B: 160.0, A: 1.0)
    public static let tossDeepPurple800 = UIColor(
        red: 69.0 / 255.0, green: 39.0 / 255.0, blue: 160.0 / 255.0, alpha: 1.0
    )
    /// #311B92, (R:  49.0, G:  27.0, B: 146.0, A: 1.0)
    public static let tossDeepPurple900 = UIColor(
        red: 49.0 / 255.0, green: 27.0 / 255.0, blue: 146.0 / 255.0, alpha: 1.0
    )
    
    /// #EA80FC, (R:  49.0, G:  27.0, B: 146.0, A: 1.0)
    public static let tossPurpleA100 = UIColor(
        red: 234.0 / 255.0, green: 128.0 / 255.0, blue: 252.0 / 255.0, alpha: 1.0
    )
    /// #E040FB, (R: 224.0, G:  64.0, B: 251.0, A: 1.0)
    public static let tossPurpleA200 = UIColor(
        red: 224.0 / 255.0, green: 64.0 / 255.0, blue: 251.0 / 255.0, alpha: 1.0
    )
    /// #D500F9, (R: 213.0, G:   0.0, B: 249.0, A: 1.0)
    public static let tossPurpleA300 = UIColor(
        red: 213.0 / 255.0, green: 0.0, blue: 249.0 / 255.0, alpha: 1.0
    )
    /// #AA00FF, (R: 170.0, G:   0.0, B: 255.0, A: 1.0)
    public static let tossPurpleA400 = UIColor(
        red: 170.0 / 255.0, green: 0.0, blue: 1.0, alpha: 1.0
    )
    
    /// #F3E5F5, (R: 243.0, G: 229.0, B: 245.0, A: 1.0)
    public static let tossPurple50 = UIColor(
        red: 243.0 / 255.0, green: 229.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0
    )
    /// #E1BEE7, (R: 243.0, G: 229.0, B: 245.0, A: 1.0)
    public static let tossPurple100 = UIColor(
        red: 225.0 / 255.0, green: 190.0 / 255.0, blue: 231.0 / 255.0, alpha: 1.0
    )
    /// #CE93D8, (R: 206.0, G: 147.0, B: 216.0, A: 1.0)
    public static let tossPurple200 = UIColor(
        red: 206.0 / 255.0, green: 147.0 / 255.0, blue: 216.0 / 255.0, alpha: 1.0
    )
    /// #BA68C8, (R: 186.0, G: 104.0, B: 200.0, A: 1.0)
    public static let tossPurple300 = UIColor(
        red: 186.0 / 255.0, green: 104.0 / 255.0, blue: 200.0 / 255.0, alpha: 1.0
    )
    /// #AB47BC, (R: 171.0, G:  71.0, B: 188.0, A: 1.0)
    public static let tossPurple400 = UIColor(
        red: 171.0 / 255.0, green: 71.0 / 255.0, blue: 188.0 / 255.0, alpha: 1.0
    )
    /// #9C27B0, (R: 156.0, G:  39.0, B: 176.0, A: 1.0)
    public static let tossPurple500 = UIColor(
        red: 156.0 / 255.0, green: 39.0 / 255.0, blue: 176.0 / 255.0, alpha: 1.0
    )
    /// #8E24AA, (R: 156.0, G:  39.0, B: 176.0, A: 1.0)
    public static let tossPurple600 = UIColor(
        red: 142.0 / 255.0, green: 36.0 / 255.0, blue: 170.0 / 255.0, alpha: 1.0
    )
    /// #7B1FA2, (R: 123.0, G:  31.0, B: 162.0, A: 1.0)
    public static let tossPurple700 = UIColor(
        red: 123.0 / 255.0, green: 31.0 / 255.0, blue: 162.0 / 255.0, alpha: 1.0
    )
    /// #6A1B9A, (R: 106.0, G:  27.0, B: 154.0, A: 1.0)
    public static let tossPurple800 = UIColor(
        red: 106.0 / 255.0, green: 27.0 / 255.0, blue: 154.0 / 255.0, alpha: 1.0
    )
    /// #4A148C, (R:  74.0, G:  20.0, B: 140.0, A: 1.0)
    public static let tossPurple900 = UIColor(
        red: 74.0 / 255.0, green: 20.0 / 255.0, blue: 140.0 / 255.0, alpha: 1.0
    )
    
    /// #B9F6CA, (R: 185.0, G: 246.0, B: 202.0, A: 1.0)
    public static let tossGreenA100 = UIColor(
        red: 185.0 / 255.0, green: 246.0 / 255.0, blue: 202.0 / 255.0, alpha: 1.0
    )
    /// #69F0AE, (R: 105.0, G: 240.0, B: 174.0, A: 1.0)
    public static let tossGreenA200 = UIColor(
        red: 105.0 / 255.0, green: 240.0 / 255.0, blue: 174.0 / 255.0, alpha: 1.0
    )
    /// #00E676, (R:   0.0, G: 230.0, B: 118.0, A: 1.0)
    public static let tossGreenA300 = UIColor(
        red: 0.0, green: 230.0 / 255.0, blue: 118.0 / 255.0, alpha: 1.0
    )
    /// #00C853, (R:   0.0, G: 200.0, B:  83.0, A: 1.0)
    public static let tossGreenA400 = UIColor(
        red: 0.0, green: 200.0 / 255.0, blue: 83.0 / 255.0, alpha: 1.0
    )
    
    /// #E5FFF4, (R: 229.0, G: 255.0, B: 244.0, A: 1.0)
    public static let tossGreen50 = UIColor(
        red: 229.0 / 255.0, green: 1.0, blue: 244.0 / 255.0, alpha: 1.0
    )
    /// #ABF2D4, (R: 171.0, G: 242.0, B: 212.0, A: 1.0)
    public static let tossGreen100 = UIColor(
        red: 171.0 / 255.0, green: 242.0 / 255.0, blue: 212.0 / 255.0, alpha: 1.0
    )
    /// #5AE9AD, (R:  90.0, G: 233.0, B: 173.0, A: 1.0)
    public static let tossGreen200 = UIColor(
        red: 90.0 / 255.0, green: 233.0 / 255.0, blue: 173.0 / 255.0, alpha: 1.0
    )
    /// #1CD98A, (R:  28.0, G: 217.0, B: 138.0, A: 1.0)
    public static let tossGreen300 = UIColor(
        red: 28.0 / 255.0, green: 217.0 / 255.0, blue: 138.0 / 255.0, alpha: 1.0
    )
    /// #05C072, (R:   5.0, G: 192.0, B: 114.0, A: 1.0)
    public static let tossGreen400 = UIColor(
        red: 5.0 / 255.0, green: 192.0 / 255.0, blue: 114.0 / 255.0, alpha: 1.0
    )
    /// #00A661, (R:   0.0, G: 166.0, B:  97.0, A: 1.0)
    public static let tossGreen500 = UIColor(
        red: 0.0, green: 166.0 / 255.0, blue: 97.0 / 255.0, alpha: 1.0
    )
    /// #009959, (R:   0.0, G: 153.0, B:  89.0, A: 1.0)
    public static let tossGreen600 = UIColor(
        red: 0.0, green: 153.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0
    )
    /// #008A50, (R:   0.0, G: 138.0, B:  80.0, A: 1.0)
    public static let tossGreen700 = UIColor(
        red: 0.0, green: 138.0 / 255.0, blue: 80.0 / 255.0, alpha: 1.0
    )
    /// #007544, (R:   0.0, G: 117.0, B:  68.0, A: 1.0)
    public static let tossGreen800 = UIColor(
        red: 0.0, green: 117.0 / 255.0, blue: 68.0 / 255.0, alpha: 1.0
    )
    /// #005C36, (R:   0.0, G:  92.0, B:  54.0, A: 1.0)
    public static let tossGreen900 = UIColor(
        red: 0.0, green: 92.0 / 255.0, blue: 54.0 / 255.0, alpha: 1.0
    )
    
    /// #FF8A80, (R: 255.0, G: 138.0, B: 128.0, A: 1.0)
    public static let tossRedA100 = UIColor(
        red: 1.0, green: 138.0 / 255.0, blue: 128.0 / 255.0, alpha: 1.0
    )
    /// #FF5252, (R: 255.0, G:  82.0, B:  82.0, A: 1.0)
    public static let tossRedA200 = UIColor(
        red: 1.0, green: 82.0 / 255.0, blue: 82.0 / 255.0, alpha: 1.0
    )
    /// #FF1744, (R: 255.0, G:  23.0, B:  68.0, A: 1.0)
    public static let tossRedA300 = UIColor(
        red: 1.0, green: 23.0 / 255.0, blue: 68.0 / 255.0, alpha: 1.0
    )
    /// #D50000, (R: 213.0, G:   0.0, B:   0.0, A: 1.0)
    public static let tossRedA400 = UIColor(
        red: 213.0 / 255.0, green: 0.0, blue: 0.0, alpha: 1.0
    )
    
    /// #FF3BEE, (R: 255.0, G: 235.0, B: 238.0, A: 1.0)
    public static let tossRed50 = UIColor(
        red: 1.0, green: 235.0 / 255.0, blue: 238.0 / 255.0, alpha: 1.0
    )
    /// #FFCDD2, (R: 255.0, G: 205.0, B: 210.0, A: 1.0)
    public static let tossRed100 = UIColor(
        red: 1.0, green: 205.0 / 255.0, blue: 210.0 / 255.0, alpha: 1.0
    )
    /// #EF9A9A, (R: 239.0, G: 154.0, B: 154.0, A: 1.0)
    public static let tossRed200 = UIColor(
        red: 239.0 / 255.0, green: 154.0 / 255.0, blue: 154.0 / 255.0, alpha: 1.0
    )
    /// #E57373, (R: 229.0, G: 115.0, B: 115.0, A: 1.0)
    public static let tossRed300 = UIColor(
        red: 229.0 / 255.0, green: 115.0 / 255.0, blue: 115.0 / 255.0, alpha: 1.0
    )
    /// #EF5350, (R: 239.0, G:  83.0, B:  80.0, A: 1.0)
    public static let tossRed400 = UIColor(
        red: 239.0 / 255.0, green: 83.0 / 255.0, blue: 80.0 / 255.0, alpha: 1.0
    )
    /// #F44336, (R: 244.0, G:  67.0, B:  54.0, A: 1.0)
    public static let tossRed500 = UIColor(
        red: 244.0 / 255.0, green: 67.0 / 255.0, blue: 54.0 / 255.0, alpha: 1.0
    )
    /// #E53935, (R: 229.0, G:  57.0, B:  53.0, A: 1.0)
    public static let tossRed600 = UIColor(
        red: 229.0 / 255.0, green: 57.0 / 255.0, blue: 53.0 / 255.0, alpha: 1.0
    )
    /// #D32F2F, (R: 211.0, G:  47.0, B:  47.0, A: 1.0)
    public static let tossRed700 = UIColor(
        red: 211.0 / 255.0, green: 47.0 / 255.0, blue: 47.0 / 255.0, alpha: 1.0
    )
    /// #C62828, (R: 198.0, G:  40.0, B:  40.0, A: 1.0)
    public static let tossRed800 = UIColor(
        red: 198.0 / 255.0, green: 40.0 / 255.0, blue: 40.0 / 255.0, alpha: 1.0
    )
    /// #B71C1C, (R: 183.0, G:  28.0, B:  28.0, A: 1.0)
    public static let tossRed900 = UIColor(
        red: 183.0 / 255.0, green: 28.0 / 255.0, blue: 28.0 / 255.0, alpha: 1.0
    )
}
// swiftlint:disable:this file_length
