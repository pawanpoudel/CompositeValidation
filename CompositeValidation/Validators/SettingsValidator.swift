import Foundation

class SettingsValidator {
    var nickname: String?
    var phoneNumber: String?
    
    private let nicknameValidator: Validator
    private let phoneNumberValidator: Validator
    
    init(nicknameValidator: Validator, phoneNumberValidator: Validator) {
        self.nicknameValidator = nicknameValidator
        self.phoneNumberValidator = phoneNumberValidator
    }
    
    func validateWithError(error: NSErrorPointer) -> Bool {
        let isNicknameValid = nicknameValidator.validateValue(nickname, error: error)
        if !isNicknameValid {
            return false
        }
    
        let isPhoneNumberValid = phoneNumberValidator.validateValue(phoneNumber, error: error)
        if !isPhoneNumberValid {
            return false
        }
        
        return true
    }
}
