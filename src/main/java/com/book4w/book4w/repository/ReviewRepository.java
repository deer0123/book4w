package com.book4w.book4w.repository;

import com.book4w.book4w.entity.Review;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ReviewRepository extends JpaRepository<Review, String> {

    Page<Review> findByBookId(String bookId, Pageable page);
}
