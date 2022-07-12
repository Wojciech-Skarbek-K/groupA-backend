package org.kainos.groupA.models;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class Competency {
    private String role_name;
    private String role_description;
    private String sharepoint_url;
    private int cap_id;

    @JsonCreator
    public Competency(
            @JsonProperty("role_name") String role_name,
            @JsonProperty("role_description") String role_description,
            @JsonProperty("sharepoint_url") String sharepoint_url,
            @JsonProperty("cap_id") int cap_id
    ) {
        this.role_name = role_name;
        this.role_description = role_description;
        this.sharepoint_url = sharepoint_url;
        this.cap_id = cap_id;
    }
}
