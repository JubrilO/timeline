//
//  WebViewController.swift
//  timeline
//
//  Created by Jubril Olambiwonnu on 12/03/2017.
//  Copyright © 2017 Jubril Olambiwonnu. All rights reserved.
//

import UIKit
import Locksmith
import SafariServices

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nc = NotificationCenter.default
        nc.addObserver(forName: tokenRetrievedNotification, object: nil, queue: nil){
            notification in
            //let questionsVC = self.storyboard?.instantiateViewController(withIdentifier: "questionVC") as! QuestionViewController
            let pageVC = PageViewController()
            self.present(pageVC, animated: true, completion: nil)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        webView.loadRequest(URLRequest(url: URL(string: APIConstants.authURL)!))
    }
    
}
