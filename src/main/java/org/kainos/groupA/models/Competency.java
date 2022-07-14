package org.kainos.groupA.models;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class Competency {
    public String getComp_name() {
        return comp_name;
    }

    public void setComp_name(String comp_name) {
        this.comp_name = comp_name;
    }

    public String getComp_description() {
        return comp_description;
    }

    public void setComp_description(String comp_description) {
        this.comp_description = comp_description;
    }

    private String band_name;
    private String comp_name;
    private String comp_description;

    @JsonCreator
    public Competency(
            @JsonProperty("band_name") String band_name,
            @JsonProperty("comp_name") String comp_name,
            @JsonProperty("comp_description") String comp_description
    ) {
        this.band_name = band_name;
        this.comp_name = comp_name;
        this.comp_description = comp_description;
    }

    public String getBand_name() {
        return band_name;
    }

    public void setBand_name(String band_name) {
        this.band_name = band_name;
    }
}
