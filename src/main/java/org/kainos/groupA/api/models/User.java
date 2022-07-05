package org.kainos.groupA.api.models;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class User {
    private enum Role {EMPLOYEE, ADMIN};
    private enum Location {BELEFAST, GDANSK, }
    private String email;
    private String password;
    private Role role;
    private String token;
    private String first_name;
    private String last_name;
    private String phone_number;
    private Location location;

    @JsonCreator
    public User(
            @JsonProperty("email") String email,
            @JsonProperty("password") String password,
            @JsonProperty("role") Role role,
            @JsonProperty("token") String token,
            @JsonProperty("first_name") String first_name,
            @JsonProperty("last_name") String last_name,
            @JsonProperty("phone_number") String phone_number,
            @JsonProperty("location") Location location
    ) {};
}
