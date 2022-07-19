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
                "0a3cb046627a5cf9d8b7d055b663780cd00e68ffd6b32dc2582b3cf77e7d5fcf",
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
                "0a3cb046627a5cf9d8b7d055b663780cd00e68ffd6b32dc2582b3cf77e7d5fcf",
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
                "0a3cb046627a5cf9d8b7d055b663780cd00e68ffd6b32dc2582b3cf77e7d5fcf",
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
                "0a3cb046627a5cf9d8b7d055b663780cd00e68ffd6b32dc2582b3cf77e7d5fct",
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
    public void isValidUser_shouldThrowInvalidUserException_whenPasswordDoesntEqual64() {
        User user = new User(
                "orlagh@kainos.com",
                "0a3cb046627a5cf9d8b7d055b663780cd00e68ffd6b32dc2582b3cf77e7",
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
                "0a3cb046627a5cf9d8b7d055b663780cd00e68ffd6b32dc2582b3cf77e7d5fcf",
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
                "0a3cb046627a5cf9d8b7d055b663780cd00e68ffd6b32dc2582b3cf77e7d5fcf",
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
                "0a3cb046627a5cf9d8b7d055b663780cd00e68ffd6b32dc2582b3cf77e7d5fcf",
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
