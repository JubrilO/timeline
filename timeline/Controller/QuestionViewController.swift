//
//  QuestionViewController.swift
//  timeline
//
//  Created by Jubril Olambiwonnu on 12/03/2017.
//  Copyright © 2017 Jubril Olambiwonnu. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var tweetTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tweetDateLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var currentScoreLabel: UILabel!
    var question: Question?

    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.addTextSpacing(spacing: 1.0)
        tweetLabel.alpha = 0
        tweetDateLabel.alpha = 0
        tweetLabel.text = question?.body
        tweetDateLabel.text = question?.date
        UIFont.familyNames.sorted().forEach({print($0)})

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tweetLabel.alpha = 0
        tweetDateLabel.alpha = 0
        tweetTopConstraint.constant += 20
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.4){
            self.tweetTopConstraint.constant -= 20
            self.tweetLabel.alpha = 1
            self.tweetDateLabel.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func onDownButtonClick(_ sender: UIButton) {
        
    }
    
    func setValue(question: String){
        
    }

}
