import Quick
import Nimble

class CompositeValidatorSpec: QuickSpec {
    
    override func spec() {
        var validator1: FakeValidator!
        var validator2: FakeValidator!
        var compositeValidator: CompositeValidator!
        var isValid: Bool!
        
        beforeEach {
            validator1 = FakeValidator()
            validator2 = FakeValidator()
            compositeValidator = CompositeValidator(validators: [validator1, validator2])
        }
        
        context("when preceeding validators are true and succeeding validator is false") {
            beforeEach {
                validator1.isValid = true
                validator2.isValid = false
                isValid = compositeValidator.validateValue("fakeValue", error: nil)
            }
            
            it("returns false") {
                expect(isValid).to(beFalse())
            }
        }
        
        context("when preceeding validator is false and succeeding validator is true") {
            beforeEach {
                validator1.isValid = false
                validator2.isValid = true
                isValid = compositeValidator.validateValue("fakeValue", error: nil)
            }
            
            it("returns false") {
                expect(isValid).to(beFalse())
            }
        }
        
        context("when all validators are false") {
            beforeEach {
                validator1.isValid = false
                validator2.isValid = false
                isValid = compositeValidator.validateValue("fakeValue", error: nil)
            }
            
            it("returns false") {
                expect(isValid).to(beFalse())
            }
        }

        context("when all validators return true") {
            beforeEach {
                validator1.isValid = true
                validator2.isValid = true
                isValid = compositeValidator.validateValue("fakeValue", error: nil)
            }
            
            it("returns true") {
                expect(isValid).to(beTrue())
            }
        }
    }
}
