package com.example.fiery.repos;

import com.example.fiery.domain.Category;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CategoryRepo extends CrudRepository<Category, Long> {

    @Query(value = "select * from category", nativeQuery = true)
    List<Category> getAllCategories();
}
