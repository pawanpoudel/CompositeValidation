class ValidatorsFactory {
    static let sharedInstance = ValidatorsFactory()
    
    func registrationValidator() -> RegistrationValidator {
        return RegistrationValidator(phoneNumberValidator: phoneNumberValidator(),
            emailValidator: emailValidator(),
            passwordValidator: PasswordLengthValidator())
    }
    
    func phoneNumberValidator() -> CompositeValidator {
        return CompositeValidator(validators: [EmptyPhoneNumberValidator(), PhoneNumberLengthValidator()])
    }
    
    func emailValidator() -> CompositeValidator {
        return CompositeValidator(validators: [EmptyEmailValidator(), EmailFormatValidator()])
    }
}
