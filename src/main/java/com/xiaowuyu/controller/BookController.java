package com.xiaowuyu.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.xiaowuyu.pojo.Books;
import com.xiaowuyu.pojo.Category;
import com.xiaowuyu.service.BookService;
import com.xiaowuyu.service.CategoryService;
import com.xiaowuyu.utils.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
/*@RequestMapping("/book")*/
public class BookController {

    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookService;

    @Autowired
    @Qualifier("CateSoryServiceImpl")
    private CategoryService categoryService;

    /*书详情信息页面跳转*/
    @RequestMapping("/BookInfo")
    public String BookInfo(Model model,Integer book_id) {
        System.out.println("我是："+book_id);
        Books books = bookService.queryBookByBook_id(book_id);
        model.addAttribute("book",books);
        return "BookInfo";
    }

    /*模糊搜索*/
    @RequestMapping("/BookS")
    public String BookNmae(Model model,String BookName) {
        System.out.println("我是："+BookName);
        List<Books> list = bookService.queryBookNmae(BookName);
        model.addAttribute("list",list);
        List<Category> categoriesList = categoryService.queryAllCartgory();
        model.addAttribute("clist", categoriesList);
        return "index";
    }


    /*书分类*/
    @RequestMapping("/BookClass")
    public String BookNmae(Model model,int category_id) {
        System.out.println("我是："+category_id);
        List<Books> list = bookService.queryBookCategory_id(category_id);
        model.addAttribute("list",list);
        List<Category> categoriesList = categoryService.queryAllCartgory();
        model.addAttribute("clist", categoriesList);
        return "index";
    }






    @RequestMapping("/allBook")
    public String list(Model model) {
        List<Books> list = bookService.queryAllBook();
        model.addAttribute("list", list);
        System.out.println(list);
        return "allBook";
    }

    /*查询所有书籍*/
    /*首页跳转*/
    @RequestMapping("/Index")
    public String allBooks(Model model) {
        List<Books> list = bookService.queryAllBook();
        List<Category> categoriesList = categoryService.queryAllCartgory();
        model.addAttribute("list", list);
        model.addAttribute("clist", categoriesList);
        return "index";
    }

    @RequestMapping("/allGoods")
    public String goodsList(Model model) {
        List<Books> list = bookService.queryAllBook();
        model.addAttribute("list", list);
        return "allGoods";
    }

    @RequestMapping("/toAddBook")
    public String toAddPaper() {
        return "addBook";
    }

    @RequestMapping("/addBook")
    public String addPaper(Books books) {
        System.out.println(books);
        bookService.addBook(books);
        return "redirect:/book/allBook";
    }

    @RequestMapping("/toUpdateBook")
    public String toUpdateBook(Model model, int book_id) {
        Books books = bookService.queryBookByBook_id(book_id);
        System.out.println(books);
        model.addAttribute("book",books );
        return "updateBook";
    }

    @RequestMapping("/updateBook")
    public String updateBook(Model model, Books book) {
        System.out.println(book);
        bookService.updateBook(book);
        Books books = bookService.queryBookByBook_id(book.getBook_id());
        model.addAttribute("books", books);
        return "redirect:/book/allBook";
    }

    @RequestMapping("/del/{book_id}")
    public String deleteBook(@PathVariable("book_id") int book_id) {
        bookService.deleteBookByBook_id(book_id);
        return "redirect:/book/allBook";
    }

    /**
     * 后台查询所以书籍
     */
    @RequestMapping("bookAll")
    public ModelAndView bookAll(){
        ModelAndView mv = new ModelAndView();
        List<Books> booksList = bookService.bookAll(null);
        mv.addObject("bookList",booksList);
        mv.setViewName("admin/bookadmin");
        return mv;
    }

    /**
     * 后台书籍搜索框模糊查询
     */
    @RequestMapping("bookByNameOrIdOrcategory")
    public ModelAndView bookByNameOrIdOrcategory(String bookname){
        ModelAndView mv = new ModelAndView();
        if (bookname==null||bookname==""){
            mv.setViewName("redirect:bookAll");
            return mv;
        }
        Books books=bookService.bookByNameOrIdOrcategory(bookname);
        List<Books> booksList = bookService.bookAll(books);
        mv.addObject("bookList",booksList);
        mv.setViewName("admin/bookadmin");
        return mv;
    }

    /**
     * 跳转书籍新增页面加载分类
     */
    @RequestMapping("bookAddOne")
    public ModelAndView bookAddOne(){
        ModelAndView mv = new ModelAndView();
        List<Category> categoryList = categoryService.queryAllCartgory();
        mv.addObject("categoryList",categoryList);
        mv.setViewName("admin/bookadmin_add");
        return mv;
    }

    /**
     * 书籍新增
     */
    @RequestMapping("bookAdd")
    @ResponseBody
    public void bookAdd(Books books, @PathVariable("book_image")MultipartFile formdata){
        System.out.println(books);
        System.out.println(formdata);
//        return null;
    }

}
