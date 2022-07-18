package org.kainos.groupA.validator;

import org.junit.jupiter.api.Test;
import org.kainos.groupA.exception.*;
import org.kainos.groupA.models.User;

import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.kainos.groupA.models.User.Role.Admin;


public class UserValidatorTest {

    UserValidator userValidator = new UserValidator();
    @Test
    public void isValidUser_shouldInvalidUserException_whenFirstNameTooLong() {
        User user = new User(
                "orlagh@kainos.com",
                "$2b$10$ktJIlwDzSgj/kCgu3WaX/Or00YlPkye77zUSsDJtGZy/atH4c9xcKd",
                Admin,
                "1234567898ytrdedfgyhjuiklkjhgfcdfghjkmnbvbnm",
                "Orlaghsdfghjkjhgfddfghjkfdhjkfdfghjkkgfdfghjertyuiodfghjklsdftyui",
                "McCloskey",
                "07345673456",
                User.Location.Belfast

        );
        assertThrows(InvalidUserException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("First Name is too long");
    }

    @Test
    public void isValidUser_shouldThrowInvalidUserException_whenLastNameTooLong() {
        User user = new User(
                "orlagh@kainos.com",
                "$2b$10$ktJIlwDzSgj/kCgu3WaX/Or00YlPkye77zUSsDJtGZy/atH4c9xcKd",
                Admin,
                "1234567898ytrdedfgyhjuiklkjhgfcdfghjkmnbvbnm",
                "Orlagh",
                "McCloskeysdfghjkjhgfddfghjkfdhjkfdfghjkkgfdfghjertyuiodfghjklsdftyui",
                "07345673456",
                User.Location.Belfast

        );
        assertThrows(InvalidUserException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Last Name is too long");
    }

    @Test
    public void isValidUser_shouldThrowInvalidUserException_whenPhoneNumberTooLong() {
        User user = new User(
                "orlagh@kainos.com",
                "$2b$10$ktJIlwDzSgj/kCgu3WaX/Or00YlPkye77zUSsDJtGZy/atH4c9xcKd",
                Admin,
                "1234567898ytrdedfgyhjuiklkjhgfcdfghjkmnbvbnm",
                "Orlagh",
                "McCloskey",
                "073456734564554554455156521",
                User.Location.Belfast

        );
        assertThrows(InvalidUserException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Phone Number is too long");
    }


    @Test
    public void isValidUser_shouldThrowInvalidUserException_whenPasswordIsntEncrypted() {
        User user = new User(
                "orlagh@kainos.com",
                "Password!",
                Admin,
                "1234567898ytrdedfgyhjuiklkjhgfcdfghjkmnbvbnm",
                "Orlagh",
                "McCloskey",
                "07345673451",
                User.Location.Belfast

        );
        assertThrows(InvalidUserException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Invalid Password");
    }

    @Test
    public void isValidUser_shouldThrowInvalidUserException_whenPasswordDoesntEqual61() {
        User user = new User(
                "orlagh@kainos.com",
                "Password123",
                Admin,
                "1234567898ytrdedfgyhjuiklkjhgfcdfghjkmnbvbnm",
                "Orlagh",
                "McCloskey",
                "07345673451",
                User.Location.Belfast

        );
        assertThrows(InvalidUserException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Invalid Password");
    }

    @Test
    public void isValidUser_shouldThrowInvalidUserException_whenEmailDoesntContainCorrectSyntax() {
        User user = new User(
                "orlaghkainos.com",
                "Password123!",
                Admin,
                "1234567898ytrdedfgyhjuiklkjhgfcdfghjkmnbvbnm",
                "Orlagh",
                "McCloskey",
                "07345673451",
                User.Location.Belfast

        );
        assertThrows(InvalidUserException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Invalid Email");
    }

    @Test
    public void isValidUser_shouldThrowInvalidUserException_whenEmailDoesntContainCompanyDomain() {
        User user = new User(
                "orlagh@kainoss.co.uk",
                "Password123!",
                Admin,
                "1234567898ytrdedfgyhjuiklkjhgfcdfghjkmnbvbnm",
                "Orlagh",
                "McCloskey",
                "07345673451",
                User.Location.Belfast

        );
        assertThrows(InvalidUserException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Invalid Email");
    }

    @Test
    public void isValidUser_shouldThrowInvalidUserException_whenEmailTooLong() {
        User user = new User(
                "orlaghsdfghjkdsdfghjkkjhsasdfghjkkjhgfdsdfghjk@kainos.com",
                "Password123!",
                Admin,
                "1234567898ytrdedfgyhjuiklkjhgfcdfghjkmnbvbnm",
                "Orlagh",
                "McCloskey",
                "07345673451",
                User.Location.Belfast

        );
        assertThrows(InvalidUserException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Invalid Email");
    }

}
