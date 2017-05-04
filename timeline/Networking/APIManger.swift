//
//  File.swift
//  timeline
//
//  Created by Jubril Olambiwonnu on 12/03/2017.
//  Copyright © 2017 Jubril Olambiwonnu. All rights reserved.
//

import Foundation
import Alamofire
import Locksmith

class APIManager{

    static let sharedManager = APIManager()
    
    func getQuestions(completionHandler: @escaping (Result<[Question]>) -> Void){
        let tokenDict = Locksmith.loadDataForUserAccount(userAccount: "timelineUser")
        let token = tokenDict!["token"] as! String
        let header = ["api-token" : token]
        Alamofire.request(APIConstants.quizURL, headers: header).responseJSON{
            response in
            guard response.result.error == nil else{
                print(response.result.error!)
                completionHandler(.failure(response.result.error!))
                return
            }
            
            guard let json = response.result.value as? [[String: AnyObject]] else {
                print("Did  not get questions JSON from API")
                completionHandler(.failure(BackendError.objectSerialization(reason: "Did not get JSON dictionary response")))
                return
            }
            
            var questions = [Question]()
            for element in json{
                if let question = Question(json: element){
                    questions.append(question)
                }
            }
            completionHandler(.success(questions))
        }
    }
}
