import Foundation

class CompositeValidator: Validator {
    private let validators: [Validator]
    
    init(validators: [Validator]) {
        self.validators = validators
    }
    
    func validateValue(value: String?, error: NSErrorPointer?) -> Bool {
        for validator in validators {
            let valid = validator.validateValue(value, error: error)
            
            if !valid {
                return false
            }
        }
        
        return true
    }
}
