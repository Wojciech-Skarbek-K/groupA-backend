package org.kainos.groupA.validator;

import org.kainos.groupA.exception.*;
import org.kainos.groupA.models.User;



public class UserValidator {

    public boolean isValidUser(User user) throws  InvalidUserException {
        String encryption = "([$2b$10$].*)"; //Matches a string that starts with '$2b$10$'
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
        if (user.getPassword().length() != 60) {
            throw new InvalidUserException("Invalid Password");
        }
        if (!user.getPassword().matches(encryption)) {
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

