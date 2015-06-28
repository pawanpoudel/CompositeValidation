import Foundation

class FakeValidator : Validator {
    var isValid: Bool?
    
    func validateValue(value: String?, error: NSErrorPointer?) -> Bool {
        return isValid!
    }
}
