<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta http-equiv="X-UA-Compatible" content="ie=edge" />
		<title>异常！</title>
		<style>
			body {
				margin: 0;
				padding: 0;
				display: flex;
				justify-content: center;
				align-items: center;
				min-height: 100vh;
				background: #060c21;
				font-family: 'Poppins', sans-serif;
			}
			.box {
				position: relative;
				width: 300px;
				height: 400px;
				display: flex;
				justify-content: center;
				align-items: center;
				background: #060c21;
			}
			/* 用box的伪元素添加一个面积比box略大的矩形,并通过改变层叠次序,置于box的下层,达到给box设置边框的效果 */
			.box::before {
				content: '';
				position: absolute;
				top: -2px;
				left: -2px;
				right: -2px;
				bottom: -2px;
				background: #fff;
				z-index: -1;
			}
			/* 于上面类似,做一个面积比box略大的矩形,并通过改变层叠次序,置于box的下层,达到给box设置边框的效果 */
			.box::after {
				content: '';
				position: absolute;
				top: -2px;
				left: -2px;
				right: -2px;
				bottom: -2px;
				background: #fff;
				z-index: -2;
				/* 滤镜属性  给图像设置高斯模糊。"radius"一值设定高斯函数的标准差，或者是屏幕上以多少像素融在一起，所以值越大越模糊；如果没有设定值，则默认是0；这个参数可设置css长度值，但不接受百分比值。 */
				filter: blur(40px);
			}
			.box::before,
			.box::after {
				/* linear-gradient() 函数用于创建一个线性渐变的 "图像"。 参数1:用角度值指定渐变的方向（或角度）  12点钟方向为0deg*/
				background: linear-gradient(235deg, #89ff00, #060c21, #00bcd4);
			}
			.content {
				padding: 20px;
				box-sizing: border-box;
				color: #fff;
			}
		</style>
	</head>
	<body>
		<div class="box">
			<div class="content">
				<h1> 呀！出异常啦 </h1>
        <br />
        <br />
				<p>
					请联系QQ1845790416反映该异常
        </p>
        <br />
        <br />
        <a href="https://blog.csdn.net/qq_41550842">或者点击该链接反映，灰常感谢啦</a>
        <br />
        <br />
			</div>
		</div>
	</body>
</html>
