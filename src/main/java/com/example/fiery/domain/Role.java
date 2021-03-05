package com.example.fiery.domain;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    admin, teacher, student;

    @Override
    public String getAuthority() {
        return name();
    }
}
