package spring.data;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDao extends SqlSessionDaoSupport{
	public int getTotalCount(){
		return getSqlSession().selectOne("order.orderTotalCount");
	}
	
	public List<OrderDto> getList(){
		return getSqlSession().selectList("order.orderList");
	}
}
