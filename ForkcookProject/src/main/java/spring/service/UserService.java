package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.UserDao;

public class UserService {
	@Service
	public class NoticeService {
		@Autowired
		private UserDao dao;
		
	}
}
