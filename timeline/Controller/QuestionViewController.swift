//
//  QuestionViewController.swift
//  timeline
//
//  Created by Jubril Olambiwonnu on 12/03/2017.
//  Copyright © 2017 Jubril Olambiwonnu. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tweetDateLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var currentScoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.addTextSpacing(spacing: 1.0)

    }
    
    @IBAction func onDownButtonClick(_ sender: UIButton) {
    }

}
