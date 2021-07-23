//
//  Components.swift
//  Pokemon-Oxxo
//
//  Created by Omar Trujillo on 23/07/21.
//

import UIKit

extension UIColor{
    class func getRandomColor() -> UIColor {
        let randomRed:CGFloat = CGFloat(drand48())
         let randomGreen:CGFloat = CGFloat(drand48())
         let randomBlue:CGFloat = CGFloat(drand48())
         return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
}
