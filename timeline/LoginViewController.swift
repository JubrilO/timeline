//
//  LoginViewController.swift
//  timeline
//
//  Created by Jubril Olambiwonnu on 12/03/2017.
//  Copyright © 2017 Jubril Olambiwonnu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.addTextSpacing(spacing: 1.0)
    }

    @IBAction func onLoginButtonTap(_ sender: UIButton) {
        let webVC = storyboard?.instantiateViewController(withIdentifier: "webVC") as! WebViewController
        self.present(webVC, animated: true, completion: nil)
    }
    
}
