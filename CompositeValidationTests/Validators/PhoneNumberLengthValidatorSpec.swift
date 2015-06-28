import Quick
import Nimble

class PhoneNumberLengthValidatorSpec: QuickSpec {
    
    override func spec() {
        var validator: PhoneNumberLengthValidator!
        var phoneNumber: String!
        var error: NSError?
        var isPhoneNumberValid: Bool!
        
        beforeEach {
            validator = PhoneNumberLengthValidator()
        }
        
        afterEach {
            error = nil
        }
        
        context("when phone number is greater than or equal to 10 characters, but less than or equal to 20 characters") {
            beforeEach {
                phoneNumber = "1234512345"
                isPhoneNumberValid = validator.validateValue(phoneNumber, error: &error)
            }
            
            it("it is valid") {
                expect(isPhoneNumberValid).to(beTrue())
            }
            
            it("error should be nil") {
                expect(error).to(beNil())
            }
        }
        
        context("when phone number is less than 10 characters") {
            beforeEach {
                phoneNumber = "123456789"
                isPhoneNumberValid = validator.validateValue(phoneNumber, error: &error)
            }
            
            it("it is invalid") {
                expect(isPhoneNumberValid).to(beFalse())
            }
            
            it("correct error domain is set") {
                expect(error?.domain).to(equal(PhoneNumberValidatorErrorDomain))
            }
            
            it("correct error code is set") {
                expect(error?.code).to(equal(PhoneNumberValidatorErrorCode.InvalidLength.rawValue))
            }
        }
        
        context("when phone number is greater than 20 characters") {
            beforeEach {
                phoneNumber = "123451234512345123451"
                isPhoneNumberValid = validator.validateValue(phoneNumber, error: &error)
            }
            
            it("it is invalid") {
                expect(isPhoneNumberValid).to(beFalse())
            }
            
            it("correct error domain is set") {
                expect(error?.domain).to(equal(PhoneNumberValidatorErrorDomain))
            }
            
            it("correct error code is set") {
                expect(error?.code).to(equal(PhoneNumberValidatorErrorCode.InvalidLength.rawValue))
            }
        }
    }
}
