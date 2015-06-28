import Foundation

class RegistrationValidator {
    var email: String?
    var phoneNumber: String?
    var password: String?
    
    private let emailValidator: Validator
    private let phoneNumberValidator: Validator
    private let passwordValidator: Validator
    
    init(phoneNumberValidator: Validator, emailValidator: Validator, passwordValidator: Validator) {
        self.emailValidator = emailValidator
        self.phoneNumberValidator = phoneNumberValidator
        self.passwordValidator = passwordValidator
    }
    
    func validateWithError(error: NSErrorPointer?) -> Bool {
        let isEmailValid = emailValidator.validateValue(email, error: error)
        if !isEmailValid {
            return false
        }
    
        let isPhoneNumberValid = phoneNumberValidator.validateValue(phoneNumber, error: error)
        if !isPhoneNumberValid {
            return false
        }
    
        let isPasswordValid = passwordValidator.validateValue(password, error: error)
        if !isPasswordValid {
            return false
        }
        
        return true
    }    
}
