import Foundation

class EmptyEmailValidator : Validator {
    func validateValue(value: String?, error: NSErrorPointer?) -> Bool {
        if isEmailNotEmpty(value) {
            return true
        }
        
        if let error = error {
            error.memory = emptyEmailError()
        }
        
        return false
    }
    
    private func isEmailNotEmpty(email: String?) -> Bool {
        if let email = email {
            return !email.isEmpty
        }
        
        return false
    }
    
    private func emptyEmailError() -> NSError {
        let errorCode = EmailValidatorErrorCode.EmptyEmail
        let errorMessage = NSLocalizedString("Please enter an email address.", comment: "")
        let userInfo = [NSLocalizedDescriptionKey: errorMessage]
        let error = NSError(domain: EmailValidatorErrorDomain, code: errorCode.rawValue, userInfo: userInfo)
        return error
    }
}
