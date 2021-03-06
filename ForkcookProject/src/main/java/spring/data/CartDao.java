package spring.data;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CartDao extends SqlSessionDaoSupport {

	public int getTotalCount(int num){
		return getSqlSession().selectOne("cart.cartTotalCount",num);
	}
	
	public List<CartDto> getList(int num){
		return getSqlSession().selectList("cart.cartList",num);
	}
	
	public void cartUpdate(CartDto dto){
		getSqlSession().update("cart.cartUpdate",dto);
	}
	
	public void countUpdatePlus(CartDto dto){
		getSqlSession().update("cart.countUpdatePlus",dto);
	}
	
	public void countUpdateMinus(CartDto dto){
		getSqlSession().update("cart.countUpdateMinus",dto);
	}
	
	public CartDto countSelect(int num)
	{
		return getSqlSession().selectOne("cart.countSelect",num);
	}
	public void insertCart(CartDto dto){
		getSqlSession().insert("cart.cartInsert",dto);
	}
	
	public int getMenuCount(CartDto dto){
		return getSqlSession().selectOne("cart.cartMenuCount",dto);
	}
	
	public void insertCartDetail(CartDto dto){
		getSqlSession().insert("cart.cartInsertDetail",dto);
	}
	
	public void cartDelete(int num){
		getSqlSession().delete("cart.cartDelete",num);
	}
	
	public void cartDeleteAfterOrder(int unum){
		getSqlSession().delete("cart.cartDeleteAfterOrder",unum);
	}
	
	public int getmyTotalCount(int num){
		return getSqlSession().selectOne("cart.getmyTotalCount",num);
	}
	
	public int getmyTotalPrice(int num){
		return getSqlSession().selectOne("cart.getmyTotalPrice",num);
	}

}
