package com.xiaowuyu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiaowuyu.pojo.*;
import com.xiaowuyu.service.*;
import com.xiaowuyu.utils.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
/*需要同一个头部，所以去掉*/
/*@RequestMapping("/order")*/
public class OrderController {
    @Autowired
    @Qualifier("OrderServiceImpl")
    private OrderService orderService;

    @Autowired
    @Qualifier("OrderItemServiceImpl")
    private OrderItemService orderItemService;

    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookService;

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    @Autowired
    @Qualifier("CartServiceImpl")
    private CartService cartService;

    /*直接购买  购买书*/
   /* @RequestMapping("/booksBuy")
    public String booksBuy(Model model, HttpSession session,String id) {
        session.setAttribute();
        Users users=(Users)session.getAttribute("user");
        List<Orders> list = orderService.queryAllUserOrder(users.getUser_id());
        model.addAttribute("list", list);
        return "Order";
    }*/

    /**
     * 提交订单
     * @return
     */
    @Transactional
    @RequestMapping("/booksBuy")
    @ResponseBody
    public Results deleteProduct(@RequestParam("ids[]") String[] ids,HttpSession session){
        ArrayList<String> strings = new ArrayList<String>();
        Double sumMoney=0.0;
        for (String id : ids) {
            Date date = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
            System.out.println(dateFormat);
            System.out.println("date=" + dateFormat.format(date.getTime()));
            System.out.println(id);
            int zid = Integer.parseInt(id);
            Cart cart = cartService.queryCartByCart_id(zid);
            /*购物车书id*/
            int book_id = cart.getBook_id();
            int user_id = cart.getUser_id();
            UUID uuid = UUID.randomUUID();
            String s = uuid.toString();
            strings.add(s);
            System.out.println(uuid);
            System.out.println("购物车"+cart);
            Double jia=cart.getCart_price()*cart.getCart_counts();
            Users users = userService.queryUserByUser_id(user_id);
            Books books = bookService.queryBookByBook_id(book_id);
            System.out.println("书"+books);
            /*添加订单表*/
            Orders orders = new Orders(s,users.getUser_id(),null,
                    null,jia,0,"",users,null);
            System.out.println("用户"+users);
            int i = orderService.addOrder(orders);
            System.out.println("订单表"+i);

            /*订单详情*/
            OrderItems orderItems = new OrderItems(0,
                    cart.getCart_counts(),book_id,cart.getBook_name(),jia,s);

            int i1 = orderItemService.addOrderItem(orderItems);
            System.out.println("订单详情表"+i1);
            int i2 = cartService.deleteByCart_id(cart.getCart_id());
            System.out.println("购物车删除"+i2);
            if (cart.getCart_counts()==0){
                strings=null;
                int k=1/0;
            }
            int i3 = bookService.upBook(book_id, cart.getCart_counts());
            System.out.println("减库存"+i3+",cart.getCart_counts()");
            sumMoney+=jia;
        }

        session.setAttribute("ordid",strings);
        return Results.setSuccess(sumMoney,"跳转支付页面！");
        /*return "redirect:/allCart";*/
    }


    /*需要得到登陆完成的 session 得user的id*/
    @RequestMapping("/allUserOrder")
    public String list(Model model, HttpSession session) {
        Users users=(Users)session.getAttribute("user");
        if (null==users){
            return "redirect:/toLogin";
        }
        List<Orders> list = orderService.queryAllUserOrder(users.getUser_id());
        model.addAttribute("list", list);
        System.out.println(list);
        return "Order";
    }

    @RequestMapping("/toAddOrder")
    public String toAddPaper() {
        return "addOrder";
    }

    @RequestMapping("/addOrder")
    public String addPaper(Orders orders) {
        System.out.println(orders);
        orderService.addOrder(orders);
        return "redirect:/order/allUserOrder";
    }

    /*删除订单*/
    @RequestMapping("/deleteOrderByOrderId")
    public String toUpdateOrder(String orderId) {
        System.out.println(orderId);
        int i = orderService.deleteOrderByOrder_id(orderId);
        System.out.println(i);
        return "redirect:/allUserOrder";
    }

    /*更新订单*/

    @RequestMapping("/updateOrderComplete")
    @ResponseBody
    public Results updateOrderComplete(String orderId) {
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        String format1 = dateFormat.format(date.getTime());
        System.out.println(orderId);
        Orders orders = new Orders();
        String format = dateFormat.format(date.getTime());
        System.out.println(format);
        orders.setOrder_complete_time(format1);
        orders.setOrder_id(orderId);
        orders.setOrder_status(2);
        int i = orderService.updateOrderSend(orders);
        orderService.orderUpdateByID(orderId);
        System.out.println(i);
        return Results.setSuccess("","收货成功！");
    }


   /* @RequestMapping("/updateOrder")
    public String updateOrder(Model model, Orders order) {
        System.out.println(order);
        orderService.updateOrder(order);
        Orders orders = orderService.deleteOrderByOrder_id(order.getOrder_id());
        model.addAttribute("orders", orders);
        return "redirect:/order/allOrder";
    }*/

    /*@RequestMapping("/del/{order_id}")
    public String deleteOrder(@PathVariable("order_id") int order_id) {
        orderService.deleteOrderByOrder_id(order_id);
        return "redirect:/order/allOrder";
    }*/

    /**
     * 后台查询所以订单
     * @param page
     * @param pageSize
     * @return
     */
  /*  @RequestMapping("orderAll")
    public ModelAndView orderAll(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,
                                 @RequestParam(name = "size",required = true,defaultValue = "5") Integer pageSize){
        ModelAndView mv = new ModelAndView();
        PageHelper.startPage(page,pageSize);
        List<Orders> ordersList=orderService.orderAll();
        PageInfo<Orders> pageInfo = new PageInfo<Orders>(ordersList,pageSize);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("admin/orderadmin");
        return mv;
    }*/

