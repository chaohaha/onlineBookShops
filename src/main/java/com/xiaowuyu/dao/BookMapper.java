package com.xiaowuyu.dao;

import com.xiaowuyu.pojo.Books;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

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

    //书分类
    @Select("select *from books where category_id=#{category_id}")
    List<Books> queryBookCategory_id(Integer category_id);

    //查询全部Book,返回list集合
    List<Books> queryAllBook();

    /*模糊搜索*/
    @Select("select * from books where book_name like '%${bookName}%'")
    List<Books> queryBookNmae(String bookName);

    Books bookByNameOrIdOrcategory(String bookname);

    List<Books> bookAll(Books books);
}
