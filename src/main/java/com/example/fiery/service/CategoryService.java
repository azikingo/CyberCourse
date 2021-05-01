package com.example.fiery.service;

import com.example.fiery.domain.Category;
import com.example.fiery.repos.CategoryRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CategoryService {
    @Autowired
    CategoryRepo categoryRepo;

    public Map<String, String> addCategory(Category category) {
        category.setTitleKz(category.getTitleKz().replaceAll("\"", "&#8220;"));
        category.setTitleRu(category.getTitleRu().replaceAll("\"", "&#8220;"));
        category.setTitleEn(category.getTitleEn().replaceAll("\"", "&#8220;"));

        Map<String, String> result = new HashMap<>();
        try {
            categoryRepo.save(category);
        } catch (Exception e) {
            result.put("message", "Сақталмады! Жүйеде қателік шықты.");
            return result;
        }

        return result;
    }

    public List<Category> getAllCategories() {
        return categoryRepo.getAllCategories();
    }
}
