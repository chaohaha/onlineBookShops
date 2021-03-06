package com.xiaowuyu.service;

import com.xiaowuyu.pojo.Books;
import org.apache.ibatis.annotations.Select;

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

    /*查询分类*/
    List<Books> queryBookCategory_id(Integer category_id);


    /*模糊搜素*/

    List<Books> queryBookNmae(String bookName);

    List<Books> bookByNameOrIdOrcategory(String bookname);

    List<Books> bookAll(List<Books> books);

    /*修改书籍库存*/
    int upBook(int books_id,int sl);

    int bookAdd(Books books);

    int bookDelete(int book_id);

    String bookAllById(int book_id);

    Books bookAllByBID(int book_id);

    int bookUpdate(Books books);

    int updateBookSales(Books books);
}
