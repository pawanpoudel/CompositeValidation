import Quick
import Nimble

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
            it("is not nil") {
                let registrationValidator = factory.registrationValidator()
                expect(registrationValidator).toNot(beNil())
            }
        }
        
        describe("settingsValidator") {
            it("is not nil") {
                let settingsValidator = factory.settingsValidator()
                expect(settingsValidator).toNot(beNil())
            }
        }
        
        describe("phoneNumberValidator") {
            it("is not nil") {
                let phoneNumberValidator = factory.phoneNumberValidator()
                expect(phoneNumberValidator).toNot(beNil())
            }
        }
        
        describe("emailValidator") {
            it("is not nil") {
                let emailValidator = factory.emailValidator()
                expect(emailValidator).toNot(beNil())
            }
        }
    }
}
