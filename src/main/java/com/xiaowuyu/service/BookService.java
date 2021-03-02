package com.xiaowuyu.service;

import com.xiaowuyu.pojo.Books;

import java.util.List;

//BookService:底下需要去实现,调用dao层
public interface BookService {

    //增加一个Book
    int addBook(Books books);

    //根据id删除一个Book
    int deleteBookByBook_id(int book_id);

    //更新Book
    int updateBook(Books books);

    //根据id查询,返回一个Book
    Books queryBookByBook_id(int Book_id);

    //查询全部Book,返回list集合
    List<Books> queryAllBook();
}
