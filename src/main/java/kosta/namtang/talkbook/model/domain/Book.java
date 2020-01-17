package kosta.namtang.talkbook.model.domain;

import lombok.*;
import org.hibernate.annotations.ColumnDefault;

import javax.annotation.Nullable;
import javax.persistence.*;
import java.awt.geom.NoninvertibleTransformException;
import java.math.BigDecimal;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString(exclude = "category")
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "Book_seq_no")
    @SequenceGenerator(sequenceName = "Book_seq_no",name="Book_seq_no",allocationSize = 1)
    private Long bookIdx;
    private String bookTitle;
    private String bookImg;
    private String bookAuthor;
    private BigDecimal bookPrice;
    private String bookPublisher;
    private String bookDesc;
    private String bookPubdate;
    @ColumnDefault("0")
    private int bookType;
    private String bookIsbn;

    @ManyToOne
    @JoinColumn(name="catgIdx")
    private Category category;


}