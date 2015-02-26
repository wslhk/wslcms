package cn.ifenghui.service.dao.impl;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.QueryException;
import org.hibernate.dialect.function.SQLFunction;
import org.hibernate.engine.spi.Mapping;
import org.hibernate.engine.spi.SessionFactoryImplementor;
import org.hibernate.type.StandardBasicTypes;
import org.hibernate.type.Type;

/**
 * <p>
 * Title:BitAndFunction
 * </p>
 * <p>
 * Description:
 * </p>
 *
 * @author js
 * @version
 * @since
 */

public class BitAndFunction implements SQLFunction {
	@Override
	public Type getReturnType(Type arg0, Mapping arg1) throws QueryException {

		return StandardBasicTypes.INTEGER;
	}
// public Type getReturnType(Type type, Mapping mapping) {
//  return Hibernate.INTEGER;
// }

 public boolean hasArguments() {
  return true;
 }

 public boolean hasParenthesesIfNoArguments() {
  return true;
 }

 public String render(List args, SessionFactoryImplementor factory)
   throws QueryException {
  if (args.size() != 2) {
   throw new IllegalArgumentException(
     "BitAndFunction requires 2 arguments!");
  }
  return args.get(0).toString() + " & " + args.get(1).toString();
 }

@Override
public String render(Type arg0, List arg1, SessionFactoryImplementor arg2)
		throws QueryException {
	if (arg1.size() != 2) {
		   throw new IllegalArgumentException(
		     "BitAndFunction requires 2 arguments!");
		  }
		  return arg1.get(0).toString() + " & " + arg1.get(1).toString();
}



}