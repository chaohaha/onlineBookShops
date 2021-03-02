import com.xiaowuyu.dao.UserMapper;
import com.xiaowuyu.pojo.Users;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml","classpath:spring/spring-service.xml"})
public class DaoTest {

    @Autowired
    private UserMapper mapper;

    @Test
    public void test1(){
        Users users = mapper.queryUserByUser_id(1);
        System.out.println(users.getUser_limit());
    }

}
