package org.kainos.groupA.models;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class AddJobRole {

    private String role_name;
    private String role_description;
    private String sharepoint_url;
    private int cap_id;
    private int band_id;

    @JsonCreator
    public AddJobRole(
            @JsonProperty("role_name") String role_name,
            @JsonProperty("role_description") String role_description,
            @JsonProperty("sharepoint_url") String sharepoint_url,
            @JsonProperty("cap_id") int cap_id,
            @JsonProperty("band_id") int band_id
    ) {
        this.role_name = role_name;
        this.role_description = role_description;
        this.sharepoint_url = sharepoint_url;
        this.cap_id = cap_id;
        this.band_id = band_id;
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

    public int getBand_id() {
        return band_id;
    }

    public void setBand_id(int band_id) {
        this.band_id = band_id;
    }

}
