package main.java;

import io.github.bonigarcia.wdm.WebDriverManager;
import main.java.jobroles.JobRolesPageTests;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import java.time.Duration;

public class SeleniumTests {
    public static void main(String[] args) {
        WebDriverManager.chromedriver().setup();
        WebDriver webDriver = new ChromeDriver();

        webDriver.get("http://localhost:3000");
        webDriver.manage().timeouts().implicitlyWait(Duration.ofSeconds(5));

        //Here add you next test classes and call methods from them
        JobRolesPageTests jobRolesPageTests = new JobRolesPageTests();
        jobRolesPageTests.isJobRolesButtonActive(webDriver);

    }
}
