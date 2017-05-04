//
//  Question.swift
//  timeline
//
//  Created by Jubril Olambiwonnu on 13/03/2017.
//  Copyright © 2017 Jubril Olambiwonnu. All rights reserved.
//

import Foundation


class Question {
    var body: String?
    var options: [Option]?
    var date: String?
    var id: String?
    
    required init?(body: String?, options: [Option]?, date: String?, id: String?) {
        self.body = body
        self.options = options
        self.date = date
        self.id = id
    }
    
    convenience init? (json: [String: Any]){
        guard let body = json["body"] as? String,
            let date = json["date"] as? String,
            let id = json["uid"] as? String,
            let optionsJsonArray = json["options"] as? [[String : Any]]
            else{
                return nil
        }
        var options = [Option]()
        for element in optionsJsonArray{
            if let option = Option(json: element){
                options.append(option)
            }
        }
        self.init(body: body, options: options, date: date, id: id)
    }
    
}
