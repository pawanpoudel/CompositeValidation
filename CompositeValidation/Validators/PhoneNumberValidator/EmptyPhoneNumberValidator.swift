import Foundation

class EmptyPhoneNumberValidator : Validator {
    func validateValue(value: String?, error: NSErrorPointer?) -> Bool {
        if let phoneNumber = value where phoneNumber.isEmpty {
            if let error = error {
                error.memory = emptyPhoneNumberError()
            }

            return false
        }
        
        return true
    }
    
    private func emptyPhoneNumberError() -> NSError {
        let errorCode = PhoneNumberValidatorErrorCode.EmptyPhoneNumber
        let errorMessage = NSLocalizedString("Phone number cannot be empty.", comment: "")
        let userInfo = [NSLocalizedDescriptionKey: errorMessage]
        let error = NSError(domain: PhoneNumberValidatorErrorDomain, code: errorCode.rawValue, userInfo: userInfo)
        return error
    }
}
