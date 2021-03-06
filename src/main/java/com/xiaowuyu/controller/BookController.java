package com.xiaowuyu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Mod;
import com.xiaowuyu.pojo.Books;
import com.xiaowuyu.pojo.Category;
import com.xiaowuyu.service.BookService;
import com.xiaowuyu.service.CategoryService;
import com.xiaowuyu.utils.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.awt.print.Book;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
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
    public String BookNmae(Model model,
                           @RequestParam(name = "page",required = true,defaultValue = "1") Integer page,
                           @RequestParam(name = "size",required = true,defaultValue = "8") Integer pageSize,
                           String BookName) {
        System.out.println("我是："+BookName);
        List<Category> categoriesList = categoryService.queryAllCartgory();
        model.addAttribute("clist", categoriesList);
        PageHelper.startPage(page,pageSize);
        List<Books> list = bookService.queryBookNmae(BookName);
        PageInfo<Book> lists = new PageInfo(list);
        model.addAttribute("pageInfo",lists);
        return "index";
    }


    /*书分类*/
    @RequestMapping("/BookClass")
    public String BookNmae(Model model,
                           @RequestParam(name = "page",required = true,defaultValue = "1") Integer page,
                           @RequestParam(name = "size",required = true,defaultValue = "8") Integer pageSize,
                           int category_id) {
        List<Category> categoriesList = categoryService.queryAllCartgory();
        model.addAttribute("clist", categoriesList);
        PageHelper.startPage(page,pageSize);
        System.out.println("我是："+category_id);
        List<Books> list = bookService.queryBookCategory_id(category_id);
        PageInfo<Book> lists = new PageInfo(list);
        model.addAttribute("pageInfo",lists);
        return "index";
    }

    @RequestMapping("/Index")
    public ModelAndView allBooks(
               @RequestParam(name = "page",required = true,defaultValue = "1") Integer page,
               @RequestParam(name = "size",required = true,defaultValue = "8") Integer pageSize){
        ModelAndView modelAndView = new ModelAndView();
        List<Category> categoriesList = categoryService.queryAllCartgory();
        modelAndView.addObject("clist",categoriesList);
        PageHelper.startPage(page,pageSize);
        List<Books> booksList = bookService.queryAllBook();
        PageInfo<Book> pageInfo = new PageInfo(booksList);
        System.out.println(pageInfo.getList().size());
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("index");
        return modelAndView;
    }

    /*查询所有书籍*//*
    *//*首页跳转*//*
        @RequestMapping("/Index")
        public String allBooks(Model model) {
            List<Books> list = bookService.queryAllBook();
            List<Category> categoriesList = categoryService.queryAllCartgory();
            model.addAttribute("pageInfo", list);
            model.addAttribute("clist", categoriesList);
            return "index";
        }*/

    /*@RequestMapping("/allGoods")
    public String goodsList(Model model) {
        List<Books> list = bookService.queryAllBook(0,0);
        model.addAttribute("list", list);
        return "allGoods";
    }*/

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
   /* @RequestMapping("bookAll")
    public ModelAndView bookAll(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,
                                 @RequestParam(name = "size",required = true,defaultValue = "5") Integer pageSize){
        ModelAndView mv = new ModelAndView();
        PageHelper.startPage(page,pageSize);
        List<Books> booksList = bookService.bookAll(null);
        PageInfo<Books> pageInfo = new PageInfo<Books>(booksList,pageSize);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("admin/bookadmin");
        return mv;
    }*/

    @RequestMapping("bookUpdateAll")
    public ModelAndView bookUpdateAll(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,
                                @RequestParam(name = "size",required = true,defaultValue = "5") Integer pageSize,
                                      Books books){
        ModelAndView mv = new ModelAndView();
        ArrayList<Books> books1 = new ArrayList<Books>();
        books1.add(books);
        PageHelper.startPage(page,pageSize);
        List<Books> booksList = bookService.bookAll(books1);
        PageInfo<Books> pageInfo = new PageInfo<Books>(booksList,pageSize);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("admin/bookadmin");
        return mv;
    }

    /**
     * 后台书籍搜索框模糊查询
     */
    @RequestMapping("/bookAll")
    public ModelAndView bookByNameOrIdOrcategory(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,
                                                 @RequestParam(name = "size",required = true,defaultValue = "5") Integer pageSize,
                                                 String bookname){
        ModelAndView mv = new ModelAndView();
        if (bookname==null||bookname==""){
            PageHelper.startPage(page,pageSize);
            List<Books> booksList = bookService.bookAll(null);
            PageInfo<Books> pageInfo = new PageInfo<Books>(booksList,pageSize);
            mv.addObject("pageInfo",pageInfo);
            mv.setViewName("admin/bookadmin");
            return mv;
        }
        List<Books> books=bookService.bookByNameOrIdOrcategory(bookname);
        System.out.println(books.size());
        PageHelper.startPage(page,pageSize);
        List<Books> booksList = bookService.bookAll(books);
        PageInfo<Books> pageInfo = new PageInfo<Books>(booksList,pageSize);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("bookname",bookname);
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
    public Results bookAdd(@RequestParam("book_image")MultipartFile uploadFile, String book_name, String book_author,
                        String category_id, double book_price, int book_counts, String book_details,
                        HttpServletRequest request){
        String path = request.getSession().getServletContext().getRealPath("upload");//获取路径
        String fileName = uploadFile.getOriginalFilename();//获取上传文件的名字
        Date d = new Date();
        long time=d.getTime();
        //取文件扩展名
        String ddname=fileName.substring(fileName.lastIndexOf("."));
        //得到文件名
        fileName=time+ddname;
        System.out.println(fileName);
        File targetFile = new File(path,fileName);
        if(!targetFile.exists()){
            targetFile.mkdirs();//是否存在目录，不存在就创建
        }
        //保存
        try {
            uploadFile.transferTo(targetFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Books books = new Books(0,book_name,book_author,category_id,book_price,book_counts,0,fileName,book_details,0,null);
        int i=bookService.bookAdd(books);
        if(i>0){
            return Results.setSuccess("","书籍新增成功");
        }
        return Results.setSuccess("","书籍新增失败");
    }

    /**
     * 书籍删除
     */
    @RequestMapping("bookDelete")
    @ResponseBody
    public Results bookDelete(int book_id,HttpServletRequest request){
        String path = request.getSession().getServletContext().getRealPath("upload");//获取路径
        String fileName = bookService.bookAllById(book_id);//获取数据库文件的名字
        File targetFile = new File(path,fileName);
        if (targetFile.exists()){
            targetFile.delete();//判断文件存不存，存在就删除
        }
       int i=bookService.bookDelete(book_id);
       if (i>0){
           return Results.setSuccess("","删除成功！");
       }
       return Results.setSuccess("","删除失败！");
    }


    /**
     *通过id查询书本信息
     */
    @RequestMapping("bookUpdateOne")
    public String bookUpdateOne(int book_id,Model model){
        Books books=bookService.bookAllByBID(book_id);
        List<Category> categoryList = categoryService.queryAllCartgory();
        model.addAttribute("books",books);
        model.addAttribute("categoryList",categoryList);
        return "admin/bookadmin_update";
    }

    @RequestMapping("bookUpdate")
    @ResponseBody
    public Results bookUpdate(@RequestParam("book_image")MultipartFile uploadFile, String book_name, String book_author,
                              String category_id, double book_price, int book_counts, String book_details,int book_id,
                              int book_type,HttpServletRequest request){
        String path = request.getSession().getServletContext().getRealPath("upload");//获取路径
        String fileName1 = bookService.bookAllById(book_id);//获取数据库文件的名字
        System.out.println("有无编号："+fileName1);
        if (fileName1.length()>0){
            File targetFile1 = new File(path,fileName1);
            if (targetFile1.exists()){
                targetFile1.delete();//判断文件存不存，存在就删除
            }
            if(!targetFile1.exists()){
                targetFile1.mkdirs();//是否存在目录，不存在就创建
            }
            if(!targetFile1.exists()){
                targetFile1.mkdirs();//是否存在目录，不存在就创建
            }
            try {
                uploadFile.transferTo(targetFile1);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            String fileName2 = uploadFile.getOriginalFilename();
            Date d = new Date();
            long time=d.getTime();
            //取文件扩展名
            String ddname=fileName2.substring(fileName2.lastIndexOf("."));
            //得到文件名
            fileName2=time+ddname;
            File targetFile2 = new File(path,fileName2);
            fileName1=fileName2;
            System.out.println("空图片的编号"+fileName1);
            if(!targetFile2.exists()){
                targetFile2.mkdirs();//是否存在目录，不存在就创建
            }
            try {
                uploadFile.transferTo(targetFile2);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        Books books = new Books(book_id,book_name,book_author,category_id,book_price,book_counts,0,fileName1,book_details,book_type,null);
        int i=bookService.bookUpdate(books);
        if(i>0){
            return Results.setSuccess("","书籍修改成功");
        }
        return Results.setSuccess("","书籍修改失败");
    }

}
