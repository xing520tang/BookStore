package com.tinyspot.bs.test;

import java.text.DateFormat;
import java.text.DateFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tinyspot.bs.bean.BOrderInfo;
import com.tinyspot.bs.bean.Book;
import com.tinyspot.bs.bean.BookExample;
import com.tinyspot.bs.bean.BookExample.Criteria;
import com.tinyspot.bs.bean.Bookcategory;
import com.tinyspot.bs.bean.Md5;
import com.tinyspot.bs.bean.Order;
import com.tinyspot.bs.bean.OrderInfo;
import com.tinyspot.bs.bean.Shop;
import com.tinyspot.bs.bean.TRole;
import com.tinyspot.bs.bean.User;
import com.tinyspot.bs.dao.BookMapper;
import com.tinyspot.bs.dao.BookcategoryMapper;
import com.tinyspot.bs.dao.OrderMapper;
import com.tinyspot.bs.dao.ShopMapper;
import com.tinyspot.bs.dao.TRoleMapper;
import com.tinyspot.bs.dao.UserMapper;
import com.tinyspot.bs.service.BookServce;
import com.tinyspot.bs.service.OrderService;
import com.tinyspot.bs.service.UserService;

/**
 * 测试dao层的工作
 * @author TinySpot
 *推荐spring的项目可以使用spring的单元测试，可以自动注入我们需要的组件
 *1.导入SpringTest模块
 *2.@ContextConfiguration指定spring的配置文件
 *3.直接autowired要使用的组件即可
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
	
		@Autowired
		UserMapper userMapper;
		
		@Autowired
		TRoleMapper tRoleMapper;
		
		@Autowired
		ShopMapper shopMapper;
		
		@Autowired
		BookcategoryMapper bookcategoryMapper;
		
		@Autowired
		BookMapper bookMapper;
		
		@Autowired
		OrderMapper orderMapper;
		
		@Autowired
		BookServce bookService;
		@Autowired 
		UserService userService;
		@Autowired
		OrderService orderService;
		
		@Autowired
		SqlSession sqlSession;
		@Test
		public void testCRUD() throws ParseException {
			//1.创建springioc容器
//			ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
			//2.从容器中获取mapper
//			UserMapper userMapper = ioc.getBean(UserMapper.class);
//			TRoleMapper tRoleMapper = ioc.getBean(TRoleMapper.class);
			
			System.out.println(userMapper);
			System.out.println(tRoleMapper);
			System.out.println(shopMapper);
			
				
			//1.插入几个角色
//			tRoleMapper.insertSelective(new TRole(null, "普通用户"));
//			tRoleMapper.insertSelective(new TRole(null, "商家"));
//			tRoleMapper.insertSelective(new TRole(null, "超级管理员"));
			
			//2.插入几个普通用户
			
			//userMapper.insertSelective(new User(null, "兴华书店", "13333333333", (String)(Md5.getMd5("123456").getExtend().get("md5"))
			//		,"湖南省/湘潭市/雨湖区/北门", (byte)2, (byte)1, null));
			
			//3.插入一个商店
			//shopMapper.insertSelective(new Shop(null, 4, "兴华书店", "本店秉承\"先天下之忧而忧，后天下之乐而乐\"的原则", "湖南省/湘潭市/雨湖区/北门", (byte)1));
			
			//4.插入书记分类
//			bookcategoryMapper.insertSelective(new Bookcategory(null, "计算机"));
//			bookcategoryMapper.insertSelective(new Bookcategory(null, "编程语言"));
//			bookcategoryMapper.insertSelective(new Bookcategory(null, "数据库"));
//			bookcategoryMapper.insertSelective(new Bookcategory(null, "操作系统"));
//			bookcategoryMapper.insertSelective(new Bookcategory(null, "计算机网络"));
			
			//5.插入几本书
//			bookMapper.insertSelective(new Book(null, 1, 5, "计算机网络（第七版）", 45f, 10f, 
//					(short)20, "谢希仁", "电子工业出版社", new SimpleDateFormat("yyyy-MM-dd").parse("2017-01-01"), "/imgs/book_imgs/1.jpg", (byte)1));
			
			//3.批量插入多个员工，使用可以执行批量操作的sqlsession
//			EmployeeMapper mapper2 = sqlSession.getMapper(EmployeeMapper.class);
//			for (int i = 0; i < 100; i++) {
//				String uid = UUID.randomUUID().toString().substring(0,5) + i;
//				mapper.insertSelective(new Employee(null, uid, (i%2==0 ? "F" : "M"), uid+"@tinyspot.com", (i%2==0 ? 2 : 1)));
//			}
			
//			// 创建springIOC容器
//			ApplicationContext applicationContext=new ClassPathXmlApplicationContext("applicationContext.xml");
//			DepartmentMapper departmentMapper=applicationContext.getBean(DepartmentMapper.class);
//			EmployeeMapper employeeMapper=applicationContext.getBean(EmployeeMapper.class);
//			SqlSession sqlSession=applicationContext.getBean(SqlSession.class);
//			EmployeeMapper mapper= sqlSession.getMapper(EmployeeMapper.class);
//			
//			//插入部门
//			//departmentMapper.insertSelective(new Department(null,"开发部"));
//			departmentMapper.insertSelective(new Department(null,"测试部"));
//			//生成员工数据、测试员工插入
//			
////			employeeMapper.insertSelective(new Employee(null,"zzh","M","798322134@qq.com",1));
//			//批量插入员工，使用可以执行批量操作的sqlsession
////			for(int i=0;i<100;i++) {
////				String uid=UUID.randomUUID().toString().substring(0, 5)+i;
////				mapper.insertSelective(new Employee(null,uid,"M",uid+"@qq.com",1));
////			}
////			System.out.println("批量完成");
		}
		
		/**
		 * 测试两个新加的方法
		 *     List<Employee> selectByExampleWithDept(EmployeeExample example);
		 *     Employee selectByPrimaryKeyWithDept(Integer empId);
		 */
