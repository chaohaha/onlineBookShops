package com.xiaowuyu.controller;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.xiaowuyu.pojo.AlipayConfig;
import com.xiaowuyu.pojo.Orders;
import com.xiaowuyu.service.OrderService;
import jdk.nashorn.internal.ir.RuntimeNode;
import org.junit.runner.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class PaymentController {

    @Autowired
    @Qualifier("OrderServiceImpl")
    private OrderService orderService;

    @RequestMapping("/toPay")//设置请求的路径
    @ResponseBody//记得加上,否则无法正常调用
    public String toPay(String sumMoney/*, @RequestParam("ids[]") String[] ids,HttpSession session*/) throws Exception{
        /*System.out.println(ids);
        System.out.println(id);
        System.out.println(sumMoney);
        session.setAttribute("ids",ids);*/
       /* byte[] serialize = SerializeUtil.serialize(orderIds);
        redisServer.setCacheValueForTime(uuid,serialize,1000*60*60*30);*/
        //获得初始化的AlipayClient,将上面创建的配置类中的变量设置到该对象中
        UUID uuid = UUID.randomUUID();
        String id = uuid.toString();
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
        //设置请求参数,并把配置类中的两个路径设置进去
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
        //如果想正常调用接口则需要传一些必要参数,out_trade_no:订单号,保证唯一性,支付宝根据该参数生成你的支付单号,total_amount:需要支付的金额,注意是String型,且金额计数的分割","不能存在(例如1,000就是错误的参数),subject:对物品进行描述,product_code:是支付类型.更多详细的参数信息参考链接: [https://docs.open.alipay.com/api_1/alipay.trade.page.pay](https://docs.open.alipay.com/api_1/alipay.trade.page.pay)
        try {
            alipayRequest.setBizContent("{\"out_trade_no\":\""+id +"\","
                    + "\"total_amount\":\""+sumMoney +"\","
                    + "\"subject\":\""+ "测试支付" +"\","
                    + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
            //请求
            String result;
            //发送请求并返回
            result = alipayClient.pageExecute(alipayRequest).getBody();
            //System.out.println("*********************\n返回结果为："+result);
            return result;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return "支付失败！";
        }
    }
    @RequestMapping("/PaymentCompleted")
    public String PaymentCompleted(HttpSession session){
        Object ordid = session.getAttribute("ordid");
        System.out.println("的到session");
        List<String> result = new ArrayList<String>();
        if (ordid instanceof ArrayList<?>) {
            for (Object o : (List<?>) ordid) {
                result.add(String.class.cast(o));
            }
        }
        for (String s : result) {
            Orders orders = new Orders();
            orders.setOrder_id(s);
            orders.setOrder_status(0);
            int i = orderService.updateOrderSend(orders);
            System.out.println("订单更新"+i);
            System.out.println("我转成了list"+s);
        }

        return "redirect:allUserOrder";
    }


    @RequestMapping("/toPay1")//设置请求的路径
    @ResponseBody//记得加上,否则无法正常调用
    public String toPay1(String sumMoney,String id,HttpSession session) throws Exception{
        ArrayList<String> strings = new ArrayList<String>();
        strings.add(id);
        session.setAttribute("ordid",strings);
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
        //设置请求参数,并把配置类中的两个路径设置进去
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
        //如果想正常调用接口则需要传一些必要参数,out_trade_no:订单号,保证唯一性,支付宝根据该参数生成你的支付单号,total_amount:需要支付的金额,注意是String型,且金额计数的分割","不能存在(例如1,000就是错误的参数),subject:对物品进行描述,product_code:是支付类型.更多详细的参数信息参考链接: [https://docs.open.alipay.com/api_1/alipay.trade.page.pay](https://docs.open.alipay.com/api_1/alipay.trade.page.pay)
        try {
            alipayRequest.setBizContent("{\"out_trade_no\":\""+id +"\","
                    + "\"total_amount\":\""+sumMoney +"\","
                    + "\"subject\":\""+ "测试支付" +"\","
                    + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
            //请求
            String result;
            //发送请求并返回
            result = alipayClient.pageExecute(alipayRequest).getBody();
            //System.out.println("*********************\n返回结果为："+result);
            return result;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return "支付失败！";
        }
    }

}
