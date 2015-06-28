import Foundation

class EmptyNicknameValidator : Validator {
    func validateValue(value: String?, error: NSErrorPointer?) -> Bool {
        if isNicknameNotEmpty(value) {
            return true
        }
        
        if let error = error {
            error.memory = emptyNicknameError()
        }
        
        return false
    }
    
    private func isNicknameNotEmpty(nickname: String?) -> Bool {
        if let nickname = nickname {
            return !nickname.isEmpty
        }
        
        return false
    }
    
    private func emptyNicknameError() -> NSError {
        let errorCode = NicknameValidatorErrorCode.EmptyNickname
        let errorMessage = NSLocalizedString("Nickname cannot be empty.", comment: "")
        let userInfo = [NSLocalizedDescriptionKey: errorMessage]
        let error = NSError(domain: NicknameValidatorErrorDomain, code: errorCode.rawValue, userInfo: userInfo)        
        return error
    }
}
