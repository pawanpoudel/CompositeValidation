import Quick
import Nimble

class PasswordLengthValidatorSpec: QuickSpec {
    
    override func spec() {
        var validator: PasswordLengthValidator!
        var password: String!
        var error: NSError?
        var isPasswordValid: Bool!
        
        beforeEach {
            validator = PasswordLengthValidator()
        }
        
        afterEach {
            error = nil
        }
        
        context("when password is greater than or equal to 6 characters") {
            beforeEach {
                password = "123456"
                isPasswordValid = validator.validateValue(password, error: &error)
            }
            
            it("it is valid") {
                expect(isPasswordValid).to(beTrue())
            }
            
            it("error should be nil") {
                expect(error).to(beNil())
            }
        }
        
        context("when password is less than 6 characters") {
            beforeEach {
                password = "12345"
                isPasswordValid = validator.validateValue(password, error: &error)
            }
            
            it("it is invalid") {
                expect(isPasswordValid).to(beFalse())
            }
            
            it("correct error domain is set") {
                expect(error?.domain).to(equal(MDPasswordValidatorErrorDomain))
            }
            
            it("correct error code is set") {
                expect(error?.code).to(equal(MDPasswordValidatorErrorCode.InvalidPasswordLengthErrorCode.rawValue))
            }
        }
    }
}
