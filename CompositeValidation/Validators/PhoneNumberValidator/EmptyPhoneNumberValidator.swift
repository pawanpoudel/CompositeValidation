import Foundation

class EmptyPhoneNumberValidator : Validator {
    func validateValue(value: String?, error: NSErrorPointer?) -> Bool {
        if isPhoneNumberNotEmpty(value) {
            return true
        }
        
        if let error = error {
            error.memory = emptyPhoneNumberError()
        }
        
        return false
    }
    
    private func isPhoneNumberNotEmpty(phoneNumber: String?) -> Bool {
        if let phoneNumber = phoneNumber {
            return !phoneNumber.isEmpty
        }
        
        return false
    }
    
    private func emptyPhoneNumberError() -> NSError {
        let errorCode = PhoneNumberValidatorErrorCode.EmptyPhoneNumber
        let errorMessage = NSLocalizedString("Phone number cannot be empty.", comment: "")
        let userInfo = [NSLocalizedDescriptionKey: errorMessage]
        let error = NSError(domain: PhoneNumberValidatorErrorDomain, code: errorCode.rawValue, userInfo: userInfo)
        return error
    }
}
