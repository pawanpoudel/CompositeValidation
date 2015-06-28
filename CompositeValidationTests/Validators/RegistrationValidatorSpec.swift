import Quick
import Nimble

class RegistrationValidatorSpec: QuickSpec {
    
    override func spec() {
        var phoneNumberValidator: FakeValidator!
        var emailValidator: FakeValidator!
        var passwordValidator: FakeValidator!
        var registrationOrSignInValidator: RegistrationValidator!
        var isValid: Bool?
        
        beforeEach {
            phoneNumberValidator = FakeValidator()
            emailValidator = FakeValidator()
            passwordValidator = FakeValidator()
        }
        
        context("when all validators are valid") {
            beforeEach {
                phoneNumberValidator.isValid = true
                emailValidator.isValid = true
                passwordValidator.isValid = true
                registrationOrSignInValidator = RegistrationValidator(phoneNumberValidator: phoneNumberValidator, emailValidator: emailValidator, passwordValidator: passwordValidator)
                isValid = registrationOrSignInValidator.validateWithError(nil)
            }
            
            it("it is valid") {
                expect(isValid).to(beTrue())
            }
        }
        
        context("when first validator is invalid, but succeeding validators are valid") {
            beforeEach {
                phoneNumberValidator.isValid = false
                emailValidator.isValid = true
                passwordValidator.isValid = true
                registrationOrSignInValidator = RegistrationValidator(phoneNumberValidator: phoneNumberValidator, emailValidator: emailValidator, passwordValidator: passwordValidator)
                isValid = registrationOrSignInValidator.validateWithError(nil)
            }
            
            it("it is invalid") {
                expect(isValid).to(beFalse())
            }
        }
        
        context("when preceeding validators are valid and last validator is invalid") {
            beforeEach {
                phoneNumberValidator.isValid = true
                emailValidator.isValid = true
                passwordValidator.isValid = false
                registrationOrSignInValidator = RegistrationValidator(phoneNumberValidator: phoneNumberValidator, emailValidator: emailValidator, passwordValidator: passwordValidator)
                isValid = registrationOrSignInValidator.validateWithError(nil)
            }
            
            it("it is invalid") {
                expect(isValid).to(beFalse())
            }
        }
        
        context("when all validators are invalid") {
            beforeEach {
                phoneNumberValidator.isValid = false
                emailValidator.isValid = false
                passwordValidator.isValid = false
                registrationOrSignInValidator = RegistrationValidator(phoneNumberValidator: phoneNumberValidator, emailValidator: emailValidator, passwordValidator: passwordValidator)
                isValid = registrationOrSignInValidator.validateWithError(nil)
            }
            
            it("it is invalid") {
                expect(isValid).to(beFalse())
            }
        }
    }
}
