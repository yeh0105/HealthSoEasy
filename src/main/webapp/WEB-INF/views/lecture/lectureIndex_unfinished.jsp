<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>講座介紹</title>

<!-------------------- codepen連結 -------------------->
<!-- 標題字型 -->
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;500&display=swap"
	rel="stylesheet">
<!-- 輪播 -->
<style>
@import
	url("https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap")
	;

@import
	url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

#pageWrapper {
	width: 80%;
	padding-left: 10%;
	padding-right: 10%;
}

#uk_breadcrumb {
	flex-wrap: wrap;
	list-style: none;
	display: flex;
	font-size: 18px;
}

#headerBlank {
	padding: 10px;
}

/* 表頭按鈕 */
.custom-btn {
	width: 130px;
	height: 40px;
	padding: 10px 25px;
	border: none;
	font-family: 'Lato', sans-serif;
	font-weight: 500;
	background: #fff;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	display: inline-block;
}

/* 5 */
.btn-5 {
	box-shadow: 4px 4px 8px gray;
	background: #fff;
	color: #000;
	line-height: 42px;
	padding: 0;
	border: none;
}

.btn-5:hover {
	background: #fff;
	color: #000;
	box-shadow: -7px -7px 20px 0px #fff9, -4px -4px 5px 0px #fff9, 7px 7px
		20px 0px #0002, 4px 4px 5px 0px #0001;
}

.btn-5:before, .btn-5:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #000;
	transition: 400ms ease all;
}

.btn-5:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.btn-5:hover:before, .btn-5:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

/* 搜尋bar */
.search-bar {
	position: relative;
}

/* 講座列表 */
.header-title {
	/*   margin-right: auto; */
	position: relative;
	text-align: left;
	color: #353535;
	font-family: 'Oswald', sans-serif;
	font-size: 26px;
	margin: 0;
}

/*  ==============================CodePen貼過來的============================== */
:root { -
	-body-bg-color: #e5f4f9; -
	-body-color-light: #8b939c; -
	-body-font: "Roboto", sans-serif; -
	-page-bg-color: #f2f5f7; -
	-body-color: #3d4954; -
	-border-color: #b8bec3; -
	-placeholder: #ccd0d2;
}

/*  * {  */
/*   outline: none;  */
/*   box-sizing: border-box;  */
/*  } */
 
img {
	max-width: 100%;
}

html {
	box-sizing: border-box;
	-webkit-font-smoothing: antialiased;
}

