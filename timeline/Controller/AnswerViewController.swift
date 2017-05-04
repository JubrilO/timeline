//
//  AnswerViewController.swift
//  timeline
//
//  Created by Jubril Olambiwonnu on 12/03/2017.
//  Copyright © 2017 Jubril Olambiwonnu. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var numberOfSkipsLabel: UILabel!
    @IBOutlet weak var optionsTableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var currentScoreLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    var question: Question?
    var options: [Option]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetLabel.text = question?.body
        dateLabel.text = question?.date
        options = question?.options
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tweetLabel.alpha = 0
        dateLabel.alpha = 0
        topConstraint.constant += 40
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.4, animations: {
            self.topConstraint.constant -= 40
            self.tweetLabel.alpha = 1
            self.dateLabel.alpha = 1
            self.view.layoutIfNeeded()
        }, completion: {
            _ in
            let delay = Double((self.tweetLabel.text?.characters.count)!) / 140.0 * 3.0
            delayWithSeconds(delay){
                self.topConstraint.constant = 45 + 40
                self.tweetLabel.font = tweetFontSmall!
                self.tweetLabel.alpha = 0.3
                self.view.layoutIfNeeded()
                self.topConstraint.constant = 45
                UIView.animate(withDuration: 0.3, animations:{
                    self.tweetLabel.alpha = 0.8
                    self.logoLabel.alpha = 0
                    self.view.layoutIfNeeded()
                }, completion: { _ in
                    self.tableView.reloadData()
                    self.tableView.isHidden = false
                    self.numberOfSkipsLabel.isHidden = false
                    self.skipButton.isHidden = false

                })
            }
        })
    }
    
    @IBAction func onSkipButtonClick(_ sender: UIButton) {
    }
}

extension AnswerViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell") as! AnswerTableViewCell
        let option = options?[indexPath.row]
        if let option = option{
            cell.userLabel.text = "@\(option.username!)"
            cell.correct = option.correct
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! AnswerTableViewCell
        if cell.correct!{
            cell.backgroundOverlay.backgroundColor = ColorPalette.wrongAnswerColor
            cell.userLabel.textColor = UIColor.white
        }
        else{
            cell.backgroundOverlay.backgroundColor = ColorPalette.correctAnswerColor
            cell.userLabel.textColor = UIColor.white
        }
        tableView.visibleCells.forEach{
            visibleCell in
            if visibleCell != cell{
                visibleCell.contentView.alpha = 0.15
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let options = options{
            return options.count
        }
        else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        OptionAnimator.animate(cell: cell, indexPath: indexPath)
    }
    
    
    
}
