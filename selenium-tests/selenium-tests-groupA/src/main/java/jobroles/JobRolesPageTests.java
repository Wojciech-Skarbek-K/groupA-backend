package main.java.jobroles;

import org.openqa.selenium.WebDriver;

public class JobRolesPageTests {

    public void isJobRolesButtonActive(WebDriver webDriver){
        JobRolesPage jobRolesPage = new JobRolesPage();
        jobRolesPage.clickJobRolesButton(webDriver);
    }
}