body {
	background-color: #fff;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='946' height='473' viewBox='0 0 1600 800'%3E%3Cpath fill='%23e436ff' d='M1102.5 734.8c2.5-1.2 24.8-8.6 25.6-7.5.5.7-3.9 23.8-4.6 24.5C1123.3 752.1 1107.5 739.5 1102.5 734.8zM1226.3 229.1c0-.1-4.9-9.4-7-14.2-.1-.3-.3-1.1-.4-1.6-.1-.4-.3-.7-.6-.9-.3-.2-.6-.1-.8.1l-13.1 12.3c0 0 0 0 0 0-.2.2-.3.5-.4.8 0 .3 0 .7.2 1 .1.1 1.4 2.5 2.1 3.6 2.4 3.7 6.5 12.1 6.5 12.2.2.3.4.5.7.6.3 0 .5-.1.7-.3 0 0 1.8-2.5 2.7-3.6 1.5-1.6 3-3.2 4.6-4.7 1.2-1.2 1.6-1.4 2.1-1.6.5-.3 1.1-.5 2.5-1.9C1226.5 230.4 1226.6 229.6 1226.3 229.1zM33 770.3C33 770.3 33 770.3 33 770.3c0-.7-.5-1.2-1.2-1.2-.1 0-.3 0-.4.1-1.6.2-14.3.1-22.2 0-.3 0-.6.1-.9.4-.2.2-.4.5-.4.9 0 .2 0 4.9.1 5.9l.4 13.6c0 .3.2.6.4.9.2.2.5.3.8.3 0 0 .1 0 .1 0 7.3-.7 14.7-.9 22-.6.3 0 .7-.1.9-.3.2-.2.4-.6.4-.9C32.9 783.3 32.9 776.2 33 770.3z'/%3E%3Cpath fill='%232ee7ff' d='M171.1 383.4c1.3-2.5 14.3-22 15.6-21.6.8.3 11.5 21.2 11.5 22.1C198.1 384.2 177.9 384 171.1 383.4zM596.4 711.8c-.1-.1-6.7-8.2-9.7-12.5-.2-.3-.5-1-.7-1.5-.2-.4-.4-.7-.7-.8-.3-.1-.6 0-.8.3L574 712c0 0 0 0 0 0-.2.2-.2.5-.2.9 0 .3.2.7.4.9.1.1 1.8 2.2 2.8 3.1 3.1 3.1 8.8 10.5 8.9 10.6.2.3.5.4.8.4.3 0 .5-.2.6-.5 0 0 1.2-2.8 2-4.1 1.1-1.9 2.3-3.7 3.5-5.5.9-1.4 1.3-1.7 1.7-2 .5-.4 1-.7 2.1-2.4C596.9 713.1 596.8 712.3 596.4 711.8zM727.5 179.9C727.5 179.9 727.5 179.9 727.5 179.9c.6.2 1.3-.2 1.4-.8 0-.1 0-.2 0-.4.2-1.4 2.8-12.6 4.5-19.5.1-.3 0-.6-.2-.8-.2-.3-.5-.4-.8-.5-.2 0-4.7-1.1-5.7-1.3l-13.4-2.7c-.3-.1-.7 0-.9.2-.2.2-.4.4-.5.6 0 0 0 .1 0 .1-.8 6.5-2.2 13.1-3.9 19.4-.1.3 0 .6.2.9.2.3.5.4.8.5C714.8 176.9 721.7 178.5 727.5 179.9zM728.5 178.1c-.1-.1-.2-.2-.4-.2C728.3 177.9 728.4 178 728.5 178.1z'/%3E%3Cg fill='%23FFF'%3E%3Cpath d='M699.6 472.7c-1.5 0-2.8-.8-3.5-2.3-.8-1.9 0-4.2 1.9-5 3.7-1.6 6.8-4.7 8.4-8.5 1.6-3.8 1.7-8.1.2-11.9-.3-.9-.8-1.8-1.2-2.8-.8-1.7-1.8-3.7-2.3-5.9-.9-4.1-.2-8.6 2-12.8 1.7-3.1 4.1-6.1 7.6-9.1 1.6-1.4 4-1.2 5.3.4 1.4 1.6 1.2 4-.4 5.3-2.8 2.5-4.7 4.7-5.9 7-1.4 2.6-1.9 5.3-1.3 7.6.3 1.4 1 2.8 1.7 4.3.5 1.1 1 2.2 1.5 3.3 2.1 5.6 2 12-.3 17.6-2.3 5.5-6.8 10.1-12.3 12.5C700.6 472.6 700.1 472.7 699.6 472.7zM740.4 421.4c1.5-.2 3 .5 3.8 1.9 1.1 1.8.4 4.2-1.4 5.3-3.7 2.1-6.4 5.6-7.6 9.5-1.2 4-.8 8.4 1.1 12.1.4.9 1 1.7 1.6 2.7 1 1.7 2.2 3.5 3 5.7 1.4 4 1.2 8.7-.6 13.2-1.4 3.4-3.5 6.6-6.8 10.1-1.5 1.6-3.9 1.7-5.5.2-1.6-1.4-1.7-3.9-.2-5.4 2.6-2.8 4.3-5.3 5.3-7.7 1.1-2.8 1.3-5.6.5-7.9-.5-1.3-1.3-2.7-2.2-4.1-.6-1-1.3-2.1-1.9-3.2-2.8-5.4-3.4-11.9-1.7-17.8 1.8-5.9 5.8-11 11.2-14C739.4 421.6 739.9 421.4 740.4 421.4zM261.3 590.9c5.7 6.8 9 15.7 9.4 22.4.5 7.3-2.4 16.4-10.2 20.4-3 1.5-6.7 2.2-11.2 2.2-7.9-.1-12.9-2.9-15.4-8.4-2.1-4.7-2.3-11.4 1.8-15.9 3.2-3.5 7.8-4.1 11.2-1.6 1.2.9 1.5 2.7.6 3.9-.9 1.2-2.7 1.5-3.9.6-1.8-1.3-3.6.6-3.8.8-2.4 2.6-2.1 7-.8 9.9 1.5 3.4 4.7 5 10.4 5.1 3.6 0 6.4-.5 8.6-1.6 4.7-2.4 7.7-8.6 7.2-15-.5-7.3-5.3-18.2-13-23.9-4.2-3.1-8.5-4.1-12.9-3.1-3.1.7-6.2 2.4-9.7 5-6.6 5.1-11.7 11.8-14.2 19-2.7 7.7-2.1 15.8 1.9 23.9.7 1.4.1 3.1-1.3 3.7-1.4.7-3.1.1-3.7-1.3-4.6-9.4-5.4-19.2-2.2-28.2 2.9-8.2 8.6-15.9 16.1-21.6 4.1-3.1 8-5.1 11.8-6 6-1.4 12 0 17.5 4C257.6 586.9 259.6 588.8 261.3 590.9z'/%3E%3Ccircle cx='1013.7' cy='153.9' r='7.1'/%3E%3Ccircle cx='1024.3' cy='132.1' r='7.1'/%3E%3Ccircle cx='1037.3' cy='148.9' r='7.1'/%3E%3Cpath d='M1508.7 297.2c-4.8-5.4-9.7-10.8-14.8-16.2 5.6-5.6 11.1-11.5 15.6-18.2 1.2-1.7.7-4.1-1-5.2-1.7-1.2-4.1-.7-5.2 1-4.2 6.2-9.1 11.6-14.5 16.9-4.8-5-9.7-10-14.7-14.9-1.5-1.5-3.9-1.5-5.3 0-1.5 1.5-1.5 3.9 0 5.3 4.9 4.8 9.7 9.8 14.5 14.8-1.1 1.1-2.3 2.2-3.5 3.2-4.1 3.8-8.4 7.8-12.4 12-1.4 1.5-1.4 3.8 0 5.3 0 0 0 0 0 0 1.5 1.4 3.9 1.4 5.3-.1 3.9-4 8.1-7.9 12.1-11.7 1.2-1.1 2.3-2.2 3.5-3.3 4.9 5.3 9.8 10.6 14.6 15.9.1.1.1.1.2.2 1.4 1.4 3.7 1.5 5.2.2C1510 301.2 1510.1 298.8 1508.7 297.2zM327.6 248.6l-.4-2.6c-1.5-11.1-2.2-23.2-2.3-37 0-5.5 0-11.5.2-18.5 0-.7 0-1.5 0-2.3 0-5 0-11.2 3.9-13.5 2.2-1.3 5.1-1 8.5.9 5.7 3.1 13.2 8.7 17.5 14.9 5.5 7.8 7.3 16.9 5 25.7-3.2 12.3-15 31-30 32.1L327.6 248.6zM332.1 179.2c-.2 0-.3 0-.4.1-.1.1-.7.5-1.1 2.7-.3 1.9-.3 4.2-.3 6.3 0 .8 0 1.7 0 2.4-.2 6.9-.2 12.8-.2 18.3.1 12.5.7 23.5 2 33.7 11-2.7 20.4-18.1 23-27.8 1.9-7.2.4-14.8-4.2-21.3l0 0C347 188.1 340 183 335 180.3 333.6 179.5 332.6 179.2 332.1 179.2zM516.3 60.8c-.1 0-.2 0-.4-.1-2.4-.7-4-.9-6.7-.7-.7 0-1.3-.5-1.4-1.2 0-.7.5-1.3 1.2-1.4 3.1-.2 4.9 0 7.6.8.7.2 1.1.9.9 1.6C517.3 60.4 516.8 60.8 516.3 60.8zM506.1 70.5c-.5 0-1-.3-1.2-.8-.8-2.1-1.2-4.3-1.3-6.6 0-.7.5-1.3 1.2-1.3.7 0 1.3.5 1.3 1.2.1 2 .5 3.9 1.1 5.8.2.7-.1 1.4-.8 1.6C506.4 70.5 506.2 70.5 506.1 70.5zM494.1 64.4c-.4 0-.8-.2-1-.5-.4-.6-.3-1.4.2-1.8 1.8-1.4 3.7-2.6 5.8-3.6.6-.3 1.4 0 1.7.6.3.6 0 1.4-.6 1.7-1.9.9-3.7 2-5.3 3.3C494.7 64.3 494.4 64.4 494.1 64.4zM500.5 55.3c-.5 0-.9-.3-1.2-.7-.5-1-1.2-1.9-2.4-3.4-.3-.4-.7-.9-1.1-1.4-.4-.6-.3-1.4.2-1.8.6-.4 1.4-.3 1.8.2.4.5.8 1 1.1 1.4 1.3 1.6 2.1 2.6 2.7 3.9.3.6 0 1.4-.6 1.7C500.9 55.3 500.7 55.3 500.5 55.3zM506.7 55c-.3 0-.5-.1-.8-.2-.6-.4-.7-1.2-.3-1.8 1.2-1.7 2.3-3.4 3.3-5.2.3-.6 1.1-.9 1.7-.5.6.3.9 1.1.5 1.7-1 1.9-2.2 3.8-3.5 5.6C507.4 54.8 507.1 55 506.7 55zM1029.3 382.8c-.1 0-.2 0-.4-.1-2.4-.7-4-.9-6.7-.7-.7 0-1.3-.5-1.4-1.2 0-.7.5-1.3 1.2-1.4 3.1-.2 4.9 0 7.6.8.7.2 1.1.9.9 1.6C1030.3 382.4 1029.8 382.8 1029.3 382.8zM1019.1 392.5c-.5 0-1-.3-1.2-.8-.8-2.1-1.2-4.3-1.3-6.6 0-.7.5-1.3 1.2-1.3.7 0 1.3.5 1.3 1.2.1 2 .5 3.9 1.1 5.8.2.7-.1 1.4-.8 1.6C1019.4 392.5 1019.2 392.5 1019.1 392.5zM1007.1 386.4c-.4 0-.8-.2-1-.5-.4-.6-.3-1.4.2-1.8 1.8-1.4 3.7-2.6 5.8-3.6.6-.3 1.4 0 1.7.6.3.6 0 1.4-.6 1.7-1.9.9-3.7 2-5.3 3.3C1007.7 386.3 1007.4 386.4 1007.1 386.4zM1013.5 377.3c-.5 0-.9-.3-1.2-.7-.5-1-1.2-1.9-2.4-3.4-.3-.4-.7-.9-1.1-1.4-.4-.6-.3-1.4.2-1.8.6-.4 1.4-.3 1.8.2.4.5.8 1 1.1 1.4 1.3 1.6 2.1 2.6 2.7 3.9.3.6 0 1.4-.6 1.7C1013.9 377.3 1013.7 377.3 1013.5 377.3zM1019.7 377c-.3 0-.5-.1-.8-.2-.6-.4-.7-1.2-.3-1.8 1.2-1.7 2.3-3.4 3.3-5.2.3-.6 1.1-.9 1.7-.5.6.3.9 1.1.5 1.7-1 1.9-2.2 3.8-3.5 5.6C1020.4 376.8 1020.1 377 1019.7 377zM1329.7 573.4c-1.4 0-2.9-.2-4.5-.7-8.4-2.7-16.6-12.7-18.7-20-.4-1.4-.7-2.9-.9-4.4-8.1 3.3-15.5 10.6-15.4 21 0 1.5-1.2 2.7-2.7 2.8 0 0 0 0 0 0-1.5 0-2.7-1.2-2.7-2.7-.1-6.7 2.4-12.9 7-18 3.6-4 8.4-7.1 13.7-8.8.5-6.5 3.1-12.9 7.4-17.4 7-7.4 18.2-8.9 27.3-10.1l.7-.1c1.5-.2 2.9.9 3.1 2.3.2 1.5-.9 2.9-2.3 3.1l-.7.1c-8.6 1.2-18.4 2.5-24 8.4-3 3.2-5 7.7-5.7 12.4 7.9-1 17.7 1.3 24.3 5.7 4.3 2.9 7.1 7.8 7.2 12.7.2 4.3-1.7 8.3-5.2 11.1C1335.2 572.4 1332.6 573.4 1329.7 573.4zM1311 546.7c.1 1.5.4 3 .8 4.4 1.7 5.8 8.7 14.2 15.1 16.3 2.8.9 5.1.5 7.2-1.1 2.7-2.1 3.2-4.8 3.1-6.6-.1-3.2-2-6.4-4.8-8.3C1326.7 547.5 1317.7 545.6 1311 546.7z'/%3E%3C/g%3E%3C/svg%3E");
	background-attachment: fixed;
	font-family: var(- -body-font);
	color: var(- -body-color);
	font-weight: 400;
	margin: 0;
}