    /**
     * 通过订单id和用户id和状态查询
     */
    @RequestMapping("/orderAll")
    public ModelAndView orderByIdANdUserIDAndstatus(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,
                                                    @RequestParam(name = "size",required = true,defaultValue = "5") Integer pageSize,
                                                    String orderSel,String order_create_time){
        ModelAndView mv=new ModelAndView();
        System.out.println("1"+orderSel);
        System.out.println("2"+order_create_time);
        if (orderSel==""){
            orderSel=null;
        }
        if (orderSel != null){
            mv.addObject("orderSel",orderSel);
            if ("未发货".equals(orderSel)){
                orderSel="0";
            }else if ("已发货".equals(orderSel)){
                orderSel="1";
            }else if ("已确认收货".equals(orderSel)){
                orderSel="2";
            }else if ("未付款".equals(orderSel)){
                orderSel="4";
            }
            System.out.println("几个查"+orderSel);
            PageHelper.startPage(page,pageSize);
            List<Orders> ordersList=orderService.orderByIdANdUserIDAndstatus(orderSel);
            PageInfo<Orders> pageInfo = new PageInfo<Orders>(ordersList,pageSize);
            mv.addObject("pageInfo",pageInfo);
            mv.setViewName("admin/orderadmin");
            return mv;
        }
        if (order_create_time !=null){
            System.out.println("日期查");
            System.out.println(order_create_time);
            PageHelper.startPage(page,pageSize);
            List<Orders> ordersList=orderService.orderByDate(order_create_time);
            System.out.println(ordersList.size());
            PageInfo<Orders> pageInfo = new PageInfo<Orders>(ordersList,pageSize);
            mv.addObject("pageInfo",pageInfo);
            mv.addObject("order_create_time",order_create_time);
            mv.setViewName("admin/orderadmin");
            return mv;
        }
        System.out.println("查所以");
        PageHelper.startPage(page,pageSize);
        List<Orders> ordersList=orderService.orderAll();
        PageInfo<Orders> pageInfo = new PageInfo<Orders>(ordersList,pageSize);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("admin/orderadmin");
        return mv;
    }

    /**
     * 订单详情
     */
    @RequestMapping("/orderByIdAll")
    public ModelAndView orderByIdAll(String order_id){
        ModelAndView mv = new ModelAndView();
        System.out.println(order_id);
        Orders orders=orderService.orderByIdAll(order_id);
        mv.addObject("orders",orders);
        mv.setViewName("admin/orderadmin_all");
        return mv;
    }

    /**
     * 修改查询
     */
    @RequestMapping("/orderByIdUpdate")
    public ModelAndView orderByIdUpdate(String order_id){
        ModelAndView mv = new ModelAndView();
        System.out.println(order_id);
        Orders orders=orderService.orderByIdAll(order_id);
        mv.addObject("orders",orders);
        mv.setViewName("admin/orderadmin_update");
        return mv;
    }

    /**
     * 后台订单删除传ajax
     * @param order_id
     * @return
     */
    @RequestMapping("/orderDelete")
    @ResponseBody
    public Results orderDelete(String order_id) {
        System.out.println(order_id);
        int i = orderService.deleteOrderByOrder_id(order_id);
        if (i>0){
            return Results.setSuccess("","删除成功！");
        }
        return Results.setSuccess("","删除失败");
    }

    /**
     * 订单修改
     */
    @RequestMapping("/orderUpdate")
    public ModelAndView orderUpdate(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,
                                    @RequestParam(name = "size",required = true,defaultValue = "5") Integer pageSize,
                                    Orders orders){
        ModelAndView mv = new ModelAndView();
        int i=orderService.orderUpdate(orders);
        if (i>0){
            if (orders.getOrder_status()==2){
                 i = orderService.orderUpdateByID(orders.getOrder_id());
            }
            if (i>0){
                PageHelper.startPage(page,pageSize);
                Orders orders1 = orderService.orderByIdAll(orders.getOrder_id());
                ArrayList<Orders> ordersList = new ArrayList<Orders>();
                ordersList.add(orders1);
                PageInfo<Orders> pageInfo = new PageInfo<Orders>(ordersList,pageSize);
                mv.addObject("pageInfo",pageInfo);
                mv.setViewName("admin/orderadmin");
            }
        }
        return mv;
    }

//    @RequestMapping("/orderByDate")
//    public ModelAndView orderByDate(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,
//                                    @RequestParam(name = "size",required = true,defaultValue = "5") Integer pageSize,
//                                    String order_create_time,String order_create_time1){
//        ModelAndView mv =new ModelAndView();
//        if (order_create_time.length()==0 && order_create_time1.length()==0){
//            PageHelper.startPage(page,pageSize);
//            List<Orders> ordersList=orderService.orderAll();
//            PageInfo<Orders> pageInfo = new PageInfo<Orders>(ordersList,pageSize);
//            mv.addObject("pageInfo",pageInfo);
//            mv.setViewName("admin/orderadmin");
//            return mv;
//        }
//        if (order_create_time.length()==0){
//            order_create_time=order_create_time1;
//        }
//        System.out.println(order_create_time);
//        PageHelper.startPage(page,pageSize);
//        List<Orders> ordersList=orderService.orderByDate(order_create_time);
//        System.out.println(ordersList.size());
//        PageInfo<Orders> pageInfo = new PageInfo<Orders>(ordersList,pageSize);
//        mv.addObject("pageInfo",pageInfo);
//        mv.addObject("order_create_time",order_create_time);
//        mv.setViewName("admin/orderadmin");
//        return mv;
//    }

}
