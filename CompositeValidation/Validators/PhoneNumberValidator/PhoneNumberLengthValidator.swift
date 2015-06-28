import Foundation

class PhoneNumberLengthValidator : Validator {    
    func validateValue(value: String?, error: NSErrorPointer?) -> Bool {
        if isPhoneNumberLengthValid(value) {
            return true
        }
        
        if let error = error {
            error.memory = invalidPhoneNumberLengthError()
        }
        
        return false        
    }
    
    private func isPhoneNumberLengthValid(phoneNumber: String?) -> Bool {
        if let phoneNumber = phoneNumber {
            return count(phoneNumber) >= 10 && count(phoneNumber) <= 20
        }
        
        return false
    }
    
    private func invalidPhoneNumberLengthError() -> NSError {
        let errorCode = PhoneNumberValidatorErrorCode.InvalidLength
        let errorMessage = NSLocalizedString("Phone number must be 10-20 digits long.", comment: "")
        let userInfo = [NSLocalizedDescriptionKey: errorMessage]
        let error = NSError(domain: PhoneNumberValidatorErrorDomain, code: errorCode.rawValue, userInfo: userInfo)
        return error
    }
}
