import UIKit

class questiontype2: UIViewController{
    var currentrecommandation : currentrecommandation!
    var currentquestion : surveyquestion!
    
    @IBOutlet weak var firstbutton: UIButton!
    @IBOutlet weak var secondbutton: UIButton!
    @IBOutlet weak var thirdbutton: UIButton!
    @IBOutlet weak var fourthbutton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        switch self.currentquestion.options.count{
        case 1:
            self.firstbutton.setTitle(self.currentquestion.options[0], for: .normal)
            self.secondbutton.isHidden = true
            self.thirdbutton.isHidden = true
            self.fourthbutton.isHidden = true
        case 2:
            self.firstbutton.setTitle(self.currentquestion.options[0], for: .normal)
            self.secondbutton.setTitle(self.currentquestion.options[1], for: .normal)
            self.thirdbutton.isHidden = true
            self.fourthbutton.isHidden = true
        case 3:
            self.firstbutton.setTitle(self.currentquestion.options[0], for: .normal)
            self.secondbutton.setTitle(self.currentquestion.options[1], for: .normal)
            self.thirdbutton.setTitle(self.currentquestion.options[2], for: .normal)
            self.fourthbutton.isHidden = true
        default:
            self.firstbutton.setTitle(self.currentquestion.options[0], for: .normal)
            self.secondbutton.setTitle(self.currentquestion.options[1], for: .normal)
            self.thirdbutton.setTitle(self.currentquestion.options[2], for: .normal)
            self.fourthbutton.setTitle(self.currentquestion.options[3], for: .normal)

            
            
        }
    }
    
    @IBAction func userdidtapoption(_ sender: UIButton) {
        guard let selectedoption = sender.title(for: .normal) else{
            return
        }
        self.currentrecommandation.adduserresponse([selectedoption])
    
    
}
}
