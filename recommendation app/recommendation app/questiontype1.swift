import UIKit

class questiontype1: UIViewController{
    var currentrecommandation : currentrecommandation!
    var currentquestion : surveyquestion!
    
    
    @IBOutlet weak var questionlabel: UILabel!
    @IBOutlet weak var firstoptionlabel: UILabel!
    @IBOutlet weak var secondoptionlabel: UILabel!
    @IBOutlet weak var thirdoptionlabel: UILabel!
    @IBOutlet weak var fourthoptionlabel: UILabel!
    @IBOutlet weak var firstoptionswitch: UISwitch!
    @IBOutlet weak var secondoptionswitch: UISwitch!
    @IBOutlet weak var thirdoptionswitch: UISwitch!
    @IBOutlet weak var fourthoptionswitch: UISwitch!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.questionlabel.text = self.currentquestion.question
        switch self.currentquestion.options.count{
        case 1:
            self.firstoptionlabel.text = self.currentquestion.options[0]
            self.secondoptionlabel.isHidden = true
            self.secondoptionswitch.isHidden = true
            self.thirdoptionlabel.isHidden = true
            self.thirdoptionswitch.isHidden = true
            self.fourthoptionlabel.isHidden = true
            self.fourthoptionswitch.isHidden = true
        case 2:
            self.firstoptionlabel.text = self.currentquestion.options[0]
            self.secondoptionlabel.text = self.currentquestion.options[1]
            self.thirdoptionlabel.isHidden = true
            self.thirdoptionswitch.isHidden = true
            self.fourthoptionlabel.isHidden = true
            self.fourthoptionswitch.isHidden = true
        case 3:
            self.firstoptionlabel.text = self.currentquestion.options[0]
            self.secondoptionlabel.text = self.currentquestion.options[1]
            self.thirdoptionlabel.text = self.currentquestion.options[2]
            self.fourthoptionlabel.isHidden = true
            self.fourthoptionswitch.isHidden = true
        default:
            self.firstoptionlabel.text = self.currentquestion.options[0]
            self.secondoptionlabel.text = self.currentquestion.options[1]
            self.thirdoptionlabel.text = self.currentquestion.options[2]
            self.fourthoptionlabel.text = self.currentquestion.options[3]
         
            
            
        }
    }
    
    
    @IBAction func userdidtapnextbutton(_ sender: UIButton) {
        
        var selectedoptions : [String] = []
        if self.firstoptionswitch.isOn{
            selectedoptions.append(self.firstoptionlabel.text ?? "")
        }
        if self.secondoptionswitch.isOn{
            selectedoptions.append(self.secondoptionlabel.text ?? "")
        }
        if self.thirdoptionswitch.isOn{
            selectedoptions.append(self.thirdoptionlabel.text ?? "")
        }
        if self.fourthoptionswitch.isOn{
            selectedoptions.append(self.fourthoptionlabel.text ?? "")
        }
        
        
        self.currentrecommandation.adduserresponse(selectedoptions)
        if let nextquestion = self.currentrecommandation.getnextquestion(){
            switch nextquestion.responsekind {
            case .type1:
                if let viewcontroller = mainStoryboard.instantiateViewController(withIdentifier: "type1identifier") as? questiontype1{
                    viewcontroller.currentquestion = nextquestion
                    viewcontroller.currentrecommandation = self.currentrecommandation
                    self.navigationController?.show(viewcontroller, sender: self)
                    
                }
            case .type2:
                if let viewcontroller = mainStoryboard.instantiateViewController(withIdentifier: "type2identifier") as? questiontype2{
                    viewcontroller.currentquestion = nextquestion
                    viewcontroller.currentrecommandation = self.currentrecommandation
                    self.navigationController?.show(viewcontroller, sender: self)
                    
                }
            }
        }else{
            if let viewcontroller = mainStoryboard.instantiateViewController(withIdentifier: "resultidentifier")as? recommendationresultviewcontroller{
                viewcontroller.recommendation = self.currentrecommandation
                self.navigationController?.show(viewcontroller, sender: self)
            }
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
}
