//
//  Constants.swift
//  timeline
//
//  Created by Jubril Olambiwonnu on 12/03/2017.
//  Copyright © 2017 Jubril Olambiwonnu. All rights reserved.
//

import Foundation
import UIKit


let tokenRetrievedNotification = Notification.Name("twitterToken")
let backgroundBlueColor = UIColor(red: 47/255, green: 128/255, blue: 237/255, alpha: 1.0)
let tweetFontSmall = UIFont(name: "HoeflerText-Black", size: 23)


func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        completion()
    }
}

extension UIColor {
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = hexString.substring(from: start)
            
            if hexColor.characters.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}

struct ColorPalette{
    static let wrongAnswerColor = UIColor(hexString: "#F77C7C")
    static let correctAnswerColor = UIColor(hexString: "#6FCF97")
    static let backgroundBlueColor = UIColor(red: 47/255, green: 128/255, blue: 237/255, alpha: 1.0)

}
