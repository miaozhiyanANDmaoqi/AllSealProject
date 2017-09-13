import com.dao.UserDao;
import com.domain.eneity.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyBatisSpringTest {
    private static ApplicationContext ctx;

    static
    {
        ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
    }

    public static void main(String[] args)
    {
        UserDao mapper = (UserDao)ctx.getBean("userMapper");
        //测试id=1的用户查询，根据数据库中的情况，可以改成你自己的.
        System.out.println("得到用户id=1的用户信息");
        User user = mapper.findUserByAccount("acc");
        System.out.println(user.getGender());

    }
}
