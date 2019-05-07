package com.mbm.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mbm.domian.User;
import com.mbm.services.RoleService;
import com.mbm.services.UserService;
import com.mbm.util.ConfigInfo;
import com.mbm.util.PanymentUtil;
import com.mbm.vo.Pay;

@Controller
public class paymentController {
	@Autowired
	UserService userService;
	
	@Autowired
	RoleService roleService;
	
	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	@RequestMapping("/payment")
	public String payment() {
		return "payment/payment";
	}
	
	@RequestMapping("/paymentRequest")
	public String paymentRequest(Pay pay ,HttpServletRequest request) {
		String orderid = pay.getOrderid();//订单号
		String amount = pay.getAmount();//支付金额
		String pd_FrpId = pay.getPd_FrpId();//选择的支付银行
		System.out.println(orderid);
		System.out.println(amount);
		System.out.println(pd_FrpId);
		String p1_MerId = ConfigInfo.getValue("p1_MerId");
		String keyValue = ConfigInfo.getValue("keyValue");
		String merchantCallbackURL = ConfigInfo.getValue("merchantCallbackURL");		
		String messageType = "Buy"; // 请求命令,在线支付固定为Buy
		String currency = "CNY"; // 货币单位
		String productDesc = ""; // 商品描述
		String productCat = ""; // 商品种类
		String productId = ""; // 商品ID
		String addressFlag = "0"; // 需要填写送货信息 0：不需要 1:需要		
		String sMctProperties = ""; // 商家扩展信息
		String pr_NeedResponse = "0"; // 应答机制
		String md5hmac = PanymentUtil.buildHmac(messageType, p1_MerId, orderid, amount, currency,
				productId, productCat, productDesc, merchantCallbackURL, addressFlag, sMctProperties, 
				pd_FrpId, pr_NeedResponse, keyValue);
		request.setAttribute("messageType", messageType);
		request.setAttribute("merchantID", p1_MerId);
		request.setAttribute("orderId", orderid);
		request.setAttribute("amount", amount);
		request.setAttribute("currency", currency);
		request.setAttribute("productId", productId);
		request.setAttribute("productCat", productCat);
		request.setAttribute("productDesc", productDesc);
		request.setAttribute("merchantCallbackURL", merchantCallbackURL);
		request.setAttribute("addressFlag", addressFlag);
		request.setAttribute("sMctProperties", sMctProperties);
		request.setAttribute("frpId", pd_FrpId);
		request.setAttribute("pr_NeedResponse", pr_NeedResponse);
		request.setAttribute("hmac", md5hmac);	
		return "payment/connection";
	}
	
	@RequestMapping("/paysuccess")
	public String paysuccess() {
		return "login";
	}
	
	@RequestMapping(value="/paylogin" ,method=RequestMethod.POST)
	public String paylogin(User user ,HttpServletRequest request,HttpSession session){
		System.out.println(user.getUsername());
		
		if (roleService.findUserByUsername(user.getUsername())) {
			User u = roleService.findroleByUsername(user.getUsername());
			System.out.println(u.getUsername());
			if(user.getPassword().equals(u.getPassword())) {
				session.setAttribute("User", u);
				return "index";
			}else {
				System.out.println("用户名不存在");
				request.setAttribute("loginerror", "用户名不存在");
				return "payment/login";
			}
			
		}else {
			System.out.println("用户名不存在");
			request.setAttribute("loginerror", "用户名不存在");
			return "payment/login";
		}
		
	}
	
	@RequestMapping("/login")
	public String Login() {
		System.out.println(passwordEncoder.encode("66"));
		return "payment/login";
	}
	
	@RequestMapping("/login-error")
	public String loginerror(HttpServletRequest request) {
		request.setAttribute("login-error", "登录失败");
		System.out.println("登录失败");
		return "payment/login-error";
	}
	
	@RequestMapping("/403")
	public String login403(HttpServletRequest request) {
		request.setAttribute("login-error", "没有权限");
		System.out.println("没有权限03");
		return "payment/login-error";
	}

}
