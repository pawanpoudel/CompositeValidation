import Quick
import Nimble

class EmptyEmailValidatorSpec: QuickSpec {

    override func spec() {
        var validator: EmptyEmailValidator!
        var email: String!
        var error: NSError?
        var isEmailValid: Bool!
        
        beforeEach {
            validator = EmptyEmailValidator()
        }
        
        afterEach {
            error = nil
        }
        
        context("when email is nil") {
            beforeEach {
                email = nil
                isEmailValid = validator.validateValue(email, error: &error)
            }
            
            it("it is invalid") {
                expect(isEmailValid).to(beFalse())
            }
            
            it("correct error domain is set") {
                expect(error?.domain).to(equal(EmailValidatorErrorDomain))
            }
            
            it("correct error code is set") {
                expect(error?.code).to(equal(EmailValidatorErrorCode.EmptyEmail.rawValue))
            }
        }
        
        context("when email is empty") {
            beforeEach {
                email = ""
                isEmailValid = validator.validateValue(email, error: &error)
            }
            
            it("it is invalid") {
                expect(isEmailValid).to(beFalse())
            }
            
            it("correct error domain is set") {
                expect(error?.domain).to(equal(EmailValidatorErrorDomain))
            }
            
            it("correct error code is set") {
                expect(error?.code).to(equal(EmailValidatorErrorCode.EmptyEmail.rawValue))
            }
        }
        
        context("when email is not empty") {
            beforeEach {
                email = "testemail@testdomain.com"
                isEmailValid = validator.validateValue(email, error: &error)
            }
            
            it("it is valid") {
                expect(isEmailValid).to(beTrue())
            }
            
            it("error should be nil") {
                expect(error).to(beNil())
            }
        }
    }
}
