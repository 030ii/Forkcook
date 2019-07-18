package spring.data;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CartDao extends SqlSessionDaoSupport {

	public int getTotalCount(){
		return getSqlSession().selectOne("cart.cartTotalCount");
	}
	
	public List<CartDto> getList(){
		return getSqlSession().selectList("cart.cartList");
	}
	
	public void countUpdate(CartDto dto){
		getSqlSession().update("cart.countUpdate",dto);
	}
	public CartDto countSelect(int num)
	{
		return getSqlSession().selectOne("cart.countSelect",num);
	}
	public void insertCart(CartDto dto){
		getSqlSession().insert("cart.cartInsert",dto);
	}
	
	public void cartDelete(int num){
		getSqlSession().delete("cart.cartDelete",num);
	}
}
