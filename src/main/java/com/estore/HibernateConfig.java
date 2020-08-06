package com.estore;


import java.util.Properties;
import org.springframework.beans.factory.annotation.Autowired;
import javax.sql.DataSource;
import org.springframework.core.env.Environment;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;


@Configuration

public class HibernateConfig {
	@Autowired
	Environment env;
	
	@Bean
	public DataSource getDataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		dataSource.setUrl("jdbc:sqlserver://localhost:1433;databaseName=eStore;");
		dataSource.setUsername("sa");
		dataSource.setPassword("123456");
		return (DataSource) dataSource;
	}
	
	@Bean
	@Autowired
	public SessionFactory getSessionFactory(DataSource dataSource) throws Exception{
		LocalSessionFactoryBean factoryBean = new LocalSessionFactoryBean();
		factoryBean.setPackagesToScan(new String[] {"com.estore.entity"});
		factoryBean.setDataSource(dataSource);
		Properties props = factoryBean.getHibernateProperties();
		props.put("hibernate.dialect","org.hibernate.dialect.SQLServer2008Dialect");
		props.put("hibernate.show_sql","false");
		props.put("current_session_context_class","org.springframework.orm.hibernate5.SpringSessionContext");
		factoryBean.afterPropertiesSet();
		SessionFactory sessionFactory = factoryBean.getObject();
		return sessionFactory;
	}
	
	@Bean
	@Autowired
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
		return new HibernateTransactionManager(sessionFactory);
	}
}

