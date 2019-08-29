package com.tinyspot.bs.controlleradvice;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 处理Controller中出现的异常
 * @author TinySpot
 */
@ControllerAdvice  //包名由来
//类名意思：处理Controller中类方法产生的异常
public class HandlerControllersException {

	/*
	 * @ExceptionHandler注解注意事项
	 * 1.被该注解标注的方法的入参中可以加入Exception类的参数，改参数即代表所发生的的异常
	 * 2.被该注解标注的方法入参不能传入Map，如果希望将异常信息返回前端页面，需要使用ModeAndView作为返回值
	 * 3.被该注解标注的异常有优先级区分，优先返回子类，如果匹配不到精确的异常类，则寻找父类
	 * 4.@ControllerAdvice：如果当前Handler（即Controller中的）中没有@ExceptionHandler标注的异常处理方法
	 *     则会去@ControllerAdvice标注的类中寻找@ExceptionHandler标注的方法处理异常
	 */

	//处理数学异常，返回异常页面
	@ExceptionHandler({ArithmeticException.class})  //数学异常走这个方法
	public String handlerArithmeticException(Exception exp) {
		return "exception";
	}
	
	/*
	//如果需要将异常返回前端，这应该这么做
	@ExceptionHandler({ArithmeticException.class})
	public ModelAndView testPostExceptionToFront(Exception exp) {
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("exception", exp);
		return mv;//返回一个新的ModeAndView，然后再渲染视图
	}
	*/
	
	/*
	 * 除了上述的其他异常外，其他的异常都是用这个方法处理
	 */
	@ExceptionHandler({RuntimeException.class})
	public String handlerAnotherExceptions(Exception exp) {
		return "exception";
	}
	
}
