package spring.data;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class MenuDao extends SqlSessionDaoSupport {
	public int getTotalCount(){
		return getSqlSession().selectOne("menu.menuTotalCount");
	}
	
	public void insertMenu(MenuDto dto){
		getSqlSession().insert("menu.menuInsert",dto);
	}
	
	public List<MenuDto> getList(){
		return getSqlSession().selectList("menu.menuList");
	}
	
	public MenuDto getData(int num){
		return getSqlSession().selectOne("menu.menuSelectData",num); 
	}
	
	public void menuUpdate(MenuDto dto){
		getSqlSession().update("menu.menuUpdate",dto);
	}
	
	public void menuDelete(int num){
		getSqlSession().delete("menu.menuDelete",num);
	}
}

