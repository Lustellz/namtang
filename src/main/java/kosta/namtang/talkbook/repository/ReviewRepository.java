package kosta.namtang.talkbook.repository;

import kosta.namtang.talkbook.model.domain.Review;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ReviewRepository extends CrudRepository<Review, Long> {

    List<Review> findByUserIdx(Long idx);

}
