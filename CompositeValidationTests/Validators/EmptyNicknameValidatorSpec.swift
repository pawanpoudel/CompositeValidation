import Quick
import Nimble

class EmptyNicknameValidatorSpec: QuickSpec {
    
    override func spec() {
        var validator: EmptyNicknameValidator!
        var nickname: String!
        var error: NSError?
        var isNicknameValid: Bool!
        
        beforeEach {
            validator = EmptyNicknameValidator()
        }
        
        afterEach {
            error = nil
        }
        
        context("when nickname is nil") {
            beforeEach {
                nickname = nil
                isNicknameValid = validator.validateValue(nickname, error: &error)
            }
            
            it("it is invalid") {
                expect(isNicknameValid).to(beFalse())
            }
            
            it("correct error domain is set") {
                expect(error?.domain).to(equal(NicknameValidatorErrorDomain))
            }
            
            it("correct error code is set") {
                expect(error?.code).to(equal(NicknameValidatorErrorCode.EmptyNickname.rawValue))
            }
        }
        
        context("when nickname is empty") {
            beforeEach {
                nickname = ""
                isNicknameValid = validator.validateValue(nickname, error: &error)
            }
            
            it("it is invalid") {
                expect(isNicknameValid).to(beFalse())
            }
            
            it("correct error domain is set") {
                expect(error?.domain).to(equal(NicknameValidatorErrorDomain))
            }
            
            it("correct error code is set") {
                expect(error?.code).to(equal(NicknameValidatorErrorCode.EmptyNickname.rawValue))
            }
        }
        
        context("when nickname is not empty") {
            beforeEach {
                nickname = "testemail@testdomain.com"
                isNicknameValid = validator.validateValue(nickname, error: &error)
            }
            
            it("it is valid") {
                expect(isNicknameValid).to(beTrue())
            }
            
            it("error should be nil") {
                expect(error).to(beNil())
            }
        }
    }
}
