import UIKit

class RegisterViewController:UIViewController{
    
    static func instantiate()->RegisterViewController{
        return UIStoryboard(name: "Register", bundle: nil)
            .instantiateInitialViewController() as! RegisterViewController
    }
    
    @IBOutlet weak var bnOK: UIButton!{
        didSet{
            bnOK.isEnabled = false
        }
    }
    
    @IBOutlet weak var tfEmail: UITextField!{
        didSet{
            tfEmail.becomeFirstResponder()
        }
    }
    
    @IBAction func onTextFieldChanged(_ sender: UITextField) {
        guard let text = sender.text else {return}
        bnOK.isEnabled = text.isValidEmail()
    }
    
    @IBAction func onButtonOKClicked(_ sender: UIButton) {
        guard let text = tfEmail.text else {return}
        AppDelegate.appdelegate().userStore.setUserEmail(email: text)
        performSegue(withIdentifier: "showEcom", sender: self)
    }
}
