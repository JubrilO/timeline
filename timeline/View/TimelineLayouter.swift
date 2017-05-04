//
//  TimelineLayouter.swift
//  timeline
//
//  Created by Jubril Olambiwonnu on 15/03/2017.
//  Copyright © 2017 Jubril Olambiwonnu. All rights reserved.
//

import Foundation
import SCPageViewController

class TimelineLayouter: NSObject, SCPageLayouterProtocol {
    var navigationType: SCPageLayouterNavigationType
    var navigationConstraintType: SCPageLayouterNavigationContraintType
    var numberOfPagesToPreloadAfterCurrentPage: UInt
    var numberOfPagesToPreloadBeforeCurrentPage: UInt
    
     override init() {
        self.navigationType = .horizontal
        self.numberOfPagesToPreloadBeforeCurrentPage = 1;
        self.numberOfPagesToPreloadAfterCurrentPage  = 1;
        self.navigationConstraintType = .forward
    }
    
    func finalFrameForPage(at index: UInt, pageViewController: SCPageViewController!) -> CGRect {
        let frame = pageViewController.view.bounds
        return frame
    }
}
