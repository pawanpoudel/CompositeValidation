import Quick
import Nimble

class EmailFormatValidatorSpec: QuickSpec {

    override func spec() {
        var validator: EmailFormatValidator!
        var email: String!
        var error: NSError?
        var isEmailValid: Bool!
        
        beforeEach {
            validator = EmailFormatValidator()
        }
        
        afterEach {
            error = nil
        }
        
        context("when email only contains special characters") {
            beforeEach {
                email = "$#@!@testdomain.com"
                isEmailValid = validator.validateValue(email, error: &error)
            }
            
            it("it is invalid") {
                expect(isEmailValid).to(beFalse())
            }
            
            it("correct error domain is set") {
                expect(error?.domain).to(equal(EmailValidatorErrorDomain))
            }
            
            it("correct error code is set") {
                expect(error?.code).to(equal(EmailValidatorErrorCode.InvalidFormat.rawValue))
            }
        }
        
        context("when email contains letters") {
            beforeEach {
                email = "testemail@testdomain.com"
                isEmailValid = validator.validateValue(email, error: &error)
            }
            
            it("it is valid") {
                expect(isEmailValid).to(beTrue())
            }
        }
        
        context("when email contains numeric characters") {
            beforeEach {
                email = "1234testemail@testdomain.com"
                isEmailValid = validator.validateValue(email, error: &error)
            }
            
            it("it is valid") {
                expect(isEmailValid).to(beTrue())
            }
        }
        
        context("when email does not contain @ sign") {
            beforeEach {
                email = "testemailtestdomain.com"
                isEmailValid = validator.validateValue(email, error: &error)
            }
            
            it("it is invalid") {
                expect(isEmailValid).to(beFalse())
            }
            
            it("correct error domain is set") {
                expect(error?.domain).to(equal(EmailValidatorErrorDomain))
            }
            
            it("correct error code is set") {
                expect(error?.code).to(equal(EmailValidatorErrorCode.InvalidFormat.rawValue))
            }
        }
        
        context("when email does not contain a domain name") {
            beforeEach {
                email = "testemail@"
                isEmailValid = validator.validateValue(email, error: &error)
            }
            
            it("it is invalid") {
                expect(isEmailValid).to(beFalse())
            }
            
            it("correct error domain is set") {
                expect(error?.domain).to(equal(EmailValidatorErrorDomain))
            }
            
            it("correct error code is set") {
                expect(error?.code).to(equal(EmailValidatorErrorCode.InvalidFormat.rawValue))
            }
        }
    }
}
