import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        let validator = self.validator()
        var error: NSError?
        let isValid = validator.validateWithError(&error)
        let alertController = self.alertController()
        
        if !isValid {
            alertController.title = "Error"
            alertController.message = error?.localizedDescription
        }

        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    private func validator() -> RegistrationValidator {
        let validator = ValidatorsFactory.sharedInstance.registrationValidator()
        validator.email = emailTextField.text
        validator.phoneNumber = phoneNumberTextField.text
        validator.password = passwordTextField.text
        return validator
    }
    
    private func alertController() -> UIAlertController {
        let alertController = UIAlertController(title: "All fields are valid", message: nil, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(okAction)
        return alertController
    }
}