%
display {
	display: flex;
	align-items: center;
}

.book-store {
	display: flex;
	flex-direction: column;
	max-width: 1400px;
	height: 100vh;
	background-color: var(- -page-bg-color);
	margin: 0 auto;
	overflow: hidden;
	box-shadow: 0px 2px 50px 10px rgba(0, 0, 0, 0.21);
}

.browse { @extend %display; &-category { @extend %display;
	border-right: 1px solid var(- -border-color);
	white-space: nowrap; svg { width : 16px;
	margin: 2px 10px 0 8px;
}

}
}
.book-slide {
	width: 100%;
}

.book {
	background: #fff;
}

.book-cell {
	position: relative;
	display: flex;
	padding: 25px;
	width: 40%;
	height: 250px;
	margin-right: 1px;
	&:
	nth-child
	(1)
	{
	background-color
	:
	#fbadaf;
}

&
:nth-child(2) {
	background-color: #a4e0eb;
}

&
:nth-child(3) {
	background-color: #edb9d6;
}

&
:nth-child(4) {
	background-color: #fdca95;
}

&
:nth-child(5) {
	background-color: #cbb5e2;
}

}
.flickity-page-dots {
	display: none;
}

.flickity-prev-next-button .arrow {
	fill: #d6d6d6;
}

