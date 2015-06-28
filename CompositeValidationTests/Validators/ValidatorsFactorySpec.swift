import Quick
import Nimble
import Foundation

class ValidatorsFactorySpec: QuickSpec {
    
    override func spec() {
        var factory: ValidatorsFactory!
        
        beforeEach {
            factory = ValidatorsFactory.sharedInstance
        }
        
        describe("sharedInstance") {
            it("returns the same instance every time") {
                let factory1 = ValidatorsFactory.sharedInstance
                let factory2 = ValidatorsFactory.sharedInstance
                expect(factory1).to(beIdenticalTo(factory2))
            }
        }
        
        describe("registrationValidator") {
            var registrationValidator: RegistrationValidator!
            
            beforeEach {
                registrationValidator = factory.registrationValidator()
            }
            
            it("is not nil") {
                expect(registrationValidator).toNot(beNil())
            }
        }
        
        describe("phoneNumberValidator") {
            var phoneNumberValidator: CompositeValidator!
            
            beforeEach {
                phoneNumberValidator = factory.phoneNumberValidator()
            }
            
            it("is not nil") {
                expect(phoneNumberValidator).toNot(beNil())
            }
        }
        
        describe("emailValidator") {
            var emailValidator: CompositeValidator!
            
            beforeEach {
                emailValidator = factory.emailValidator()
            }
            
            it("is not nil") {
                expect(emailValidator).toNot(beNil())
            }
        }
    }
}
