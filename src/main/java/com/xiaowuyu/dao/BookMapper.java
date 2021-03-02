package com.xiaowuyu.dao;

import com.xiaowuyu.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {
    //增加一个Book
    int addBook(Books books);

    //根据id删除一个Book
    int deleteBookByBook_id(@Param("book_id") int book_id);

    //更新Book
    int updateBook(Books books);

    //根据id查询,返回一个Book
    Books queryBookByBook_id(@Param("book_id") int book_id);

    //查询全部Book,返回list集合
    List<Books> queryAllBook();
}
