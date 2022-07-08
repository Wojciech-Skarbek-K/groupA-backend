package org.kainos.groupA.api.models;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import org.kainos.groupA.api.models.User;

public class JobRole {
    private String role_name;
    private String role_description;
    private String sharepoint_url;
    private int cap_id;

    public JobRole(String role_name, String role_description, String sharepoint_url, int cap_id) {
        this.role_name = role_name;
        this.role_description = role_description;
        this.sharepoint_url = sharepoint_url;
        this.cap_id = cap_id;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    public String getRole_description() {
        return role_description;
    }

    public void setRole_description(String role_description) {
        this.role_description = role_description;
    }

    public String getSharepoint_url() {
        return sharepoint_url;
    }

    public void setSharepoint_url(String sharepoint_url) {
        this.sharepoint_url = sharepoint_url;
    }

    public int getCap_id() {
        return cap_id;
    }

    public void setCap_id(int cap_id) {
        this.cap_id = cap_id;
    }
}
