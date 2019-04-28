package com.mbm.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.mbm.services.RoleService;

@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	
	
	@Bean
	UserDetailsService customUserService() {
        return new RoleService();
    }

	@Override
    protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		.antMatchers("/css/**", "/js/**", "/fonts/**", "/index","/paylogin","/factory/**").permitAll() // 都可以访问
		.antMatchers("/home","/factory","/contract/**","/OutProduct/**","/PackingList/**").permitAll()
		.antMatchers("/h2-console/**").permitAll() // 都可以访问
		.antMatchers("/admins/**").hasRole("ADMIN") // 需要相应的角色才能访问
		.antMatchers("/payment").hasRole("ADMIN") // 需要相应的角色才能访问
		.and()
		.formLogin()   //基于 Form 表单登录验证
		.loginProcessingUrl("/paylogin")
		.loginPage("/login").failureUrl("/login-error") // 自定义登录界面
		//.and().rememberMe().key(KEY) // 启用 remember me
		.and().exceptionHandling().accessDeniedPage("/403");  // 处理异常，拒绝访问就重定向到 403 页面
		http.csrf().ignoringAntMatchers("/h2-console/**"); // 禁用 H2 控制台的 CSRF 防护
		//http.headers().frameOptions().sameOrigin(); // 允许来自同一来源的H2 控制台的请求
    }
	
	 /*@Override
	    protected void configure(HttpSecurity http) throws Exception {
	        http.authorizeRequests()
	                    .antMatchers("/payment").hasAnyRole("MEMBER","SUPER_ADMIN")//个人首页只允许拥有MENBER,SUPER_ADMIN角色的用户访问
	                    .anyRequest().authenticated()
	                    .and()
	                .formLogin()
	                    .loginPage("/").permitAll()//这里程序默认路径就是登陆页面，允许所有人进行登陆
	                    .loginProcessingUrl("/login")//登陆提交的处理url
	                    .failureForwardUrl("/login-error")//登陆失败进行转发，这里回到登陆页面，参数error可以告知登陆状态
	                    .defaultSuccessUrl("/paysuccess")//登陆成功的url，这里去到个人首页
	                    .and()
	                    .logout()
	                    .logoutUrl("/logout").permitAll()
	                    .logoutSuccessUrl("/?logout=true")//按顺序，第一个是登出的url，security会拦截这个url进行处理，所以登出不需要我们实现，第二个是登出url，logout告知登陆状态
	                    .and()
	                    .rememberMe()
	                    .tokenValiditySeconds(604800)//记住我功能，cookies有限期是一周
	                    .rememberMeParameter("remember-me")//登陆时是否激活记住我功能的参数名字，在登陆页面有展示
	                    .rememberMeCookieName("workspace");//cookies的名字，登陆后可以通过浏览器查看cookies名字
	    }*/
	 @Override
	    public void configure(WebSecurity web) throws Exception {
	        super.configure(web);
	    }

	    @Override
	    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	        auth.userDetailsService(customUserService());
	    }
}