//		@Test
//		public void testTwoNewMethod() {
//			System.out.println(employeeMapper);
//			List<Employee> list = employeeMapper.selectByExampleWithDept(null);
//			System.out.println("list: "+list);
//			for(Employee emp :list) {
//				System.out.println(emp);
//			}
//			System.out.println("finish");
//		}
		
		/**
		 * 测试自己添加的和User有关的dao接口
		 */
		@Test
		public void testUserMethod() {
			String uPassword = (String)Md5.getMd5("123456").getExtend().get("md5");
			User user = userMapper.selectByUPhoneAndUPassword("18888888888", uPassword);
			System.out.println(user);
		}
		
		/**
		 * 测试自己添加的和Book有关的dao接口
		 */
		@Test
		public void testBookMethod() {
//			List<Book> books = bookMapper.selectBriefByExample();
//			for (Book book : books) {
//				System.out.println(book);
//			}
			
//			Integer stock = bookMapper.selectBookStockById(1);
//			System.out.println(stock);
			

			//			BookServce bookServce = new BookServce();
//			List<Book> booksBySId = bookServce.getBooksBySId(1);
//			for (Book book : booksBySId) {
//				System.out.println(book);
//			}
			
			
//			BookExample example = new BookExample();
//			Criteria criteria = example.createCriteria();
//			criteria.andBSIdEqualTo(1);
//			List<Book> list = bookMapper.selectByExample(example);
			List<Book> list = bookService.getBooksBySId(1);
			for (Book book : list) {
				System.out.println(book);
			}
		}
		
		@Test 
		public void testOrderMethod() {
//			OrderInfo orderInfo = orderMapper.selectOrderAndBookByOBIdAndOUId(2, 3);
//			System.out.println(orderInfo);
			
			List<BOrderInfo> allBOrderInfo = getAllBOrderInfo(1);
			for (BOrderInfo bOrderInfo : allBOrderInfo) {
				System.out.println(bOrderInfo);
			}
		}
		
		
		public List<BOrderInfo> getAllBOrderInfo(Integer sId){
			List<BOrderInfo> bOrderInfos = new ArrayList<BOrderInfo>();
			List<Book> bookList = bookService.getBooksBySId(sId); //该店铺所拥有的的所有书本
			for (Book book : bookList) {
				System.out.println("查询出来的book："+book);
				//根据bId查找订单信息
				List<Order> orderList = orderService.getOrdersByBId(book.getbId());
				System.out.println("orderList:"+orderList);
				if(orderList==null || orderList.size()==0)
					continue;
				for (Order order : orderList) {
					BOrderInfo bOrderInfo = new BOrderInfo();
					//设置订单的书本信息
					bOrderInfo.setbName(book.getbName());
					bOrderInfo.setbDiscount(book.getbDiscount());
					bOrderInfo.setbPicture(book.getbPicture());
					bOrderInfo.setbPrice(book.getbPrice());
					//设置订单的基本信息
					bOrderInfo.setoDate(order.getoDate());
					bOrderInfo.setoId(order.getoId());
					bOrderInfo.setoNum(order.getoNum());
					bOrderInfo.setoState(order.getoState());
					//根据uId查找用户信息
					User user = userService.getUserByUId(order.getoUId());
					//设置订单对应用户的信息
					bOrderInfo.setuAddress(user.getuAddress());
					bOrderInfo.setuPhone(user.getuPhone());
					bOrderInfos.add(bOrderInfo);
				}
			}
			return bOrderInfos;
		}
		
		@Test
		public void testTransaction() {
			User user = new User(null, "test01", "12345678901", "123456", "hehe", (byte)1, (byte)0, new Date());
			int uId = userService.saveUserReturnUId(user);
			System.out.println("uId: " + user.getuId() + "\n返回值：" + uId);
		}
}