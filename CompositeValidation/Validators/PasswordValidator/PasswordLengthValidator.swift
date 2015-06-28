import Foundation

class PasswordLengthValidator : Validator {
    func validateValue(value: String?, error: NSErrorPointer?) -> Bool {
        if isPasswordLengthValid(value) {
            return true
        }
        
        if let error = error {
            error.memory = invalidPasswordLengthError()
        }
        
        return false        
    }
    
    private func isPasswordLengthValid(password: String?) -> Bool {
        if let password = password {
            return count(password) >= 6
        }
        
        return false
    }
    
    private func invalidPasswordLengthError() -> NSError {
        let errorCode = PasswordValidatorErrorCode.InvalidLength
        let errorMessage = NSLocalizedString("Password must be at least 6 characters long.", comment: "")
        let userInfo = [NSLocalizedDescriptionKey : errorMessage]
        let error = NSError(domain: PasswordValidatorErrorDomain, code: errorCode.rawValue, userInfo: userInfo)        
        return error
    }
}
