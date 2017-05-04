//
//  OptionAnimator.swift
//  timeline
//
//  Created by Jubril Olambiwonnu on 25/03/2017.
//  Copyright © 2017 Jubril Olambiwonnu. All rights reserved.
//

import Foundation
import UIKit

class OptionAnimator{
    class func animate(cell: UITableViewCell, indexPath: IndexPath){
        let view = cell.contentView
        view.transform = CGAffineTransform(translationX: 0, y: 20)
        view.alpha = 0
        let delay = 0.2 * Double(indexPath.row)
        UIView.animateKeyframes(withDuration: 0.2, delay: delay, options: [], animations: {
            view.transform = CGAffineTransform(translationX: 0, y: 0)
            view.alpha = 1
        }, completion: nil)
    }
}
