package spring.data;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDao extends SqlSessionDaoSupport{
	public int getTotalCount(){
		return getSqlSession().selectOne("order.orderTotalCount");
	}
	
	public int getNowTotalCount(int snum){
		return getSqlSession().selectOne("order.orderNowTotalCount", snum);
	}
	
	public int getReserveTotalCount(int snum){
		return getSqlSession().selectOne("order.orderReserveTotalCount", snum);
	}
	
	public int getFinishTotalCount(int snum){
		return getSqlSession().selectOne("order.orderFinishTotalCount", snum);
	}
	
	public List<OrderDto> getList(){
		return getSqlSession().selectList("order.orderList");
	}
	
	public OrderDto getListData(String ordernum){
		return getSqlSession().selectOne("order.orderListData", ordernum);
	}
	
	public List<OrderDto> getMenuData(String ordernum){
		return getSqlSession().selectList("order.orderMenuData", ordernum);
	}
	
	public void insertOrder(OrderDto dto){
		getSqlSession().insert("order.orderInsert",dto);
	}
	
	public void orderDelete(String ordernum){
		getSqlSession().delete("order.orderDelete",ordernum);
	}
	
	public void orderUpdateState2(String ordernum){
		getSqlSession().update("order.orderUpdateState2",ordernum);
	}
	public void orderUpdateState3(String ordernum){
		getSqlSession().update("order.orderUpdateState3",ordernum);
	}
	public void orderUpdateState4(String ordernum){
		getSqlSession().update("order.orderUpdateState4",ordernum);
	}
	public void orderUpdateState7(String ordernum){
		getSqlSession().update("order.orderUpdateState7",ordernum);
	}
	public void orderUpdateState8(String ordernum){
		getSqlSession().update("order.orderUpdateState8",ordernum);
	}
	
}
