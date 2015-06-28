import Foundation

class EmailFormatValidator : Validator {
    func validateValue(value: String?, error: NSErrorPointer?) -> Bool {
        if isEmailFormatValid(value) {
            return true
        }
        
        if let error = error {
            error.memory = invalidEmailFormatError()
        }
        
        return false
    }
    
    private func isEmailFormatValid(email: String?) -> Bool {
        if let email = email {
            let expression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
            let regex = NSRegularExpression(pattern: expression, options: .CaseInsensitive, error: nil)
            let matches = regex?.matchesInString(email, options: .allZeros, range: NSMakeRange(0, count(email)))
            return matches?.count > 0
        }
        
        return false
    }
    
    private func invalidEmailFormatError() -> NSError {
        let errorCode = EmailValidatorErrorCode.InvalidFormat
        let errorMessage = NSLocalizedString("Please enter a valid email address.", comment: "")
        let userInfo = [NSLocalizedDescriptionKey: errorMessage]
        let error = NSError(domain: EmailValidatorErrorDomain, code: errorCode.rawValue, userInfo: userInfo)        
        return error
    }
}
