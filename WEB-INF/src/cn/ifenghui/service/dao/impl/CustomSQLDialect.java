package cn.ifenghui.service.dao.impl;

import org.hibernate.dialect.MySQLInnoDBDialect;

/**
 * <p>
 * Title:CustomSQLDialect
 * </p>
 * <p>
 * Description:
 * </p>
 *
 * @author js
 * @version
 * @since
 */
public class CustomSQLDialect extends MySQLInnoDBDialect {
 /**
  *
  */
 public CustomSQLDialect() {
  super();
  registerFunction("bitand", new BitAndFunction());
 }

}