//
//  LaunchViewController.swift
//  timeline
//
//  Created by Jubril Olambiwonnu on 15/03/2017.
//  Copyright © 2017 Jubril Olambiwonnu. All rights reserved.
//

import UIKit

class LaunchViewController: UIPageViewController {

    @IBOutlet weak var launchLogo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        launchLogo.addTextSpacing(spacing: 1.0)

    }



}
