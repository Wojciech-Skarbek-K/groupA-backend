package org.kainos.groupA.validator;

import org.apache.commons.lang3.EnumUtils;
import org.kainos.groupA.exception.*;
import org.kainos.groupA.models.User;

import static org.kainos.groupA.models.User.Role.Admin;
import static org.kainos.groupA.models.User.Role.Employee;

public class UserValidator {

    public boolean isValidUser(User user) throws FirstNameLengthException, LastNameLengthException, PhoneNumberLengthException, PasswordLengthException, PasswordContainsException, EmailContainsException, EmailLengthException, NotValidRoleException, NotValidLocationException {
        String upperCaseChars = "(.*[A-Z].*)";
        String lowerCaseChars = "(.*[a-z].*)";
        String numbers = "(.*[0-9].*)";
        String specialChars = "(.*[@,#,$,%,!,?].*$)";
        String companyDomain = "kainos.com";
        String email = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@" +  //part before @
                companyDomain + "$";
        if(user.getFirst_name().length() > 50) {
            throw new FirstNameLengthException();
        }

        if (user.getLast_name().length() > 50) {
            throw new LastNameLengthException();
        }
        if (user.getPhone_number().length() >15) {
            throw new PhoneNumberLengthException();
        }
        //TODO: Password will be encrypted so we just need to check if password is an encrypted string
        /*if (user.getPassword().length() <8 || user.getPassword().length() >20) {
            throw new PasswordLengthException();
        }
        if (!user.getPassword().matches(upperCaseChars) || !user.getPassword().matches(lowerCaseChars) || !user.getPassword().matches(numbers) || !user.getPassword().matches(specialChars)) {
            throw new PasswordContainsException();
        }*/
        if (user.getEmail().length() > 50) {
            throw new EmailLengthException();
        }
        if (!user.getEmail().matches(email)) {
            throw new EmailContainsException();
        }
        if (!EnumUtils.isValidEnum(User.Role.class, user.getRole().name())) {
            throw new NotValidRoleException();
        }
        if (!EnumUtils.isValidEnum(User.Location.class, user.getLocation().name())) {
            throw new NotValidLocationException();
        }
        return true;
    }
}

