package com.mage.dao.impl;

import com.mage.bean.PageBean;
import com.mage.bean.User;
import com.mage.dao.UserDao;
import com.mage.tool.JDBCUtil;
import com.mage.tool.TextUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class UserDaoImpl implements UserDao {

	public List<User> findAll() throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		return runner.query("select * from users", new BeanListHandler<User>(User.class));
	}
	public void insert(User user) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		runner.update("insert into users ( `username`, `passwords`, `birthday`, `sex`, `usertype`, `isfull`, `money`)  values(?,?,?,?,?,?,?)" ,
				user.getUsername(),
				user.getPasswords(),
				user.getBirthday(),
				user.getSex(),
				user.getusertype(),
				user.getIsfull(),
				user.getMoney()
				);
		System.out.println("添加用户成功！");
	}
	public List<User> searchUser(String username, String usertype) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql = "select * from users where 1=1 ";
		List<String> list = new ArrayList<String> ();
		if(!TextUtils.isEmpty(username)){
			sql = sql + "  and username like ?";
			list.add("%"+username+"%");
		}
		System.out.println(username);
		if(!TextUtils.isEmpty(usertype)){
			sql = sql + " and usertype = ?";
			list.add(String.valueOf(usertype));
		}
		System.out.println(usertype);
		System.out.println(sql);

		return runner.query(sql, new BeanListHandler<User>(User.class),list.toArray());
	}

	public void delete(int userid) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		runner.update("delete from users where userid = ?",userid);
		System.out.println("delete from users where userid = "+userid);
	}

	public void renewkill(int userid) throws SQLException{
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		runner.update("update users set isfull = 1 where userid=?",userid);
		System.out.println("已经运行了封杀用户，封杀用户id为："+userid );
	}

    public void renewlife(int userid) throws SQLException{
        QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
        runner.update("update users set isfull = 0 where userid=?",userid);
        System.out.println("已经运行了解封用户，解封用户id为："+userid );
    }

	public void update(User user) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		runner.update("update users set username = ?,passwords = ?,birthday = ? , sex = ? , usertype = ? , isfull = ?,money = ? where userid = ? " ,
				user.getUsername(),
				user.getPasswords(),
				user.getBirthday(),
				user.getSex(),
				user.getusertype(),
				user.getIsfull(),
				user.getMoney(),
				user.getUserid()
				);
	}


	public User findUserById(int userid) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		return runner.query("select * from users where userid = ?", new BeanHandler<User>(User.class),userid);
	}

	public User findUserByName(String username) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		return runner.query("select * from users where username = ?", new BeanHandler<User>(User.class),username);
	}

	public int findCount() throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		Long  result = (Long) runner.query("SELECT COUNT(*) FROM users " , new ScalarHandler() );
		return result.intValue();
	}

	public List<User> findUserByPage(int currentPage) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		return runner.query("select * from users limit ? offset ?", new BeanListHandler<User>(User.class), PAGE_SIZE , (currentPage-1)*PAGE_SIZE);
	}

	public User searchUserForLogin(String username, String password, String usertype) throws SQLException {
		System.out.println(username+"---"+password+"-----"+usertype);
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		User user = runner.query("select * from users where username=? and passwords=? and usertype = ?", new BeanHandler<User>(User.class),username,password,usertype);
		System.out.println(user);
		return runner.query("select * from users where username=? and passwords=? and usertype = ?", new BeanHandler<User>(User.class),username,password,usertype);
	}
	
	public PageBean findUserByPages(int currentPage) throws SQLException {
		//封装分页的该页数据
				PageBean<User> pageBean = new PageBean<User>();
				
				int pageSize = UserDao.PAGE_SIZE ;
				currentPage=currentPage<1?1:currentPage;
				pageBean.setCurrentPage(currentPage); //设置当前页
				pageBean.setPageSize(pageSize); //设置每页显示多少记录
				
				UserDao dao = new UserDaoImpl() ;
				List<User> list =dao.findUserByPage(currentPage);
				pageBean.setList(list); //设置这一页的学生数据
				
				//总的记录数， 总的页数。
				int count = dao.findCount();
				pageBean.setTotalSize(count); //设置总的记录数
				//200 ， 10 ==20   201 ， 10 = 21   201 % 10 == 0 ?201 / 10 :201 % 10 + 1
				pageBean.setTotalPage(count % pageSize==0 ? count / pageSize : (count / pageSize) + 1); //总页数
				return pageBean;
	}


}
