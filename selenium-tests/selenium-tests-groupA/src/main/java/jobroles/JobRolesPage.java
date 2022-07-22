package main.java.jobroles;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class JobRolesPage {

    void clickJobRolesButton(WebDriver driver) {
        jobRolesButton(driver).click();
    }

    static WebElement jobRolesButton(WebDriver driver) {
        return driver.findElement(By.id("view-job-roles"));
    }
}
