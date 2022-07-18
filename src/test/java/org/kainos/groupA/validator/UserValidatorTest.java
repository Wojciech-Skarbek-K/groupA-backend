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
                "Orlaghsdfghjkjhgfddfghjkfdhjkfdfghjkkgfdfghjertyuiodfghjklsdftyui",
                "McCloskey",
                "07345673456",
                User.Location.Belfast

        );
        assertThrows(InvalidUserException.class,
                () -> userValidator.isValidUser(user));
    }

    @Test
    public void isValidUser_shouldThrowInvalidUserException_whenLastNameTooLong() {
        User user = new User(
                "orlagh@kainos.com",
                "$2b$10$ktJIlwDzSgj/kCgu3WaX/Or00YlPkye77zUSsDJtGZy/atH4c9xcKd",
                Admin,
                "Orlagh",
                "McCloskeysdfghjkjhgfddfghjkfdhjkfdfghjkkgfdfghjertyuiodfghjklsdftyui",
                "07345673456",
                User.Location.Belfast

        );
        assertThrows(InvalidUserException.class,
                () -> userValidator.isValidUser(user));
    }

    @Test
    public void isValidUser_shouldThrowInvalidUserException_whenPhoneNumberTooLong() {
        User user = new User(
                "orlagh@kainos.com",
                "$2b$10$ktJIlwDzSgj/kCgu3WaX/Or00YlPkye77zUSsDJtGZy/atH4c9xcKd",
                Admin,
                "Orlagh",
                "McCloskey",
                "073456734564554554455156521",
                User.Location.Belfast

        );
        assertThrows(InvalidUserException.class,
                () -> userValidator.isValidUser(user));
    }


    @Test
    public void isValidUser_shouldThrowInvalidUserException_whenPasswordIsntEncrypted() {
        User user = new User(
                "orlagh@kainos.com",
                "Password!",
                Admin,
                "Orlagh",
                "McCloskey",
                "07345673451",
                User.Location.Belfast

        );
        assertThrows(InvalidUserException.class,
                () -> userValidator.isValidUser(user));
    }

    @Test
    public void isValidUser_shouldThrowInvalidUserException_whenPasswordDoesntEqual61() {
        User user = new User(
                "orlagh@kainos.com",
                "Password123",
                Admin,
                "Orlagh",
                "McCloskey",
                "07345673451",
                User.Location.Belfast

        );
        assertThrows(InvalidUserException.class,
                () -> userValidator.isValidUser(user));
    }

    @Test
    public void isValidUser_shouldThrowInvalidUserException_whenEmailDoesntContainCorrectSyntax() {
        User user = new User(
                "orlaghkainos.com",
                "Password123!",
                Admin,
                "Orlagh",
                "McCloskey",
                "07345673451",
                User.Location.Belfast

        );
        assertThrows(InvalidUserException.class,
                () -> userValidator.isValidUser(user));
    }

    @Test
    public void isValidUser_shouldThrowInvalidUserException_whenEmailDoesntContainCompanyDomain() {
        User user = new User(
                "orlagh@kainoss.co.uk",
                "Password123!",
                Admin,
                "Orlagh",
                "McCloskey",
                "07345673451",
                User.Location.Belfast

        );
        assertThrows(InvalidUserException.class,
                () -> userValidator.isValidUser(user));
    }

    @Test
    public void isValidUser_shouldThrowInvalidUserException_whenEmailTooLong() {
        User user = new User(
                "orlaghsdfghjkdsdfghjkkjhsasdfghjkkjhgfdsdfghjk@kainos.com",
                "Password123!",
                Admin,
                "Orlagh",
                "McCloskey",
                "07345673451",
                User.Location.Belfast

        );
        assertThrows(InvalidUserException.class,
                () -> userValidator.isValidUser(user));
    }

}
