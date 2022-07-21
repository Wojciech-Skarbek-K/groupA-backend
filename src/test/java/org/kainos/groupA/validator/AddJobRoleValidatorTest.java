package org.kainos.groupA.validator;

import org.junit.jupiter.api.Test;
import org.kainos.groupA.exception.InvalidJobRoleException;
import org.kainos.groupA.models.AddJobRole;
import org.kainos.groupA.models.JobRole;

import static org.junit.jupiter.api.Assertions.*;

public class AddJobRoleValidatorTest {

    AddJobRoleValidator jobRoleValidator = new AddJobRoleValidator();

    @Test
    public void isValidJobRole_shouldThrowInvalidJobRoleException_whenRoleNameTooLong() {
        AddJobRole jobRole = new AddJobRole(
                "Software Engineerasdfghjkjhgfdsdfghjkjhgfddfghjsdfghsfghjdfghjfghjkjhg",
                "Writing code, testing code, fixing code.",
                "https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Software%20Engineer%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1",
                3,
                5
        );
        assertThrows(InvalidJobRoleException.class,
                () -> jobRoleValidator.isValidJobRole(jobRole));
    }

    @Test
    public void isValidJobRole_shouldThrowInvalidJobRoleException_whenRoleDescriptionTooLong() {
        AddJobRole jobRole = new AddJobRole(
                "Software Engineer",
                "As a Trainee Software Engineer with Kainos, you will work on projects where you can make a real difference to people’s lives – the lives of people you know. After taking part in our award-winning, seven-week Engineering Academy, you will then join one of our many project teams, to learn from our experienced developers, project managers and customer-facing staff. You’ll have great support and mentoring, balanced with the experience of being given real, meaningful work to do, to help you truly develop both technically and professionally.  You will be responsible for:•Contribute to developing high quality solutions which impact the lives of users worldwide.   •You’ll work as part of a team to solve problems and produce innovative software solutions.  •Learn about new technologies and approaches, with talented colleagues who will help you learn, develop and grow.  •Based in our Kainos office and often on our customer sites, you will work on a project teams to learn how to develop and unit test developing and unit testing straightforward or low complexity components, and then moving on to more complex elements as you increase your knowledge.  •Work with other developers in working through designs and user stories and to produce real development solutions   •Will be fully supported by experienced colleagues in the team to follow designs,and then progress to assist in any other aspect of the project life-cycle under supervision   •Develop excellent technical, team-working and Agile project experience   MINIMUM (ESSENTIAL) REQUIREMENTS ",
                "https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Software%20Engineer%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1",
                3,
                5
        );
        assertThrows(InvalidJobRoleException.class,
                () -> jobRoleValidator.isValidJobRole(jobRole));
    }

    @Test
    public void isValidJobRole_shouldThrowInvalidJobRoleException_whenSharepointURLTooLong() {
        AddJobRole jobRole = new AddJobRole(
                "Software Engineer",
                "As a Trainee Software Engineer with Kainos, you will work on projects where you can make a real difference to people’s lives ",
                "https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Software%20Engineer%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Software%20Engineer%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Software%20Engineer%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Software%20Engineer%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Software%20Engineer%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Software%20Engineer%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Software%20Engineer%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Software%20Engineer%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Software%20Engineer%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Software%20Engineer%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Software%20Engineer%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1",
                3,
                5
        );
        assertThrows(InvalidJobRoleException.class,
                () -> jobRoleValidator.isValidJobRole(jobRole));
    }

    @Test
    public void isValidJobRole_shouldThrowInvalidJobRoleException_whenSharepointURLDoesntMatch() {
        AddJobRole jobRole = new AddJobRole(
                "Software Engineer",
                "Writing code, testing code, fixing code.",
                "hello",
                3,
                5
        );
        assertThrows(InvalidJobRoleException.class,
                () -> jobRoleValidator.isValidJobRole(jobRole));
    }

    @Test
    public void isValidJobRole_ShouldReturnTrue_WhenValidJobRole() throws InvalidJobRoleException {
        AddJobRole jobRole = new AddJobRole(
                "Software Engineer",
                "Writing code, testing code, fixing code.",
                "https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/test",
                3,
                5
        );
        assertTrue(jobRoleValidator.isValidJobRole(jobRole));
    }

}
