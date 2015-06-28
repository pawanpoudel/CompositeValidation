import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
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
    
    private func validator() -> SettingsValidator {
        let validator = ValidatorsFactory.sharedInstance.settingsValidator()
        validator.nickname = nicknameTextField.text
        validator.phoneNumber = phoneNumberTextField.text
        return validator
    }
    
    private func alertController() -> UIAlertController {
        let alertController = UIAlertController(title: "All fields are valid", message: nil, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(okAction)
        return alertController
    }
}
