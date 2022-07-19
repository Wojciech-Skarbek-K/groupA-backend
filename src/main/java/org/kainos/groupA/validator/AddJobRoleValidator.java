package org.kainos.groupA.validator;

import org.kainos.groupA.exception.InvalidJobRoleException;
import org.kainos.groupA.models.AddJobRole;

public class AddJobRoleValidator {
    public static boolean isValidJobRole(AddJobRole jobRole) throws InvalidJobRoleException {

        if (jobRole.getRole_name().length() > 50) {
            throw new InvalidJobRoleException("Role name is too long");
        }
        if (jobRole.getRole_description().length() > 1500) {
            throw new InvalidJobRoleException("Role description is too long");
        }
        if (jobRole.getSharepoint_url().length() > 1000) {
            throw new InvalidJobRoleException("URL too long");
        }
        if (!jobRole.getSharepoint_url().contains("https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/")) {
            throw new InvalidJobRoleException("Invalid URL");
        }
        return true;
    }
}
