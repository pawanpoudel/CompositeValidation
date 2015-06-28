import Foundation

protocol Validator {
    func validateValue(value: String?, error: NSErrorPointer?) -> Bool
}
