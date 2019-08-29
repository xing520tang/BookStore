package com.tinyspot.bs.log;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

/*
 * 通知(advice)类型
 * 1.前置通知(@Before)：在目标方法运行之前执行
 * 2.后置通知(@After)：目标方法运行结束后运行（不管是正常结束还是异常结束）
 * 3.返回通知(@AfterReturning)：目标方法正常返回之后运行
 * 4.异常通知(@AfterThrowing)：目标方法出现异常后运行
 * 5.环绕通知(@Around)：动态代理，手动调用方法运行
 */

/*
 * 这个方法用于给控制器中的方法打印日志（里面的请求开始，结束，指的是目标方法被执行前后）
 */
@Component  //该切面类需要加入容器
@Aspect
public class ControllerLog {

	//@Pointcut(value = "execution(* com.tinyspot.bs.controller.*.*(..))")//AspectJ表达式,表示哪些方法需要增强（这些方法也叫连接点？）
	@Pointcut(value = "within(com.tinyspot.bs.controller.*)")//表示Controller包下的所有类的所有方法
	public void pointCut() {
		
	}
	
	//前置通知，在方法正式执行前打印
	@Before(value = "pointCut()")  //指定上面的切点
	public void before(JoinPoint joinPoint) {  //传入JoinPoint用于获取方法名字等信息，且改参数需要放在第一位
		Object[] args = joinPoint.getArgs();  //获取参数列表
		//打印方法名加参数(AopLog==>>methodName(..))
		System.out.println("\nAopLog>>>>[请求开始] "+ joinPoint.getSignature().getName()+"(" + Arrays.asList(args) + ")");
	}
	
	//返回通知（方法正常返回后运行）
	@AfterReturning(value = "pointCut()", returning = "result")  //returning属性指定的是方法返回值封装给哪个字段
	public void afterReturning(JoinPoint joinPoint, Object result) {
		//打印方法的返回值(AopLog==>>methodName{result})
		System.out.println("AopLog<<<<[请求结束] "+ joinPoint.getSignature().getName() + "{" + result + "}\n");
	}
	
	//异常通知，当方法出现异常时运行
	@AfterThrowing(value = "pointCut()",throwing = "exp")
	public void afterThrowing(JoinPoint joinPoint, Exception exp) {
		//打印异常信息(AopLog==>>methodName<exp>)
		System.out.println("AopLog<<<<[请求结束] " + joinPoint.getSignature().getName() + "<" + exp + ">\n");
	}
}
