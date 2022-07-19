package org.kainos.groupA.validator;

import org.kainos.groupA.exception.*;
import org.kainos.groupA.models.User;

import java.util.regex.Pattern;


public class UserValidator {

    public boolean isValidUser(User user) throws  InvalidUserException {
        Pattern encryption = Pattern.compile("\\p{XDigit}+"); //Matches a string that is a hexadecimal string
        String companyDomain = "kainos.com";
        String email = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@" +  //part before @
                companyDomain + "$";
        if(user.getFirst_name().length() > 50) {
            throw new InvalidUserException("First Name is too long");
        }
        if (user.getLast_name().length() > 50) {
            throw new InvalidUserException("Last name is too long");
        }
        if (user.getPhone_number().length() >15) {
            throw new InvalidUserException("Phone number is too long");
        }
        if (user.getPassword().length() != 64) {
            throw new InvalidUserException("Invalid password hash");
        }
        if (!encryption.matcher(user.getPassword()).matches()) {
            throw new InvalidUserException("Invalid password");
        }
        if (user.getEmail().length() > 50) {
            throw new InvalidUserException("Email is too long");
        }
        if (!user.getEmail().matches(email)) {
            throw new InvalidUserException("Invalid domain");
        }
        return true;
    }
}

