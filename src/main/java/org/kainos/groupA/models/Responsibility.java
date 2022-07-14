package org.kainos.groupA.models;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class Responsibility {

    private String role_name;
    private String resp_desc;


    public String getResp_desc() {
        return resp_desc;
    }

    public void setResp_desc(String resp_desc) {
        this.resp_desc = resp_desc;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }



    @JsonCreator
    public Responsibility(
            @JsonProperty("role_name") String role_name,
            @JsonProperty("resp_desc") String resp_desc
    ) {

        this.role_name = role_name;
        this.resp_desc = resp_desc;
    }


}


