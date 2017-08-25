package com.javalec.tea_pjt.model.coupon.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CouponDAOImpl implements CouponDAO{
	@Inject
	SqlSession sqlSession;//DB접속처리
	
}
