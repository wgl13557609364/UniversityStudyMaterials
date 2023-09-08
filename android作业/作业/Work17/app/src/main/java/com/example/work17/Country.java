package com.example.work17;

public class Country{
    private String name;
    private int imageId;
    private String description;
    public Country(){}

    public String getName() {
        return name;
    }

    public Country(String name, int imageId, String description) {
        this.name = name;
        this.imageId = imageId;
        this.description = description;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Country{" +
                "name='" + name + '\'' +
                ", imageId=" + imageId +
                ", description='" + description + '\'' +
                '}';
    }
}
