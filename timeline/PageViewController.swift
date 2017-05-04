//
//  PageViewController.swift
//  timeline
//
//  Created by Jubril Olambiwonnu on 15/03/2017.
//  Copyright © 2017 Jubril Olambiwonnu. All rights reserved.
//

import UIKit
import Alamofire
import SCPageViewController

class PageViewController: UIViewController , SCPageViewControllerDataSource, SCPageViewControllerDelegate {
    
    var pageViewController : SCPageViewController = SCPageViewController()
    var questionViewControllers = [AnswerViewController?]()
    var questions = [Question](){
        didSet{
            createViewControllers()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backgroundBlueColor
        APIManager.sharedManager.getQuestions{
            result in
            if let questions = result.value{
                self.questions = questions
            }
        }
        self.pageViewController.dataSource = self
        self.pageViewController.delegate = self
        self.pageViewController.setLayouter(TimelineLayouter(), animated: false, completion: nil)
        self.addChildViewController(self.pageViewController)
        self.pageViewController.view.frame = self.view.bounds
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMove(toParentViewController: self)

    }
    
    func numberOfPages(in pageViewController: SCPageViewController!) -> UInt {
        return UInt(self.questionViewControllers.count)
    }
    
    func pageViewController(_ pageViewController: SCPageViewController!, viewControllerForPageAt pageIndex: UInt) -> UIViewController! {
        if let questionVC = self.questionViewControllers[Int(pageIndex)]{
            return questionVC
        }
        else{
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "answerVC") as! AnswerViewController
        }
    }

    func createViewControllers(){
        for question in questions{
            let questionVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "answerVC") as! AnswerViewController
            questionVC.question = question
            questionViewControllers.append(questionVC)
        }
        self.pageViewController.reloadData()
    }
}

