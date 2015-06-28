import Quick
import Nimble

class SettingsValidatorSpec: QuickSpec {
    
    override func spec() {
        var nicknameValidator: FakeValidator!
        var phoneNumberValidator: FakeValidator!
        var settingsValidator: SettingsValidator!
        var isValid: Bool?
        
        beforeEach {
            nicknameValidator = FakeValidator()
            phoneNumberValidator = FakeValidator()
        }
        
        context("when all validators are valid") {
            beforeEach {
                nicknameValidator.isValid = true
                phoneNumberValidator.isValid = true
                settingsValidator = SettingsValidator(nicknameValidator: nicknameValidator, phoneNumberValidator: phoneNumberValidator)
                isValid = settingsValidator.validateWithError(nil)
            }
            
            it("it is valid") {
                expect(isValid).to(beTrue())
            }
        }
        
        context("when first validator is invalid and succeeding validators are valid") {
            beforeEach {
                nicknameValidator.isValid = false
                phoneNumberValidator.isValid = true
                settingsValidator = SettingsValidator(nicknameValidator: nicknameValidator, phoneNumberValidator: phoneNumberValidator)
                isValid = settingsValidator.validateWithError(nil)
            }
            
            it("it is invalid") {
                expect(isValid).to(beFalse())
            }
        }
        
        context("when preceeding validators are valid and last validator is invalid") {
            beforeEach {
                nicknameValidator.isValid = true
                phoneNumberValidator.isValid = false
                settingsValidator = SettingsValidator(nicknameValidator: nicknameValidator, phoneNumberValidator: phoneNumberValidator)
                isValid = settingsValidator.validateWithError(nil)
            }
            
            it("it is invalid") {
                expect(isValid).to(beFalse())
            }
        }
        
        context("when all validators are invalid") {
            beforeEach {
                nicknameValidator.isValid = false
                phoneNumberValidator.isValid = false
                settingsValidator = SettingsValidator(nicknameValidator: nicknameValidator, phoneNumberValidator: phoneNumberValidator)
                isValid = settingsValidator.validateWithError(nil)
            }
            
            it("it is invalid") {
                expect(isValid).to(beFalse())
            }
        }
    }
}