.flickity-prev-next-button svg {
	left: 25%;
	top: 25%;
	width: 50%;
	height: 50%;
}

.flickity-prev-next-button { &.previous { left:15px;
	
}

&
.next {
	right: 15px;
}

}
.flickity-viewport {
	overflow: visible;
}

.book-photo {
	width: 180px;
	flex-shrink: 0;
	bottom: -35px;
	left: 35px;
	border-radius: 2px;
	box-shadow: -2px 6px 19px 0px #7f818e;
	transition: .3s ease;
	&:
	hover
	{
	transform
	:
	scale(
	1.03
	);
}

}
.book-img {
	flex-shrink: 0;
}

.book-title {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

.book-title {
	color: #ffffff;
	font-weight: 600;
}

.book-author {
	margin-top: 3px;
	font-size: 14px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

.book-content {
	padding: 0 20px;
	color: #ffffff;
	overflow: hidden;
}

fieldset, label {
	margin: 0;
	padding: 0;
	display: inline-block;
	vertical-align: middle;
}

h1 {
	font-size: 0.5em;
	margin: 10px;
}

.book-sum {
	margin-top: 20px;
	font-size: 14px;
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
}

.book-see {
	margin-top: 25px;
	text-align: center;
	background-color: #fff;
	color: #fbadaf;
	font-weight: 600;
	padding: 8px;
	font-size: 14px;
	width: 160px;
	border-radius: 20px;
	&:
	hover
	{
	color
	:
	#ff6e72;
}

&
.book-blue {
	color: #a4e0eb;
	&:
	hover
	{
	color
	:
	#22cdec;
}

}
&
.book-pink {
	color: #edb9d6;
	&:
	hover
	{
	color
	:
	#ff6dbe;
}

}
&
.book-yellow {
	color: #fdca95;
	&:
	hover
	{
	color
	:
	#fb9124;
}

}
&
.book-purple {
	color: #cbb5e2;
	&:
	hover
	{
	color
	:
	#a764ec;
}

}
}
@media ( max-width : 1103px) {
	.book-cell {
		width: 60%;
	}
}

@media ( max-width : 765px) {
	.book-cell {
		width: 80%;
	}
}

@media ( max-width : 575px) {
	.book-cell {
		width: 100%;
	}
}

@media ( max-width : 458px) {
	.book-photo {
		width: 180px;
	}
	.book-voters {
		display: none;
	}
}

@media ( max-width : 420px) {
	.book-see {
		width: 120px;
		font-size: 13px;
	}
	.book-photo {
		width: 130px;
	}
	.main-wrapper {
		margin-top: 50px;
	}
}
/* ==============================CodePen貼過來的結尾============================ */
</style>
<script type="text/javascript"
	src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-ui"></script>
<link
	href="http://www.francescomalagrino.com/BootstrapPageGenerator/3/css/bootstrap-combined.min.css"
	rel="stylesheet" media="screen">
<link
	href="https://fonts.googleapis.com/css2?family=Caudex&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/categoryNav.css">
<link href="css/header&footer.css" rel="stylesheet">
</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />

	<!-- 	綠底標頭 -->
	<div class="mainWrapper">
		<section id="offer">
			<div style="background-color: #C9D8BF; text-align: center;">
				<div style="margin: 5% auto;">
					<h1 style="color: #1d3b2a; font-family: Caudex;">So Lecture</h1>
					<p style="color: #325b43; font-family: Lobster; font-size: 18px;">
						吃對食物才會越吃越瘦、正確運動才不會造成運動傷害！</p>

					<p style="color: #325b43; font-family: Lobster; font-size: 18px;">
						讓各領域專業講師帶您一起變瘦變健康！</p>
				</div>
			</div>
		</section>
	</div>

	<!---------------------- 內容開始區 ---------------------->

	<!------- 小表頭區 ------->
	<div id='pageWrapper'>
		<div id='headerBlank'>
			<a href='<c:url value='/'></c:url>'><button
					class="custom-btn btn-5">首頁</button></a> <a
				href='<c:url value='/lecturerController/getAllLecturers' />'><button
					class="custom-btn btn-5">講師介紹</button></a> <input type="text"
				class="search-bar" placeholder="搜尋講座">

		</div>
		<hr>
	</div>
	<!------- 小表頭結束 ------->

	<!-- 進行中講座區 -->
	<div id='pageWrapper'>
		<div class="header-title">On-Going Lecture</div>

		<hr>


		<!-------------------------------- CodePen貼過來的 -------------------------------->
		<div class="book-store">
			<div class="header">
				<div class="browse"></div>
			</div>
			<div class="book-slide">
				<div class="book js-flickity"
					data-flickity-options='{ "wrapAround": true }'>
					<div class="book-cell">
						<div class="book-img">
							<img
								src="https://images-na.ssl-images-amazon.com/images/I/81WcnNQ-TBL.jpg"
								alt="" class="book-photo">
						</div>
						<div class="book-content">
							<div class="book-title">BIG MAGIC</div>
							<div class="book-author">by Elizabeth Gilbert</div>
							<div class="book-sum">Readers of all ages and walks of life
								have drawn inspiration and empowerment from Elizabeth Gilbert’s
								books for years.</div>
							<div class="book-see">See The Book</div>
						</div>
					</div>
					<div class="book-cell">
						<div class="book-img">
							<img
								src="https://i.pinimg.com/originals/a8/b9/ff/a8b9ff74ed0f3efd97e09a7a0447f892.jpg"
								alt="" class="book-photo">
						</div>
						<div class="book-content">
							<div class="book-title">Ten Thousand Skies Above You</div>
							<div class="book-author">by Claudia Gray</div>

							<div class="book-sum">The hunt for each splinter of Paul's
								soul sends Marguerite racing through a war-torn San Francisco.</div>
							<div class="book-see book-blue">See The Book</div>
						</div>
					</div>
					<div class="book-cell">
						<div class="book-img">
							<img
								src="https://www.abebooks.com/blog/wp-content/uploads/2016/08/10.jpg"
								alt="" class="book-photo">
						</div>
						<div class="book-content">
							<div class="book-title">A Tale For The Time Being</div>
							<div class="book-author">by Ruth Ozeki</div>

							<div class="book-sum">In Tokyo, sixteen-year-old Nao has
								decided there’s only one escape from her aching loneliness and
								her classmates’ bullying.</div>
							<div class="book-see book-pink">See The Book</div>
						</div>
					</div>
					<div class="book-cell">
						<div class="book-img">
							<img
								src="https://images-na.ssl-images-amazon.com/images/I/81af+MCATTL.jpg"
								alt="" class="book-photo">
						</div>
						<div class="book-content">
							<div class="book-title">The Great Gatsby</div>
							<div class="book-author">by F.Scott Fitzgerald</div>

							<div class="book-sum">The Great Gatsby, F. Scott
								Fitzgerald’s third book, stands as the supreme achievement of
								his career.</div>
							<div class="book-see book-yellow">See The Book</div>
						</div>
					</div>
					<div class="book-cell">
						<div class="book-img">
							<img
								src="https://images-na.ssl-images-amazon.com/images/I/81UWB7oUZ0L.jpg"
								alt="" class="book-photo">
						</div>
						<div class="book-content">
							<div class="book-title">After You</div>
							<div class="book-author">by Jojo Moyes</div>

							<div class="book-sum">Louisa Clark is no longer just an
								ordinary girl living an ordinary life. After the transformative
								six months spent.</div>
							<div class="book-see book-purple">See The Book</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- ------------------------------------------------------------------------------>

		<!-- 即將舉辦講座區 -->
		<div class="header-title">Upcoming Lecture</div>

		<hr>

		<!-- 精采回顧區 -->
		<div class="header-title">Archived Lecture</div>

		<hr>

		<!--  ------ -->
	</div>
	
	
<!-- CodePen's Body Start -->

<!-- CodePen's Body End -->

	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>