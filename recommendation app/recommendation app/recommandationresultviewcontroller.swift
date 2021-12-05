import UIKit
class recommendationresultviewcontroller : UIViewController {
    var recommendation : currentrecommandation!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(recommendation.responses)
    }
}
