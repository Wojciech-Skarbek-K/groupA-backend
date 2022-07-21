package org.kainos.groupA.models;

import java.security.Principal;

public class AuthUser implements Principal {
    String name;
    User.Role role;

    public AuthUser(String name, User.Role role) {
        this.name = name;
        this.role = role;
    }

    @Override
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User.Role getRole() {
        return role;
    }

    public void setRole(User.Role role) {
        this.role = role;
    }
}
