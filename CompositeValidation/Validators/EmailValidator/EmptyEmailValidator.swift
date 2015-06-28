import Foundation

class EmptyEmailValidator : Validator {
    func validateValue(value: String?, error: NSErrorPointer?) -> Bool {
        if let email = value where email.isEmpty {
            if let error = error {
                error.memory = emptyEmailError()
            }
            return false
        }
        return true
    }
    
    private func emptyEmailError() -> NSError {
        let errorCode = EmailValidatorErrorCode.EmptyEmail
        let errorMessage = NSLocalizedString("Please enter an email address.", comment: "")
        let userInfo = [NSLocalizedDescriptionKey: errorMessage]
        let error = NSError(domain: EmailValidatorErrorDomain, code: errorCode.rawValue, userInfo: userInfo)
        return error
    }
}
