//
//  RecommandationViewController.swift
//  recommendation app
//
//  Created by 杨振誉 on 2021/11/16.
//

import UIKit

let mainStoryboard = UIStoryboard(name: "Main", bundle: .main)

class RecommandationViewController: UIViewController {
    
    private let luckynumber : [surveyquestion] = [
        surveyquestion(question: "which number do you like?", responsekind: .type2, options: ["1", "2", "3", "4" ]
                              ),
        surveyquestion(question: "Do you like even or odd numbers?", responsekind: .type1, options: ["even", "odd", ]
                      ),
        surveyquestion(question: "Do you like double digit numbers?", responsekind: .type1, options: ["yes", "no", ]
                      ),
        
    ]

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print("hello")
//    }

    @IBAction func buttontapped(_ sender: Any) {
        let recommandation = currentrecommandation(questions: self.luckynumber)
        if let nextquestion = recommandation.getnextquestion(){
            switch nextquestion.responsekind {
            case .type1:
                if let viewcontroller = mainStoryboard.instantiateViewController(withIdentifier: "type1identifier") as? questiontype1{
                    viewcontroller.currentquestion = nextquestion
                    viewcontroller.currentrecommandation = recommandation
                    self.navigationController?.show(viewcontroller, sender: self)
                    
                }
            case .type2:
                if let viewcontroller = mainStoryboard.instantiateViewController(withIdentifier: "type2identifier") as? questiontype2{
                    viewcontroller.currentquestion = nextquestion
                    viewcontroller.currentrecommandation = recommandation
                    self.navigationController?.show(viewcontroller, sender: self)
                    
                }
            }
        }
    }
    
}

class currentrecommandation{
    let questions : [surveyquestion]
    var responses : [[String]] = []
    
    private var currentquestions : [surveyquestion]
    
    init(questions : [surveyquestion]){
        self.questions = questions
        self.currentquestions = questions
    }
    
    var hasnextquestion :   Bool {
        !self.currentquestions.isEmpty
    }
    
    func getnextquestion() -> surveyquestion?{
        if self.hasnextquestion{
            return self.currentquestions.removeFirst()
            
        }else{
            return nil
        }
    }
    func adduserresponse(_ response: [String]){
        self.responses.append(response)
    }
}

struct surveyquestion{
    var question : String
    var responsekind : surveyresponsekind
    var options : [String]
}
enum surveyresponsekind{
    case type1
    case type2
}


