
import UIKit

class ChannelViewController: UIViewController {

    @IBOutlet weak var logginBtn: UIButton!
    
    @IBAction func prepareFOrUnwind(segue : UIStoryboard){
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 90

        
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
   

}
