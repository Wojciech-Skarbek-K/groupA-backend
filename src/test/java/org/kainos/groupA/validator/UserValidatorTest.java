package org.kainos.groupA.validator;

import org.junit.jupiter.api.Test;
import org.kainos.groupA.exception.*;
import org.kainos.groupA.models.User;

import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.kainos.groupA.models.User.Role.Admin;
import static org.kainos.groupA.models.User.Role.Employee;

public class UserValidatorTest {

    UserValidator userValidator = new UserValidator();

    @Test
    public void isValidUser_shouldThrowFirstNameLengthException_whenFirstNameTooLong() {
        User user = new User(
                "orlagh@kainos.com",
                "Password123!",
                Admin,
                "1234567898ytrdedfgyhjuiklkjhgfcdfghjkmnbvbnm",
                "Orlaghsdfghjkjhgfddfghjkfdhjkfdfghjkkgfdfghjertyuiodfghjklsdftyui",
                "McCloskey",
                "07345673456",
                User.Location.Belfast

        );
        assertThrows(FirstNameLengthException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("First Name is too long");
    }

    @Test
    public void isValidUser_shouldThrowLastNameLengthException_whenLastNameTooLong() {
        User user = new User(
                "orlagh@kainos.com",
                "Password123!",
                Admin,
                "1234567898ytrdedfgyhjuiklkjhgfcdfghjkmnbvbnm",
                "Orlagh",
                "McCloskeysdfghjkjhgfddfghjkfdhjkfdfghjkkgfdfghjertyuiodfghjklsdftyui",
                "07345673456",
                User.Location.Belfast

        );
        assertThrows(LastNameLengthException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Last Name is too long");
    }

    @Test
    public void isValidUser_shouldThrowPhoneNumberLengthException_whenPhoneNumberTooLong() {
        User user = new User(
                "orlagh@kainos.com",
                "Password123!",
                Admin,
                "1234567898ytrdedfgyhjuiklkjhgfcdfghjkmnbvbnm",
                "Orlagh",
                "McCloskey",
                "073456734564554554455156521",
                User.Location.Belfast

        );
        assertThrows(PhoneNumberLengthException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Phone Number is too long");
    }

    @Test
    public void isValidUser_shouldThrowPasswordLengthException_whenPasswordTooLong() {
        User user = new User(
                "orlagh@kainos.com",
                "Password123!ertyufghghjhgghchdfsdfghjkl",
                Admin,
                "1234567898ytrdedfgyhjuiklkjhgfcdfghjkmnbvbnm",
                "Orlagh",
                "McCloskey",
                "07345673451",
                User.Location.Belfast

        );
        assertThrows(PasswordLengthException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Invalid Password");
    }


    @Test
    public void isValidUser_shouldThrowPasswordLengthException_whenPasswordTooShort() {
        User user = new User(
                "orlagh@kainos.com",
                "Pass",
                Admin,
                "1234567898ytrdedfgyhjuiklkjhgfcdfghjkmnbvbnm",
                "Orlagh",
                "McCloskey",
                "07345673451",
                User.Location.Belfast

        );
        assertThrows(PasswordLengthException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Invalid Password");
    }

    @Test
    public void isValidUser_shouldThrowPasswordContainsException_whenPasswordDoesntContainUpperCase() {
        User user = new User(
                "orlagh@kainos.com",
                "password123!",
                Admin,
                "1234567898ytrdedfgyhjuiklkjhgfcdfghjkmnbvbnm",
                "Orlagh",
                "McCloskey",
                "07345673451",
                User.Location.Belfast

        );
        assertThrows(PasswordContainsException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Invalid Password");
    }

    @Test
    public void isValidUser_shouldThrowPasswordContainsException_whenPasswordDoesntContainLowerCase() {
        User user = new User(
                "orlagh@kainos.com",
                "PASSWORD123!",
                Admin,
                "1234567898ytrdedfgyhjuiklkjhgfcdfghjkmnbvbnm",
                "Orlagh",
                "McCloskey",
                "07345673451",
                User.Location.Belfast

        );
        assertThrows(PasswordContainsException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Invalid Password");
    }

    @Test
    public void isValidUser_shouldThrowPasswordContainsException_whenPasswordDoesntContainNumbers() {
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
        assertThrows(PasswordContainsException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Invalid Password");
    }

    @Test
    public void isValidUser_shouldThrowPasswordContainsException_whenPasswordDoesntContainSpecialCharacters() {
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
        assertThrows(PasswordContainsException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Invalid Password");
    }

    @Test
    public void isValidUser_shouldThrowEmailContainsException_whenEmailDoesntContainCorrectSyntax() {
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
        assertThrows(EmailContainsException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Invalid Email");
    }

    @Test
    public void isValidUser_shouldThrowEmailContainsException_whenEmailDoesntContainCompanyDomain() {
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
        assertThrows(EmailContainsException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Invalid Email");
    }

    @Test
    public void isValidUser_shouldThrowEmailLengthException_whenEmailTooLong() {
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
        assertThrows(EmailLengthException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Invalid Email");
    }

    /*@Test
    public void isValidUser_shouldThrowNotValidRoleException_whenInvalidRole() {
        User user = new User(
                "orlagh@kainos.com",
                "Password123!",
                "1234567898ytrdedfgyhjuiklkjhgfcdfghjkmnbvbnm",
                "Orlagh",
                "McCloskey",
                "07345673451",
                User.Location.Belfast

        );
        assertThrows(NotValidRoleException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Invalid Role");
    }

    @Test
    public void isValidUser_shouldThrowNotValidRoleException_whenNotAdmin() {
        User user = new User(
                "orlagh@kainos.com",
                "Password123!",
                Employee,
                "1234567898ytrdedfgyhjuiklkjhgfcdfghjkmnbvbnm",
                "Orlagh",
                "McCloskey",
                "07345673451",
                User.Location.Belfast

        );
        assertThrows(NotValidRoleException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Invalid Role");
    }

    @Test
    public void isValidUser_shouldThrowNotValidLocationException_whenNotBelfast() {
        User user = new User(
                "orlagh@kainos.com",
                "Password123!",
                Employee,
                "1234567898ytrdedfgyhjuiklkjhgfcdfghjkmnbvbnm",
                "Orlagh",
                "McCloskey",
                "07345673451",
                User.Location.Belfast

        );
        assertThrows(NotValidLocationException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Invalid Location");
    }

    @Test
    public void isValidUser_shouldThrowNotValidLocationException_whenNotGdansk() {
        User user = new User(
                "orlagh@kainos.com",
                "Password123!",
                Admin,
                "1234567898ytrdedfgyhjuiklkjhgfcdfghjkmnbvbnm",
                "Orlagh",
                "McCloskey",
                "07345673451",
                User.Location.Belfast

        );
        assertThrows(NotValidLocationException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Invalid Location");
    }

    @Test
    public void isValidUser_shouldThrowNotValidLocationException_whenNotBirmingham() {
        User user = new User(
                "orlagh@kainos.com",
                "Password123!",
                Admin,
                "1234567898ytrdedfgyhjuiklkjhgfcdfghjkmnbvbnm",
                "Orlagh",
                "McCloskey",
                "07345673451",
                User.Location.Belfast

        );
        assertThrows(NotValidLocationException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Invalid Location");
    }

    @Test
    public void isValidUser_shouldThrowNotValidLocationException_whenNotLondon() {
        User user = new User(
                "orlagh@kainos.com",
                "Password123!",
                Admin,
                "1234567898ytrdedfgyhjuiklkjhgfcdfghjkmnbvbnm",
                "Orlagh",
                "McCloskey",
                "07345673451",
                User.Location.Birmingham

        );
        assertThrows(NotValidLocationException.class,
                () -> userValidator.isValidUser(user));
        System.out.println("Invalid Location");
    }*/
}
