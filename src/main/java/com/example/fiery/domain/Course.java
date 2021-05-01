package com.example.fiery.domain;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.Min;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDateTime timestamp;

    private String photoPath;

    @Length(max = 225)
    private String titleKz;
    @Length(max = 225)
    private String titleRu;
    @Length(max = 225)
    private String titleEn;

    @Length(max = 225)
    private String descriptionKz;
    @Length(max = 225)
    private String descriptionRu;
    @Length(max = 225)
    private String descriptionEn;

    @Min(value = 0, message = "0-ден төмен сан енгізуге болмайды")
    private Long price;

    @Min(value = 0, message = "0-ден төмен сан енгізуге болмайды")
    private Integer duration;

    @Min(value = 0, message = "0-ден төмен сан енгізуге болмайды")
    private Integer limitTime;

    private boolean active = true;

    @ManyToMany
    @JoinTable(
            name = "course_category",
            joinColumns = {@JoinColumn(name = "course_id")},
            inverseJoinColumns = {@JoinColumn(name = "category_id")}
    )
    private List<Category> categories = new ArrayList<>();

    @OneToMany(mappedBy = "course", fetch = FetchType.LAZY)
    private List<CoursePart> courseParts = new ArrayList<>();

    public Course() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDateTime getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(LocalDateTime timestamp) {
        this.timestamp = timestamp;
    }

    public String getPhotoPath() {
        return photoPath;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }

    public Integer getLimitTime() {
        return limitTime;
    }

    public void setLimitTime(Integer limitTime) {
        this.limitTime = limitTime;
    }

    public String getTitleKz() {
        return titleKz;
    }

    public void setTitleKz(String titleKz) {
        this.titleKz = titleKz;
    }

    public String getTitleRu() {
        return titleRu;
    }

    public void setTitleRu(String titleRu) {
        this.titleRu = titleRu;
    }

    public String getTitleEn() {
        return titleEn;
    }

    public void setTitleEn(String titleEn) {
        this.titleEn = titleEn;
    }

    public String getDescriptionKz() {
        return descriptionKz;
    }

    public void setDescriptionKz(String descriptionKz) {
        this.descriptionKz = descriptionKz;
    }

    public String getDescriptionRu() {
        return descriptionRu;
    }

    public void setDescriptionRu(String descriptionRu) {
        this.descriptionRu = descriptionRu;
    }

    public String getDescriptionEn() {
        return descriptionEn;
    }

    public void setDescriptionEn(String descriptionEn) {
        this.descriptionEn = descriptionEn;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public List<Category> getCategories() {
        return categories;
    }

    public void setCategories(List<Category> categories) {
        this.categories = categories;
    }

    public List<CoursePart> getCourseParts() {
        return courseParts;
    }

    public void setCourseParts(List<CoursePart> courseParts) {
        this.courseParts = courseParts;
    }
}
