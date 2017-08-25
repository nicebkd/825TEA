package com.javalec.tea_pjt.service.coupon;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.javalec.tea_pjt.model.coupon.dao.CouponDAO;

@Service
public class CouponServiceImpl implements CouponService{
	
	@Inject
	CouponDAO cDao;
	

}
