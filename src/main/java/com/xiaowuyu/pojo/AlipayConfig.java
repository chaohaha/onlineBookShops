package com.xiaowuyu.pojo;

public class AlipayConfig {
        // 应用ID,支付宝提供的APPID，上面截图中有提到
        public static String app_id = "2021000117617919";


        // 商户私钥，您的PKCS8格式RSA2私钥
        public static String merchant_private_key = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDEfGRqFfwazxNvGS7f9jkUBQoW1XkWwinUUedI8zjbyV3l1VXL2Kqdbik+IA5HcLTZsc38CYq++1OPI/eCbNz1LgZ7guegZceHNmwP+ULMgy9R8A94ApeOrjlkabojDnmQqbywB1mkVMbnWUDSzi9Unr0iZnwtvnMazbl9WTDLQYsnitFrr9V/81xo+Yew5vAzEOhTtAUYNb/XemihX9T6Q5Bf88K76BKWD00imyVu0xYIFQnly+Buabg3krwgV/jimR3cuE3J/gG40v9LOIHWuFSTUS5J8QgxA1cWDGRKNu2h7q34ojTSrkJADAod8K+WwUKyP818whMDleP6Lf6BAgMBAAECggEBAKSVTcdPAw2xxyWYgps3NDiAwCLATd2yZjdjI8kHcuknk2+hc2x84O1eCU3wrAVLczGmrlQf6ghvnV6ZUgn+BleZZfSvgjXpC2lHPN1kfX+xo0GPRGXSRgFODuT9at1SkqGKjHMmtP/hw3qmWJY7/4lyLhtSnVHz5ZbeHDHTM/wMQzCFGVZTtqtWmzmetupJ6c3U8h1m8X3pLX69x7uvbNIIfGKbIlGXnrPJZ17LOFGQyotCLUAKBCIuE1aDostA52y7nmiaZCeB1OtEgvm82aeFLV0vUJbQJI7FoqxQz/ipyuiu+rsLDBrGGJV3x5mC9Nu0X8VmUzY8OGWzmg+PycECgYEA4zcRJ/YisX0lttDG0nFhbaNqSAkjo4y7helE6Zsr1Rixk1QTKYA9vqYa2tAkhriaI9rqHVCBXjszfo1FNGQpVnWD6PKDSqf4/VpzALILtqn8H9TpCc92unhPsLo87sX6saRBat1xUA13kOQceFFuQxsqDIsBkJ1sisWSVWDL0F8CgYEA3WC6+kmK/anzcgkK3JosZur76PREpzYk47bxMcE6AOs+zSrOl/rarR9L/byzi9l46H68YaRUQ3eybnhtpTZ0+5nDJ3b2WgyT2DX3BWV36fhJgHc9n3zvxG/n323ZxefyzDU3zddXEATsb7g7PdowbkedzHRdiRGzejS0sPs7HR8CgYEA3eysMhbjXe55Rq12dJdPbPHe3gsnJxhPFIV5zJ3F2zZqQxcsPC3IoQzGUBBajMeDrh+k6Qr3wJ0cN7At9vUZtxvCwmUUPXgA5xxQFU7RyBERc9nV38ImGg1m8JuG5kSzDoz7ZDBz+5ebwAY9lHscsii3Elc3KRPJr2U3/3IywAsCgYEAkObs3EDhElJ4v869ZlIf+CmdRAkHGu/sy4SGcYvJvKo+jCqV2ZLgKetPYUFvwH1Tj9LM2ZincxXZHEgFdNulTL6Dp8RNUfnjl+US0FxvVh0nd0gVdNxhUJHzEyMjJVBCc3nuEfT+zsR6QlIzrLOxea200wvj4YFNmhL/psx7D/8CgYB7viCDSu6YmhsaSri6GDZc/51QX/r0+iUp9XbPd0iUzjl2uOOLultj1yx3qsi/yd8emKt2H2XYbjv0WfomBhfR8Q4o/sn4K0XbTxXLLzPNRR/xHn2+ffp79x6pdFvx9Xo0C3dAnyTGkbzSe8dm/6r5YHdG4UbbKxX/kMhixAjz1w==";

        // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/appDaily.htm 对应APPID下的支付宝公钥。
        public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhi6d/h0+xk3QD0sEBlTsZyBcMdPatEovOPFrCfzSbObRYTgXVPbPzKNyVEQHpgCJB678wyiKjzdazUrMqWvP271jJlbkbqYf52geWGUh47oqzxiYVzKRn7aWq2h/ocNTkE3UvvKiZQoWMasCcy8YFCrhziHh4YomeUG+5+uUKAfzVe860UeidBHMxPhe3TqrM2j/23M+f94eonfIon6rzAZwy0+ICXBstxyAp84bnV/t+9EUB1RGIsr4ftoY4Sgqp9XiJA80tAu/SE/YL/bs2dpEHY6EQ0XGr+XXaj68Fyqt6Mfkpoxn0ZgzOSrl716N0EC388T5aivz7zjpjqi+BwIDAQAB";

        // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问.如果只是测试使用,那么设置成自己项目启动后可以访问到的一个路径,作为支付宝发送通知的路径(有什么用暂时没发现)

        public static String notify_url = "http://localhost:8888/onlineBookShops_war_exploded/allCart";

        // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问.如果只是测试使用,那么设置成自己项目启动后可以访问到的一个路径.是支付正常完成后,会访问的路径.
        public static String return_url = "http://localhost:8888/onlineBookShops_war_exploded/PaymentCompleted";

        // 签名方式，注意这里，如果步骤设置的是RSA则用RSA,如果按照扇面步骤做的话,选择RSA2
        public static String sign_type = "RSA2";
        // 字符编码格式
        public static String charset = "utf-8";
        // 支付宝网关
        public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";


}

