package com.xiaowuyu.pojo;

public class AlipayConfig {
        // 应用ID,支付宝提供的APPID，上面截图中有提到
        public static String app_id = "2021000117617919";





        // 商户私钥，您的PKCS8格式RSA2私钥
        public static String merchant_private_key =
                "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCfVbiUKKFGHhMJNNXSeqrUA6swo50p27XhqIuMa/QvatmI4M2RxbcdlBj9uP2Xbn8FBZ+gvt9fpWYpKJKCeQ9tgdIu/1P6o6jBgF8ubKCIDahF0Js2obqlniBB0NMlKxqvawe6Nq5UJs06WiZQ+vx/Mdzr7EOzgy2EAm+zOWkZl2eKi0/0ITaeoJaQCgBpi4eUCLHwXpHzYriQsiCI5oPbM89FKdwgdygkYPRxcN6lKkRwCYTdtzdqAbnMCxoRUgJmLAWiB6FhWSh/akLUuLmZlkZRCO+9DV6SZb42ruyAUXVMAbAQer4AOhW56IpxrnWuBqwKrhXlOB1FG/RDZEANAgMBAAECggEAci9GRbcQTGWFEtXwXhRWk/XFGuhF2xd/MqZMy2cZ6VlTZ8pix5K/dc0KU9ncskcXdAvhp5riDXNE0T4oMKR9L+cXL2L/VeEvMOzESUrDiHzxGIc0lGQ2lDXLvB7hEgPf7dJwCTzilZ/w915fky0rAiRDxDbfFahuV+o/DluYPCOow8C6BUe0PNRCToAx0mvk5omC/PYVSJNMoN/pyp8s5sj7BRVZiwmmaJcXNkjdsKT0ISJx6Xdz3hnoICJn9De8bf+aOgCbgw+HdmIY9p86yrx6IVGjR9w6g2NtopBCIGBH/0wCT+efDaaokk7ekjr8gYAEXq5xi9hPqFU61a/oAQKBgQDVOa8zLH8x59nLt/8sVvUJKuhhNBC5/MPNx8RYs6FJG2ha0K87zrrbS6JPOeHV35IF+AIjsyXzCtroSmc4sNDC8LaYfDc+I+FOT2tvi+aaUwPhhGgn/IQgYtTFpM8G4yPB9MUZY73HNZYOoTALWBlQNYJ5Q7BF5i97V/JhUZO3DQKBgQC/THVYXg2mzjZJZ/5xSm1KMKpD/Td47m45dce1e6IMKAkanYg0w0/ShQNTb/ZyMSrPfbdeItpHL8v2yhEc6uaxmVilKWr5PyFjvj2ZiQeTT7usSuEu30UmbDCbZQxWrlA+0SBYS/zXdCZX0+yiMmACKHxROK3FvICr88kiCGBtAQKBgDaHYf68SmsA1/n5PBCizFdj2bnCDuUBdzGQ/O2SQpTnpXBUHfw1iiO62+9W5iJD4pwUKLfogLP++qydGnis/zZbSNcGLTp/Aod8WAVWycp9oGhz7A8NzNxbaf6Bf1BLlkFrz1wG3emsEov7PMYp6Y9Rn+RTIyk9DLeGbj3lFtmhAoGAVc1ieK8+6kll2gj1/DSIzpUDWZlyzyAKemVUnRcF+PPgGXr9A8VywRb+BeebH17kN8rIe0Wgp/tNPbUmddT6gkAonXP1UjQ5srY6hOoMZsuFfuLbG53zMyelqZ1qKlrnDTXZjyEOGEk1hYE9iwaTP4SPNhL5Bk7lW7rtxQEC1wECgYAvqEgApQf93F6cOc7r0epkekQ0psOYPrm/OdwyPnj9v6ySvYFrE5EH58NB638LkH0q4QVX36b3BvhI8a8M4ogQe5guAqU2Z9l8W4b9sMoyTT5a38f/v9cKxyZEcnLwqsCyUXDzq/mCJk0vpaYFi0vy9Xh9Omtxen2FRBROMQrJuw==";
        // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/appDaily.htm 对应APPID下的支付宝公钥。
        public static String alipay_public_key =
                "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhi6d/h0+xk3QD0sEBlTsZyBcMdPatEovOPFrCfzSbObRYTgXVPbPzKNyVEQHpgCJB678wyiKjzdazUrMqWvP271jJlbkbqYf52geWGUh47oqzxiYVzKRn7aWq2h/ocNTkE3UvvKiZQoWMasCcy8YFCrhziHh4YomeUG+5+uUKAfzVe860UeidBHMxPhe3TqrM2j/23M+f94eonfIon6rzAZwy0+ICXBstxyAp84bnV/t+9EUB1RGIsr4ftoY4Sgqp9XiJA80tAu/SE/YL/bs2dpEHY6EQ0XGr+XXaj68Fyqt6Mfkpoxn0ZgzOSrl716N0EC388T5aivz7zjpjqi+BwIDAQAB";
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

