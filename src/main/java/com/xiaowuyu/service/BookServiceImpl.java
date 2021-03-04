package com.xiaowuyu.service;

import com.xiaowuyu.dao.BookMapper;
import com.xiaowuyu.pojo.Books;

import java.util.List;

public class BookServiceImpl implements BookService {

    //调用dao层的操作，设置一个set接口，方便Spring管理
    private BookMapper bookMapper;

    public void setBookMapper(BookMapper bookMapper) {
        this.bookMapper = bookMapper;
    }

    public int addBook(Books books) {
        return bookMapper.addBook(books);
    }

    public int deleteBookByBook_id(int book_id) {
        return bookMapper.deleteBookByBook_id(book_id);
    }

    public int updateBook(Books books) {
        return bookMapper.updateBook(books);
    }

    public Books queryBookByBook_id(int book_id) {
        return bookMapper.queryBookByBook_id(book_id);
    }

    public List<Books> queryAllBook() {
        return bookMapper.queryAllBook();
    }

    public List<Books> queryBookCategory_id(Integer category_id) {
        return bookMapper.queryBookCategory_id(category_id);
    }

    public List<Books> queryBookNmae(String bookName) {
        return bookMapper.queryBookNmae(bookName);
    }

    public int upBook(int books_id,int sl) {
        int i = bookMapper.upBook(books_id, sl);
        return i;
    }
}
