//
//  Option.swift
//  timeline
//
//  Created by Jubril Olambiwonnu on 13/03/2017.
//  Copyright © 2017 Jubril Olambiwonnu. All rights reserved.
//

import Foundation

class Option {
    var username: String?
    var correct: Bool?
    
    required init?(username: String?, correct: Bool?) {
        self.username = username
        self.correct = correct
    }
    
    convenience init?(json: [String: Any]){
        guard let username = json["username"] as? String,
            let correct = json["correct"] as? Bool
            else{
                return nil
        }
        self.init(username: username, correct: correct)
    }
}
