package spring.data;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CartDao extends SqlSessionDaoSupport {

	public List<CartDto> getList(){
		return getSqlSession().selectList("cart.cartList");
	}
	
}
