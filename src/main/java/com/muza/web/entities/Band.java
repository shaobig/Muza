package com.muza.web.entities;

public class Band {

    private String name;

    private int foundedYear;

    private String country;

    private String genre;

    private String description;


    public Band(String name, int foundedYear, String country, String genre) {
        this.name = name;
        this.foundedYear = foundedYear;
        this.country = (country == null) ? "Earth" : country;
        this.genre = (genre == null) ? "Unique" : genre;
    }

    public String getName() {
        return name;
    }

    public int getFoundedYear() {
        return foundedYear;
    }

    public String getCountry() {
        return country;
    }

    public String getGenre() {
        return genre;
    }

    public String getDescription() {
        return description;
    }

    @Override
    public String toString() {
        return name + "(" + foundedYear + ")" + "[" + country + "]" + " - " + genre;
    }

}
