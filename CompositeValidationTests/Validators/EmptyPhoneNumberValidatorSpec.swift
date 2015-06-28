import Quick
import Nimble

class EmptyPhoneNumberValidatorSpec: QuickSpec {
    
    override func spec() {
        var validator: EmptyPhoneNumberValidator!
        var phoneNumber: String!
        var error: NSError?
        var isPhoneNumberValid: Bool!
        
        beforeEach {
            validator = EmptyPhoneNumberValidator()
        }
        
        afterEach {
            error = nil
        }
        
        context("when phone number is nil") {
            beforeEach {
                phoneNumber = nil
                isPhoneNumberValid = validator.validateValue(phoneNumber, error: &error)
            }
            
            it("it is valid") {
                expect(isPhoneNumberValid).to(beTrue())
            }
            
            it("error should be nil") {
                expect(error).to(beNil())
            }
        }
        
        context("when phone number is empty") {
            beforeEach {
                phoneNumber = ""
                isPhoneNumberValid = validator.validateValue(phoneNumber, error: &error)
            }
            
            it("it is invalid") {
                expect(isPhoneNumberValid).to(beFalse())
            }
            
            it("correct error domain is set") {
                expect(error?.domain).to(equal(PhoneNumberValidatorErrorDomain))
            }
            
            it("correct error code is set") {
                expect(error?.code).to(equal(PhoneNumberValidatorErrorCode.EmptyPhoneNumber.rawValue))
            }
        }
        
        context("when phone number is not empty") {
            beforeEach {
                phoneNumber = "testemail@testdomain.com"
                isPhoneNumberValid = validator.validateValue(phoneNumber, error: &error)
            }
            
            it("error should be nil") {
                expect(error).to(beNil())
            }
        }
    }
}
