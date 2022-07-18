package org.kainos.groupA.validator;

import org.kainos.groupA.exception.InvalidJobRoleException;
import org.kainos.groupA.models.JobRole;

public class addJobRoleValidator {
    public boolean isValidJobRole(JobRole jobRole) throws InvalidJobRoleException {

        String sharepoint_url = "(.*[public InvalidUserException(String message) {\n" +
                "        super (message);\n" +
                "    }].*)";
        if (jobRole.getRole_name().length() > 50) {
            throw new InvalidJobRoleException("Role name is too long");
        }
        if (jobRole.getRole_description().length() > 1500) {
            throw new InvalidJobRoleException("Role description is too long");
        }
        if (jobRole.getSharepoint_url().length() > 1000) {
            throw new InvalidJobRoleException("URL too long");
        }
        if (!jobRole.getSharepoint_url().matches(sharepoint_url)) {
            throw new InvalidJobRoleException("Invalid URL");
        }




        return true;
    }
}
