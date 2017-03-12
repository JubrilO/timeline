//
//  AnswerViewController.swift
//  timeline
//
//  Created by Jubril Olambiwonnu on 12/03/2017.
//  Copyright © 2017 Jubril Olambiwonnu. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var numberOfSkipsLabel: UILabel!
    @IBOutlet weak var optionsTableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var currentScoreLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func onSkipButtonClick(_ sender: UIButton) {
    }
}

extension AnswerViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell") as! AnswerTableViewCell
        cell.userLabel.text = "@toketemu"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
}
