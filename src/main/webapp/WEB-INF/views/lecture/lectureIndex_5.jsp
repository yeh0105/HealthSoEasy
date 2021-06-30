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
<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;500&display=swap" rel="stylesheet">
<!-- 輪播 -->



<style>
@import	url("https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap");
@import	url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

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
:root {
 --body-bg-color: #e5f4f9;
 --body-color-light: #8b939c;
 --body-font: "Roboto", sans-serif;
 --page-bg-color: #f2f5f7;
 --body-color: #3d4954;
 --border-color: #b8bec3;
 --placeholder: #ccd0d2;
}

* {
 outline: none;
 box-sizing: border-box;
}

img {
 max-width: 100%;
}

html {
 box-sizing: border-box;
 -webkit-font-smoothing: antialiased;
}

body {
background-color: #fff;
background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='946' height='473' viewBox='0 0 1600 800'%3E%3Cpath fill='%23e436ff' d='M1102.5 734.8c2.5-1.2 24.8-8.6 25.6-7.5.5.7-3.9 23.8-4.6 24.5C1123.3 752.1 1107.5 739.5 1102.5 734.8zM1226.3 229.1c0-.1-4.9-9.4-7-14.2-.1-.3-.3-1.1-.4-1.6-.1-.4-.3-.7-.6-.9-.3-.2-.6-.1-.8.1l-13.1 12.3c0 0 0 0 0 0-.2.2-.3.5-.4.8 0 .3 0 .7.2 1 .1.1 1.4 2.5 2.1 3.6 2.4 3.7 6.5 12.1 6.5 12.2.2.3.4.5.7.6.3 0 .5-.1.7-.3 0 0 1.8-2.5 2.7-3.6 1.5-1.6 3-3.2 4.6-4.7 1.2-1.2 1.6-1.4 2.1-1.6.5-.3 1.1-.5 2.5-1.9C1226.5 230.4 1226.6 229.6 1226.3 229.1zM33 770.3C33 770.3 33 770.3 33 770.3c0-.7-.5-1.2-1.2-1.2-.1 0-.3 0-.4.1-1.6.2-14.3.1-22.2 0-.3 0-.6.1-.9.4-.2.2-.4.5-.4.9 0 .2 0 4.9.1 5.9l.4 13.6c0 .3.2.6.4.9.2.2.5.3.8.3 0 0 .1 0 .1 0 7.3-.7 14.7-.9 22-.6.3 0 .7-.1.9-.3.2-.2.4-.6.4-.9C32.9 783.3 32.9 776.2 33 770.3z'/%3E%3Cpath fill='%232ee7ff' d='M171.1 383.4c1.3-2.5 14.3-22 15.6-21.6.8.3 11.5 21.2 11.5 22.1C198.1 384.2 177.9 384 171.1 383.4zM596.4 711.8c-.1-.1-6.7-8.2-9.7-12.5-.2-.3-.5-1-.7-1.5-.2-.4-.4-.7-.7-.8-.3-.1-.6 0-.8.3L574 712c0 0 0 0 0 0-.2.2-.2.5-.2.9 0 .3.2.7.4.9.1.1 1.8 2.2 2.8 3.1 3.1 3.1 8.8 10.5 8.9 10.6.2.3.5.4.8.4.3 0 .5-.2.6-.5 0 0 1.2-2.8 2-4.1 1.1-1.9 2.3-3.7 3.5-5.5.9-1.4 1.3-1.7 1.7-2 .5-.4 1-.7 2.1-2.4C596.9 713.1 596.8 712.3 596.4 711.8zM727.5 179.9C727.5 179.9 727.5 179.9 727.5 179.9c.6.2 1.3-.2 1.4-.8 0-.1 0-.2 0-.4.2-1.4 2.8-12.6 4.5-19.5.1-.3 0-.6-.2-.8-.2-.3-.5-.4-.8-.5-.2 0-4.7-1.1-5.7-1.3l-13.4-2.7c-.3-.1-.7 0-.9.2-.2.2-.4.4-.5.6 0 0 0 .1 0 .1-.8 6.5-2.2 13.1-3.9 19.4-.1.3 0 .6.2.9.2.3.5.4.8.5C714.8 176.9 721.7 178.5 727.5 179.9zM728.5 178.1c-.1-.1-.2-.2-.4-.2C728.3 177.9 728.4 178 728.5 178.1z'/%3E%3Cg fill='%23FFF'%3E%3Cpath d='M699.6 472.7c-1.5 0-2.8-.8-3.5-2.3-.8-1.9 0-4.2 1.9-5 3.7-1.6 6.8-4.7 8.4-8.5 1.6-3.8 1.7-8.1.2-11.9-.3-.9-.8-1.8-1.2-2.8-.8-1.7-1.8-3.7-2.3-5.9-.9-4.1-.2-8.6 2-12.8 1.7-3.1 4.1-6.1 7.6-9.1 1.6-1.4 4-1.2 5.3.4 1.4 1.6 1.2 4-.4 5.3-2.8 2.5-4.7 4.7-5.9 7-1.4 2.6-1.9 5.3-1.3 7.6.3 1.4 1 2.8 1.7 4.3.5 1.1 1 2.2 1.5 3.3 2.1 5.6 2 12-.3 17.6-2.3 5.5-6.8 10.1-12.3 12.5C700.6 472.6 700.1 472.7 699.6 472.7zM740.4 421.4c1.5-.2 3 .5 3.8 1.9 1.1 1.8.4 4.2-1.4 5.3-3.7 2.1-6.4 5.6-7.6 9.5-1.2 4-.8 8.4 1.1 12.1.4.9 1 1.7 1.6 2.7 1 1.7 2.2 3.5 3 5.7 1.4 4 1.2 8.7-.6 13.2-1.4 3.4-3.5 6.6-6.8 10.1-1.5 1.6-3.9 1.7-5.5.2-1.6-1.4-1.7-3.9-.2-5.4 2.6-2.8 4.3-5.3 5.3-7.7 1.1-2.8 1.3-5.6.5-7.9-.5-1.3-1.3-2.7-2.2-4.1-.6-1-1.3-2.1-1.9-3.2-2.8-5.4-3.4-11.9-1.7-17.8 1.8-5.9 5.8-11 11.2-14C739.4 421.6 739.9 421.4 740.4 421.4zM261.3 590.9c5.7 6.8 9 15.7 9.4 22.4.5 7.3-2.4 16.4-10.2 20.4-3 1.5-6.7 2.2-11.2 2.2-7.9-.1-12.9-2.9-15.4-8.4-2.1-4.7-2.3-11.4 1.8-15.9 3.2-3.5 7.8-4.1 11.2-1.6 1.2.9 1.5 2.7.6 3.9-.9 1.2-2.7 1.5-3.9.6-1.8-1.3-3.6.6-3.8.8-2.4 2.6-2.1 7-.8 9.9 1.5 3.4 4.7 5 10.4 5.1 3.6 0 6.4-.5 8.6-1.6 4.7-2.4 7.7-8.6 7.2-15-.5-7.3-5.3-18.2-13-23.9-4.2-3.1-8.5-4.1-12.9-3.1-3.1.7-6.2 2.4-9.7 5-6.6 5.1-11.7 11.8-14.2 19-2.7 7.7-2.1 15.8 1.9 23.9.7 1.4.1 3.1-1.3 3.7-1.4.7-3.1.1-3.7-1.3-4.6-9.4-5.4-19.2-2.2-28.2 2.9-8.2 8.6-15.9 16.1-21.6 4.1-3.1 8-5.1 11.8-6 6-1.4 12 0 17.5 4C257.6 586.9 259.6 588.8 261.3 590.9z'/%3E%3Ccircle cx='1013.7' cy='153.9' r='7.1'/%3E%3Ccircle cx='1024.3' cy='132.1' r='7.1'/%3E%3Ccircle cx='1037.3' cy='148.9' r='7.1'/%3E%3Cpath d='M1508.7 297.2c-4.8-5.4-9.7-10.8-14.8-16.2 5.6-5.6 11.1-11.5 15.6-18.2 1.2-1.7.7-4.1-1-5.2-1.7-1.2-4.1-.7-5.2 1-4.2 6.2-9.1 11.6-14.5 16.9-4.8-5-9.7-10-14.7-14.9-1.5-1.5-3.9-1.5-5.3 0-1.5 1.5-1.5 3.9 0 5.3 4.9 4.8 9.7 9.8 14.5 14.8-1.1 1.1-2.3 2.2-3.5 3.2-4.1 3.8-8.4 7.8-12.4 12-1.4 1.5-1.4 3.8 0 5.3 0 0 0 0 0 0 1.5 1.4 3.9 1.4 5.3-.1 3.9-4 8.1-7.9 12.1-11.7 1.2-1.1 2.3-2.2 3.5-3.3 4.9 5.3 9.8 10.6 14.6 15.9.1.1.1.1.2.2 1.4 1.4 3.7 1.5 5.2.2C1510 301.2 1510.1 298.8 1508.7 297.2zM327.6 248.6l-.4-2.6c-1.5-11.1-2.2-23.2-2.3-37 0-5.5 0-11.5.2-18.5 0-.7 0-1.5 0-2.3 0-5 0-11.2 3.9-13.5 2.2-1.3 5.1-1 8.5.9 5.7 3.1 13.2 8.7 17.5 14.9 5.5 7.8 7.3 16.9 5 25.7-3.2 12.3-15 31-30 32.1L327.6 248.6zM332.1 179.2c-.2 0-.3 0-.4.1-.1.1-.7.5-1.1 2.7-.3 1.9-.3 4.2-.3 6.3 0 .8 0 1.7 0 2.4-.2 6.9-.2 12.8-.2 18.3.1 12.5.7 23.5 2 33.7 11-2.7 20.4-18.1 23-27.8 1.9-7.2.4-14.8-4.2-21.3l0 0C347 188.1 340 183 335 180.3 333.6 179.5 332.6 179.2 332.1 179.2zM516.3 60.8c-.1 0-.2 0-.4-.1-2.4-.7-4-.9-6.7-.7-.7 0-1.3-.5-1.4-1.2 0-.7.5-1.3 1.2-1.4 3.1-.2 4.9 0 7.6.8.7.2 1.1.9.9 1.6C517.3 60.4 516.8 60.8 516.3 60.8zM506.1 70.5c-.5 0-1-.3-1.2-.8-.8-2.1-1.2-4.3-1.3-6.6 0-.7.5-1.3 1.2-1.3.7 0 1.3.5 1.3 1.2.1 2 .5 3.9 1.1 5.8.2.7-.1 1.4-.8 1.6C506.4 70.5 506.2 70.5 506.1 70.5zM494.1 64.4c-.4 0-.8-.2-1-.5-.4-.6-.3-1.4.2-1.8 1.8-1.4 3.7-2.6 5.8-3.6.6-.3 1.4 0 1.7.6.3.6 0 1.4-.6 1.7-1.9.9-3.7 2-5.3 3.3C494.7 64.3 494.4 64.4 494.1 64.4zM500.5 55.3c-.5 0-.9-.3-1.2-.7-.5-1-1.2-1.9-2.4-3.4-.3-.4-.7-.9-1.1-1.4-.4-.6-.3-1.4.2-1.8.6-.4 1.4-.3 1.8.2.4.5.8 1 1.1 1.4 1.3 1.6 2.1 2.6 2.7 3.9.3.6 0 1.4-.6 1.7C500.9 55.3 500.7 55.3 500.5 55.3zM506.7 55c-.3 0-.5-.1-.8-.2-.6-.4-.7-1.2-.3-1.8 1.2-1.7 2.3-3.4 3.3-5.2.3-.6 1.1-.9 1.7-.5.6.3.9 1.1.5 1.7-1 1.9-2.2 3.8-3.5 5.6C507.4 54.8 507.1 55 506.7 55zM1029.3 382.8c-.1 0-.2 0-.4-.1-2.4-.7-4-.9-6.7-.7-.7 0-1.3-.5-1.4-1.2 0-.7.5-1.3 1.2-1.4 3.1-.2 4.9 0 7.6.8.7.2 1.1.9.9 1.6C1030.3 382.4 1029.8 382.8 1029.3 382.8zM1019.1 392.5c-.5 0-1-.3-1.2-.8-.8-2.1-1.2-4.3-1.3-6.6 0-.7.5-1.3 1.2-1.3.7 0 1.3.5 1.3 1.2.1 2 .5 3.9 1.1 5.8.2.7-.1 1.4-.8 1.6C1019.4 392.5 1019.2 392.5 1019.1 392.5zM1007.1 386.4c-.4 0-.8-.2-1-.5-.4-.6-.3-1.4.2-1.8 1.8-1.4 3.7-2.6 5.8-3.6.6-.3 1.4 0 1.7.6.3.6 0 1.4-.6 1.7-1.9.9-3.7 2-5.3 3.3C1007.7 386.3 1007.4 386.4 1007.1 386.4zM1013.5 377.3c-.5 0-.9-.3-1.2-.7-.5-1-1.2-1.9-2.4-3.4-.3-.4-.7-.9-1.1-1.4-.4-.6-.3-1.4.2-1.8.6-.4 1.4-.3 1.8.2.4.5.8 1 1.1 1.4 1.3 1.6 2.1 2.6 2.7 3.9.3.6 0 1.4-.6 1.7C1013.9 377.3 1013.7 377.3 1013.5 377.3zM1019.7 377c-.3 0-.5-.1-.8-.2-.6-.4-.7-1.2-.3-1.8 1.2-1.7 2.3-3.4 3.3-5.2.3-.6 1.1-.9 1.7-.5.6.3.9 1.1.5 1.7-1 1.9-2.2 3.8-3.5 5.6C1020.4 376.8 1020.1 377 1019.7 377zM1329.7 573.4c-1.4 0-2.9-.2-4.5-.7-8.4-2.7-16.6-12.7-18.7-20-.4-1.4-.7-2.9-.9-4.4-8.1 3.3-15.5 10.6-15.4 21 0 1.5-1.2 2.7-2.7 2.8 0 0 0 0 0 0-1.5 0-2.7-1.2-2.7-2.7-.1-6.7 2.4-12.9 7-18 3.6-4 8.4-7.1 13.7-8.8.5-6.5 3.1-12.9 7.4-17.4 7-7.4 18.2-8.9 27.3-10.1l.7-.1c1.5-.2 2.9.9 3.1 2.3.2 1.5-.9 2.9-2.3 3.1l-.7.1c-8.6 1.2-18.4 2.5-24 8.4-3 3.2-5 7.7-5.7 12.4 7.9-1 17.7 1.3 24.3 5.7 4.3 2.9 7.1 7.8 7.2 12.7.2 4.3-1.7 8.3-5.2 11.1C1335.2 572.4 1332.6 573.4 1329.7 573.4zM1311 546.7c.1 1.5.4 3 .8 4.4 1.7 5.8 8.7 14.2 15.1 16.3 2.8.9 5.1.5 7.2-1.1 2.7-2.1 3.2-4.8 3.1-6.6-.1-3.2-2-6.4-4.8-8.3C1326.7 547.5 1317.7 545.6 1311 546.7z'/%3E%3C/g%3E%3C/svg%3E");
background-attachment: fixed;
 font-family: var(--body-font);
 color: var(--body-color);
 font-weight: 400;
 margin: 0;
}

%display {
 display: flex;
 align-items: center;
}

.book-store {
 display: flex;
 flex-direction: column;
 max-width: 1400px;
 height: 100vh;
 background-color: var(--page-bg-color);
 margin: 0 auto;
 overflow: hidden;
 box-shadow: 0px 2px 50px 10px rgba(0, 0, 0, 0.21);
}

.header {
 @extend %display;
 height: 70px;
 width: 100%;
 background-color: #ffffff;
 padding: 0 30px;
 font-size: 14px;
 font-weight: 500;
 color: var(--body-color-light);
 justify-content: space-between;
 flex-shrink: 0;
}

.search-bar {
 position: relative;
 input {
  height: 100%;
  width: 100%;
  display: block;
  background-color: transparent;
  border: none;
  font-weight: 600;
  padding: 0 10px 0 40px;
  background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' fill='none' stroke='%238b939c' stroke-width='3' stroke-linecap='round' stroke-linejoin='round' class='feather feather-search'%3e%3ccircle cx='11' cy='11' r='8'/%3e%3cpath d='M21 21l-4.35-4.35'/%3e%3c/svg%3e");
  background-repeat: no-repeat;
  background-size: 15px;
  background-position: 15px 50%;
  color: var(--body-color);
  font-family: var(--body-font);
  &::placeholder {
   color: var(--placeholder);
  }
 }
}

.browse {
 @extend %display;
 &-category {
  @extend %display;
  border-right: 1px solid var(--border-color);
  white-space: nowrap;
  svg {
   width: 16px;
   margin: 2px 10px 0 8px;
  }
 }
}

.header-title {
 font-size: 16px;
 font-weight: 400;
 margin-right: 120px;
 span {
  font-weight: 500;
  color: var(--body-color);
 }
}

.user-img {
 width: 28px;
 height: 28px;
 border-radius: 50%;
 margin-right: 15px;
}

.user-profile {
 position: relative;
 cursor: pointer;
 flex-shrink: 0;
 &:before {
  content: "";
  position: absolute;
  background-color: #f86d72;
  width: 7px;
  height: 7px;
  border-radius: 50%;
  border: 2px solid var(--theme-bg-color);
  right: 12px;
  top: -3px;
  border: 2px solid #fff;
 }
}

.profile {
 @extend %display;
 flex-shrink: 0;
 &-menu {
  @extend %display;
  border-left: 1px solid var(--border-color);
 }
 svg {
  width: 16px;
  margin: 0 8px 0 15px;
  flex-shrink: 0;
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
 &:nth-child(1) {
  background-color: #fbadaf;
 }
 &:nth-child(2) {
  background-color: #a4e0eb;
 }
 &:nth-child(3) {
  background-color: #edb9d6;
 }
 &:nth-child(4) {
  background-color: #fdca95;
 }
 &:nth-child(5) {
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

.flickity-prev-next-button {
 &.previous {
  left: 15px;
 }
 &.next {
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
 &:hover {
  transform: scale(1.03);
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

fieldset,
label {
 margin: 0;
 padding: 0;
 display: inline-block;
 vertical-align: middle;
}

h1 {
 font-size: 0.5em;
 margin: 10px;
}
.rating {
 border: none;
}

.rating > input {
 display: none;
}
.rating > label:before {
 margin-right: 5px;
 margin-top: 10px;
 font-size: 0.9em;
 font-family: FontAwesome;
 display: inline-block;
 content: "\f005";
}

.rating > label {
 color: #fff;
 float: right;
}

.rating > input:checked ~ label,
.rating:not(:checked) > label:hover,
.rating:not(:checked) > label:hover ~ label {
 color: #d85d61;
}
.rating > input:checked + label:hover,
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label,
.rating > input:checked ~ label:hover ~ label {
 color: #d85d61;
}

.blue > input:checked ~ label,
.blue:not(:checked) > label:hover,
.blue:not(:checked) > label:hover ~ label {
 color: #458997;
}
.blue > input:checked + label:hover,
.blue > input:checked ~ label:hover,
.blue > label:hover ~ input:checked ~ label,
.blue > input:checked ~ label:hover ~ label {
 color: #458997;
}

.purple > input:checked ~ label,
.purple:not(:checked) > label:hover,
.purple:not(:checked) > label:hover ~ label {
 color: #a76287;
}
.purple > input:checked + label:hover,
.purple > input:checked ~ label:hover,
.purple > label:hover ~ input:checked ~ label,
.purple > input:checked ~ label:hover ~ label {
 color: #a76287;
}

.yellow > input:checked ~ label,
.yellow:not(:checked) > label:hover,
.yellow:not(:checked) > label:hover ~ label {
 color: #ffad58;
}
.yellow > input:checked + label:hover,
.yellow > input:checked ~ label:hover,
.yellow > label:hover ~ input:checked ~ label,
.yellow > input:checked ~ label:hover ~ label {
 color: #ffad58;
}

.dark-purp > input:checked ~ label,
.dark-purp:not(:checked) > label:hover,
.dark-purp:not(:checked) > label:hover ~ label {
 color: #905587;
}
.dark-purp > input:checked + label:hover,
.dark-purp > input:checked ~ label:hover,
.dark-purp > label:hover ~ input:checked ~ label,
.dark-purp > input:checked ~ label:hover ~ label {
 color: #905587;
}

.book-voters {
 color: #fff;
 vertical-align: sub;
 font-size: 13px;
 margin-left: 7px;
 white-space: nowrap;
 margin-top: 7px;
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
 &:hover {
  color: #ff6e72;
 }
 &.book-blue {
  color: #a4e0eb;
  &:hover {
   color: #22cdec;
  }
 }
 &.book-pink {
  color: #edb9d6;
  &:hover {
   color: #ff6dbe;
  }
 }
 &.book-yellow {
  color: #fdca95;
  &:hover {
   color: #fb9124;
  }
 }
 &.book-purple {
  color: #cbb5e2;
  &:hover {
   color: #a764ec;
  }
 }
}

.main-wrapper {
 width: 100%;
 display: flex;
 flex-grow: 1;
 margin-top: 100px;
 overflow: hidden;
}

.books-of {
 width: 320px;
 display: flex;
 flex-direction: column;
 overflow-y: auto;
 overflow-x: hidden;
 flex-shrink: 0;
}

.popular-books {
 flex-grow: 1;
 padding: 0 30px 50px;
 overflow-y: auto;
}

.genre {
 font-weight: 500;
 font-size: 15px;
}

.main-menu {
 @extend %display;
 white-space: nowrap;
 padding-bottom: 15px;
 border-bottom: 1px solid #dcddde;
 position: sticky;
 top: 0;
 right: 0;
 background-color: var(--page-bg-color);
 z-index: 2;
}

.book-types {
 margin-left: auto;
 a {
  text-decoration: none;
  color: var(--body-color);
  font-size: 14px;
 }
}

.book-type + .book-type {
 margin-left: 20px;
}

.book-type {
 position: relative;
 transition: 0.2s;
 &.active,
 &:hover {
  -webkit-text-stroke: .3px;
  &:before {
   content: "";
   position: absolute;
   width: 28px;
   height: 2px;
   bottom: -17px;
   right: 15px;
   background-color: #67d4ea;
   box-shadow: 0px -1px 5px 0px #67d4ea;
  }
 }
 &:nth-child(2):before {
  right: 12px;
 }
 &:nth-child(3):before {
  right: 8px;
 }
 &:nth-child(4):before {
  right: 6px;
 }
 &:nth-child(5):before {
  right: 20px;
 }
}

.week {
 padding: 0 30px;
}

.author {
 @extend %display;
 & + & {
  margin-top: 20px;
 }
 &-name {
  font-size: 14px;
 }
 &:last-child {
  margin-bottom: 40px;
 }
}

.author-title {
 padding: 0 0 20px;
 font-weight: 500;
 font-size: 15px;
}

.author-img {
 border-radius: 50%;
 width: 30px;
 height: 30px;
 margin-right: 16px;
 object-fit: cover;
 object-position: center;
}

.year-book {
 @extend %display;
 &-img {
  width: 45px;
  margin-right: 16px;
 }
 &-name {
  margin-bottom: 15px;
  font-weight: 500;
 }
 &-author {
  font-size: 13px;
 }
 & + & {
  margin-top: 20px;
 }
}

.year-book-content {
 display: flex;
 flex-direction: column;
 font-size: 14px;
}

.overlay {
 position: sticky;
 bottom: 0;
 left: 0;
 width: 340px;
 flex-shrink: 0;
 background: linear-gradient(
  to bottom,
  rgba(255, 255, 255, 0) 0%,
  #f2f5f7 65%,
  #f2f5f7 100%
 );
 height: 60px;
 margin-left: -35px;
}

.book-cards {
 display: grid;
 grid-template-columns: repeat(2, 1fr);
 grid-column-gap: 40px;
 grid-row-gap: 40px;
 padding-top: 40px;
 position: relative;
}

.book-card {
 margin-top: 20px;
 background-color: #fff;
 height: 270px;
 box-shadow: -1px 3px 8px -1px rgba(0, 0, 0, 0.1);
 border-radius: 4px;
 display: flex;
 flex-direction: column;
 cursor: pointer;
 padding: 0 0 20px 20px;
 color: var(--body-color-light);
}

.book-card-img {
 width: 160px;
 margin-top: -35px;
 border-radius: 2px;
 box-shadow: 0px 1px 7px 2px #c7c9d3;
 border-bottom: 1px solid #dcddde;
 object-fit: cover;
 margin-bottom: 20px;
 transition: .3s ease;
 &:hover {
  transform: scale(1.04);
 }
}


.card-content {
 color: var(--body-color);
 padding: 30px;
 overflow: hidden;
 position: relative;
}

.book-name {
 font-weight: 500;
 text-overflow: ellipsis;
 overflow: hidden;
 white-space: nowrap;
}

.book-by {
 font-size: 13px;
 color: var(--body-color-light);
 margin-top: 4px;
 text-overflow: ellipsis;
 overflow: hidden;
 white-space: nowrap;
}

.book-rate > label {
 color: #cccccc;
}

.rate {
 display: inline-block;
 white-space: nowrap;
}

.book-rate > input:checked ~ label,
.book-rate:not(:checked) > label:hover,
.book-rate:not(:checked) > label:hover ~ label {
 color: #ff9700;
}
.book-rate > input:checked + label:hover,
.book-rate > input:checked ~ label:hover,
.book-rate > label:hover ~ input:checked ~ label,
.book-rate > input:checked ~ label:hover ~ label {
 color: #ff9700;
}

.card-vote {
 color: var(--body-color-light);
}

.card-sum {
 color: var(--body-color-light);
 font-size: 13px;
 line-height: 1.6em;
 -webkit-line-clamp: 4;
 margin-top: 15px;
}

.content-wrapper {
 display: flex;
 border-bottom: 1px solid #ebedef;
 position: relative;
 &:before {
  content: "";
  position: absolute;
  background-color: #8f98a9;
        background-color: #aaaebc;
    box-shadow: 0 -6px 0 0 #aaaebc, 0 6px 0 0 #aaaebc;
    width: 4px;
    height: 4px;
    border: 0;
    padding: 0;
    right: 12px;
    top: 17px;
    border-radius: 50%;
    margin-left: auto; 
 }
}

.like-profile {
 margin-top: 8px;
 & + & {
  margin-left: -5px;
 }
}

.like-img {
 border-radius: 50%;
 width: 28px;
 object-fit: cover;
 border: 2px solid #fff;
}

.like-name {
 font-size: 13px;
 margin-left: 15px;
 text-overflow: ellipsis;
 overflow: hidden;
 white-space: nowrap;
 span {
  font-weight: 600;
 }
}

.likes {
 @extend %display;
}


@media (max-width: 1103px) {
 .book-cell {
  width: 60%;
 }
}

@media (max-width: 765px) {
 .book-cell {
  width: 80%;
 }
}

@media (max-width: 575px) {
 .book-cell {
  width: 100%;
 }
}

@media (max-width: 458px) {
 .book-photo {
  width: 180px;
 }
 .book-voters {
  display: none;
 }
}

@media (max-width: 420px) {
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

@media (max-width: 360px) {
 .rating > label:before {
  font-size: 0.8em;
 }
}

@media (max-width: 1220px) {
 .card-vote {
  display: none;
 }
}

@media (max-width: 1085px) {
 .book-rate > label {
  font-size: .7em;
}
}

@media (max-width: 1045px) {
 .books-of {
  display: none;
}
}

@media (max-width: 725px) {
 .browse-category, .search-bar {
  display: none;
}
 .header-title {
  margin-right: auto;
 }
 .book-cards {
  grid-template-columns: 1fr;
 }
 .book-types {
  display: none;
 }
}

@media (max-width: 372px)  {
 .card-content {
  padding: 20px;
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

	<!-- 進行中講座區 -->
	<div id='pageWrapper'>
		<div class="header-title">On-Going Lecture</div>
		<hr>

		<!-------------------------------- CodePen貼過來的 -------------------------------->
		<div class="book-store">
 <div class="header">
  <div class="browse">
   <div class="browse-category">
    Browse Category
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down">
     <path d="M6 9l6 6 6-6" /></svg>
   </div>
   <div class="search-bar">
    <input type="text" placeholder="Search Book" />
   </div>
  </div>
  <div class="header-title">read<span>books</span></div>
  <div class="profile">
   <div class="user-profile">
    <img src="https://randomuser.me/api/portraits/women/63.jpg" alt="" class="user-img">
   </div>
   <div class="profile-menu">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu">
     <path d="M3 12h18M3 6h18M3 18h18" /></svg>
    Menu
   </div>
  </div>
 </div>
 <div class="book-slide">
  <div class="book js-flickity" data-flickity-options='{ "wrapAround": true }'>
   <div class="book-cell">
    <div class="book-img">
     <img src="https://images-na.ssl-images-amazon.com/images/I/81WcnNQ-TBL.jpg" alt="" class="book-photo">
    </div>
    <div class="book-content">
     <div class="book-title">BIG MAGIC</div>
     <div class="book-author">by Elizabeth Gilbert</div>
     <div class="rate">
      <fieldset class="rating">
       <input type="checkbox" id="star5" name="rating" value="5" />
       <label class="full" for="star5"></label>
       <input type="checkbox" id="star4" name="rating" value="4" />
       <label class="full" for="star4"></label>
       <input type="checkbox" id="star3" name="rating" value="3" />
       <label class="full" for="star3"></label>
       <input type="checkbox" id="star2" name="rating" value="2" />
       <label class="full" for="star2"></label>
       <input type="checkbox" id="star1" name="rating" value="1" />
       <label class="full" for="star1"></label>
      </fieldset>
      <span class="book-voters">1.987 voters</span>
     </div>
     <div class="book-sum">Readers of all ages and walks of life have drawn inspiration and empowerment from Elizabeth Gilbert’s books for years. </div>
     <div class="book-see">See The Book</div>
    </div>
   </div>
   <div class="book-cell">
    <div class="book-img">
     <img src="https://i.pinimg.com/originals/a8/b9/ff/a8b9ff74ed0f3efd97e09a7a0447f892.jpg" alt="" class="book-photo">
    </div>
    <div class="book-content">
     <div class="book-title">Ten Thousand Skies Above You</div>
     <div class="book-author">by Claudia Gray</div>
     <div class="rate">
      <fieldset class="rating blue">
       <input type="checkbox" id="star6" name="rating" value="5" />
       <label class="full1" for="star6"></label>
       <input type="checkbox" id="star7" name="rating" value="4" />
       <label class="full1" for="star7"></label>
       <input type="checkbox" id="star8" name="rating" value="3" />
       <label class="full1" for="star8"></label>
       <input type="checkbox" id="star9" name="rating" value="2" />
       <label class="full1" for="star9"></label>
       <input type="checkbox" id="star10" name="rating" value="1" />
       <label class="full1" for="star10"></label>
      </fieldset>
      <span class="book-voters">1.987 voters</span>
     </div>
     <div class="book-sum">The hunt for each splinter of Paul's soul sends Marguerite racing through a war-torn San Francisco.</div>
     <div class="book-see book-blue">See The Book</div>
    </div>
   </div>
   <div class="book-cell">
    <div class="book-img">
     <img src="https://www.abebooks.com/blog/wp-content/uploads/2016/08/10.jpg" alt="" class="book-photo">
    </div>
    <div class="book-content">
     <div class="book-title">A Tale For The Time Being</div>
     <div class="book-author">by Ruth Ozeki</div>
     <div class="rate">
      <fieldset class="rating purple">
       <input type="checkbox" id="star11" name="rating" value="5" />
       <label class="full" for="star11"></label>
       <input type="checkbox" id="star12" name="rating" value="4" />
       <label class="full" for="star12"></label>
       <input type="checkbox" id="star13" name="rating" value="3" />
       <label class="full" for="star13"></label>
       <input type="checkbox" id="star14" name="rating" value="2" />
       <label class="full" for="star14"></label>
       <input type="checkbox" id="star15" name="rating" value="1" />
       <label class="full" for="star15"></label>
      </fieldset>
      <span class="book-voters">1.987 voters</span>
     </div>
     <div class="book-sum">In Tokyo, sixteen-year-old Nao has decided there’s only one escape from her aching loneliness and her classmates’ bullying.</div>
     <div class="book-see book-pink">See The Book</div>
    </div>
   </div>
   <div class="book-cell">
    <div class="book-img">
     <img src="https://images-na.ssl-images-amazon.com/images/I/81af+MCATTL.jpg" alt="" class="book-photo">
    </div>
    <div class="book-content">
     <div class="book-title">The Great Gatsby</div>
     <div class="book-author">by F.Scott Fitzgerald</div>
     <div class="rate">
      <fieldset class="rating yellow">
       <input type="checkbox" id="star16" name="rating" value="5" />
       <label class="full" for="star16"></label>
       <input type="checkbox" id="star17" name="rating" value="4" />
       <label class="full" for="star17"></label>
       <input type="checkbox" id="star18" name="rating" value="3" />
       <label class="full" for="star18"></label>
       <input type="checkbox" id="star19" name="rating" value="2" />
       <label class="full" for="star19"></label>
       <input type="checkbox" id="star20" name="rating" value="1" />
       <label class="full" for="star20"></label>
      </fieldset>
      <span class="book-voters">1.987 voters</span>
     </div>
     <div class="book-sum">The Great Gatsby, F. Scott Fitzgerald’s third book, stands as the supreme achievement of his career.</div>
     <div class="book-see book-yellow">See The Book</div>
    </div>
   </div>
   <div class="book-cell">
    <div class="book-img">
     <img src="https://images-na.ssl-images-amazon.com/images/I/81UWB7oUZ0L.jpg" alt="" class="book-photo">
    </div>
    <div class="book-content">
     <div class="book-title">After You</div>
     <div class="book-author">by Jojo Moyes</div>
     <div class="rate">
      <fieldset class="rating dark-purp">
       <input type="checkbox" id="star21" name="rating" value="5" />
       <label class="full" for="star21"></label>
       <input type="checkbox" id="star22" name="rating" value="4" />
       <label class="full" for="star22"></label>
       <input type="checkbox" id="star23" name="rating" value="3" />
       <label class="full" for="star23"></label>
       <input type="checkbox" id="star24" name="rating" value="2" />
       <label class="full" for="star24"></label>
       <input type="checkbox" id="star25" name="rating" value="1" />
       <label class="full" for="star25"></label>
      </fieldset>
      <span class="book-voters">1.987 voters</span>
     </div>
     <div class="book-sum">Louisa Clark is no longer just an ordinary girl living an ordinary life. After the transformative six months spent.</div>
     <div class="book-see book-purple">See The Book</div>
    </div>
   </div>
  </div>
 </div>
 <div class="main-wrapper">
  <div class="books-of">
   <div class="week">
    <div class="author-title">Author of the week</div>
    <div class="author">
     <img src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80" alt="" class="author-img">
     <div class="author-name">Sebastian Jeremy</div>
    </div>
    <div class="author">
     <img src="https://images.unsplash.com/photo-1586297098710-0382a496c814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80" alt="" class="author-img">
     <div class="author-name">Jonathan Doe</div>
    </div>
    <div class="author">
     <img src="https://images.unsplash.com/photo-1573140247632-f8fd74997d5c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" alt="" class="author-img">
     <div class="author-name">Angeline Summer</div>
    </div>
    <div class="author">
     <img src="https://pbs.twimg.com/profile_images/737221709267374081/sdwta9Oh.jpg" alt="" class="author-img">
     <div class="author-name">Noah Jones</div>
    </div>
    <div class="author">
     <img src="https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png" alt="" class="author-img">
     <div class="author-name">Tommy Adam</div>
    </div>
    <div class="author">
     <img src="https://images.unsplash.com/photo-1546961329-78bef0414d7c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" alt="" class="author-img">
     <div class="author-name">Ian Cassandra</div>
    </div>
   </div>
   <div class="week year">
    <div class="author-title">Books of the year</div>
    <div class="year-book">
     <img src="https://images-na.ssl-images-amazon.com/images/I/A1kNdYXw0GL.jpg" alt="" class="year-book-img">
     <div class="year-book-content">
      <div class="year-book-name">Disappearing Earth</div>
      <div class="year-book-author">by Julia Phillips</div>
     </div>
    </div>
    <div class="year-book">
     <img src="https://images-na.ssl-images-amazon.com/images/I/81eI0ExR+VL.jpg" alt="" class="year-book-img">
     <div class="year-book-content">
      <div class="year-book-name">Lost Children Archive</div>
      <div class="year-book-author">by Valeria Luiselli</div>
     </div>
    </div>
    <div class="year-book">
     <img src="https://images-na.ssl-images-amazon.com/images/I/81OF9eJDA4L.jpg" alt="" class="year-book-img">
     <div class="year-book-content">
      <div class="year-book-name">Phantoms: A Thriller </div>
      <div class="year-book-author">by Dean Koontz</div>
     </div>
    </div>
    <div class="year-book">
     <img src="https://m.media-amazon.com/images/I/515FWPyZ-5L.jpg" alt="" class="year-book-img">
     <div class="year-book-content">
      <div class="year-book-name">Midnight in Chernobyl</div>
      <div class="year-book-author">by Adam Higginbotham</div>
     </div>
    </div>
    <div class="year-book">
     <img src="https://images-na.ssl-images-amazon.com/images/I/91dBtgERNUL.jpg" alt="" class="year-book-img">
     <div class="year-book-content">
      <div class="year-book-name">10 Minutes 38 Seconds</div>
      <div class="year-book-author">by Elif Shafak</div>
     </div>
    </div>
   </div>
   <div class="overlay"></div>
  </div>
  <div class="popular-books">
   <div class="main-menu">
    <div class="genre">Popular by Genre</div>
    <div class="book-types">
     <a href="#" class="book-type active"> All Genres</a>
     <a href="#" class="book-type"> Business</a>
     <a href="#" class="book-type"> Science</a>
     <a href="#" class="book-type"> Fiction</a>
     <a href="#" class="book-type"> Philosophy</a>
     <a href="#" class="book-type"> Biography</a>
    </div>
   </div>
   <div class="book-cards">
    <div class="book-card">
     <div class="content-wrapper">
     <img src="https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2019%2F07%2Fchances-are-1-2000.jpg&q=85" alt="" class="book-card-img">
     <div class="card-content">
     <div class="book-name">Changes Are</div>
      <div class="book-by">by Richard Russo</div>
      <div class="rate">
<fieldset class="rating book-rate">
<input type="checkbox" id="star-c1" name="rating" value="5">
<label class="full" for="star-c1"></label>
<input type="checkbox" id="star-c2" name="rating" value="4">
<label class="full" for="star-c2"></label>
<input type="checkbox" id="star-c3" name="rating" value="3">
<label class="full" for="star-c3"></label>
<input type="checkbox" id="star-c4" name="rating" value="2">
<label class="full" for="star-c4"></label>
<input type="checkbox" id="star-c5" name="rating" value="1">
<label class="full" for="star-c5"></label>
</fieldset>
<span class="book-voters card-vote">1.987 voters</span>
</div>
       <div class="book-sum card-sum">Readers of all ages and walks of life have drawn inspiration and empowerment from Elizabeth Gilbert’s books for years. </div>
      </div>
    </div>
     <div class="likes">
     <div class="like-profile">
    <img src="https://randomuser.me/api/portraits/women/63.jpg" alt="" class="like-img">
   </div>
     <div class="like-profile">
    <img src="https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png" alt="" class="like-img">
   </div>
     <div class="like-profile">
    <img src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80" alt="" class="like-img">
   </div>
     <div class="like-name"><span>Samantha William</span> and<span> 2 other friends</span> like this</div>
   </div>
    </div>
    <div class="book-card">
     <div class="content-wrapper">
     <img src="https://images-na.ssl-images-amazon.com/images/I/7167iiDUeAL.jpg" alt="" class="book-card-img">
     <div class="card-content">
     <div class="book-name">Dominicana</div>
      <div class="book-by">by Angie Cruz</div>
      <div class="rate">
<fieldset class="rating book-rate">
<input type="checkbox" id="star-c6" name="rating" value="5">
<label class="full" for="star-c6"></label>
<input type="checkbox" id="star-c7" name="rating" value="4">
<label class="full" for="star-c7"></label>
<input type="checkbox" id="star-c8" name="rating" value="3">
<label class="full" for="star-c8"></label>
<input type="checkbox" id="star-c9" name="rating" value="2">
<label class="full" for="star-c9"></label>
<input type="checkbox" id="star-c10" name="rating" value="1">
<label class="full" for="star-c10"></label>
</fieldset>
<span class="book-voters card-vote">1.987 voters</span>
</div>
       <div class="book-sum card-sum">Readers of all ages and walks of life have drawn inspiration and empowerment from Elizabeth Gilbert’s books for years. </div>
      </div>
    </div>
     <div class="likes">
     <div class="like-profile">
    <img src="https://randomuser.me/api/portraits/women/63.jpg" alt="" class="like-img">
   </div>
     <div class="like-name"><span>Kimberly Jones</span> like this</div>
   </div>
    </div>
    <div class="book-card">
     <div class="content-wrapper">
     <img src="https://assets.fontsinuse.com/static/use-media-items/95/94294/full-2000x3056/5d56c6b1/cg%201.jpeg?resolution=0" alt="" class="book-card-img">
     <div class="card-content">
     <div class="book-name">The Travellers</div>
      <div class="book-by">by Regina Porter</div>
      <div class="rate">
<fieldset class="rating book-rate">
<input type="checkbox" id="star-c11" name="rating" value="5">
<label class="full" for="star-c11"></label>
<input type="checkbox" id="star-c12" name="rating" value="4">
<label class="full" for="star-c12"></label>
<input type="checkbox" id="star-c13" name="rating" value="3">
<label class="full" for="star-c13"></label>
<input type="checkbox" id="star-c14" name="rating" value="2">
<label class="full" for="star-c14"></label>
<input type="checkbox" id="star-c15" name="rating" value="1">
<label class="full" for="star-c15"></label>
</fieldset>
<span class="book-voters card-vote">1.987 voters</span>
</div>
       <div class="book-sum card-sum">Readers of all ages and walks of life have drawn inspiration and empowerment from Elizabeth Gilbert’s books for years. </div>
      </div>
    </div>
     <div class="likes">
     <div class="like-profile">
    <img src="https://randomuser.me/api/portraits/women/63.jpg" alt="" class="like-img">
   </div>
     <div class="like-profile">
    <img src="https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png" alt="" class="like-img">
   </div>
     <div class="like-name"><span>Adam</span> and<span> Kimberly</span> like this</div>
   </div>
    </div>
    <div class="book-card">
     <div class="content-wrapper">
     <img src="https://images-na.ssl-images-amazon.com/images/I/91M4E+SURUL.jpg" alt="" class="book-card-img">
     <div class="card-content">
     <div class="book-name">Afternoon Of A Faun</div>
      <div class="book-by">by James Lasdun</div>
      <div class="rate">
<fieldset class="rating book-rate">
<input type="checkbox" id="star-c16" name="rating" value="5">
<label class="full" for="star-c16"></label>
<input type="checkbox" id="star-c17" name="rating" value="4">
<label class="full" for="star-c17"></label>
<input type="checkbox" id="star-18" name="rating" value="3">
<label class="full" for="star-c18"></label>
<input type="checkbox" id="star-c19" name="rating" value="2">
<label class="full" for="star-c19"></label>
<input type="checkbox" id="star-c20" name="rating" value="1">
<label class="full" for="star-c20"></label>
</fieldset>
<span class="book-voters card-vote">1.987 voters</span>
</div>
       <div class="book-sum card-sum">Readers of all ages and walks of life have drawn inspiration and empowerment from Elizabeth Gilbert’s books for years. </div>
      </div>
    </div>
     <div class="likes">
     <div class="like-profile">
    <img src="https://randomuser.me/api/portraits/women/63.jpg" alt="" class="like-img">
   </div>
     <div class="like-profile">
    <img src="https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png" alt="" class="like-img">
   </div>
     <div class="like-profile">
    <img src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80" alt="" class="like-img">
   </div>
     <div class="like-name"><span>Samantha William</span> and<span> 2 other friends</span> like this</div>
   </div>
    </div>
    <div class="book-card">
     <div class="content-wrapper">
     <img src="https://images-na.ssl-images-amazon.com/images/I/61OTY2-4anL.jpg" alt="" class="book-card-img">
     <div class="card-content">
     <div class="book-name">Flash Count Diary</div>
      <div class="book-by">by Darcey Steinke</div>
      <div class="rate">
<fieldset class="rating book-rate">
<input type="checkbox" id="star-c21" name="rating" value="5">
<label class="full" for="star-c21"></label>
<input type="checkbox" id="star-c22" name="rating" value="4">
<label class="full" for="star-c22"></label>
<input type="checkbox" id="star-c23" name="rating" value="3">
<label class="full" for="star-c23"></label>
<input type="checkbox" id="star-c24" name="rating" value="2">
<label class="full" for="star-c24"></label>
<input type="checkbox" id="star-c25" name="rating" value="1">
<label class="full" for="star-c25"></label>
</fieldset>
<span class="book-voters card-vote">1.987 voters</span>
</div>
       <div class="book-sum card-sum">Readers of all ages and walks of life have drawn inspiration and empowerment from Elizabeth Gilbert’s books for years. </div>
      </div>
    </div>
     <div class="likes">
     <div class="like-profile">
    <img src="https://randomuser.me/api/portraits/women/63.jpg" alt="" class="like-img">
   </div>
     <div class="like-profile">
    <img src="https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png" alt="" class="like-img">
   </div>
     <div class="like-profile">
    <img src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80" alt="" class="like-img">
   </div>
     <div class="like-name"><span>Angelina Stone</span> and<span> 2 other friends</span> like this</div>
   </div>
    </div>
    <div class="book-card">
     <div class="content-wrapper">
     <img src="https://images-na.ssl-images-amazon.com/images/I/61Vc+xM23GL.jpg" alt="" class="book-card-img">
     <div class="card-content">
     <div class="book-name">Picnic Comma Lightning</div>
      <div class="book-by">by Lucy Parker</div>
      <div class="rate">
<fieldset class="rating book-rate">
<input type="checkbox" id="star-c1" name="rating" value="5">
<label class="full" for="star-c1"></label>
<input type="checkbox" id="star-c2" name="rating" value="4">
<label class="full" for="star-c2"></label>
<input type="checkbox" id="star-c3" name="rating" value="3">
<label class="full" for="star-c3"></label>
<input type="checkbox" id="star-c4" name="rating" value="2">
<label class="full" for="star-c4"></label>
<input type="checkbox" id="star-c5" name="rating" value="1">
<label class="full" for="star-c5"></label>
</fieldset>
<span class="book-voters card-vote">1.987 voters</span>
</div>
       <div class="book-sum card-sum">Readers of all ages and walks of life have drawn inspiration and empowerment from Elizabeth Gilbert’s books for years. </div>
      </div>
    </div>
     <div class="likes">
     <div class="like-profile">
    <img src="https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png" alt="" class="like-img">
   </div>
     <div class="like-profile">
    <img src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80" alt="" class="like-img">
   </div>
     <div class="like-name"><span>George</span> and<span> Mike</span> like this</div>
   </div>
    </div>
    <div class="book-card">
     <div class="content-wrapper">
     <img src="https://prodimage.images-bn.com/pimages/9780525655633_p0_v5_s1200x630.jpg" alt="" class="book-card-img">
     <div class="card-content">
     <div class="book-name">Very Nica</div>
      <div class="book-by">by Lucy Parker</div>
      <div class="rate">
<fieldset class="rating book-rate">
<input type="checkbox" id="star-c1" name="rating" value="5">
<label class="full" for="star-c1"></label>
<input type="checkbox" id="star-c2" name="rating" value="4">
<label class="full" for="star-c2"></label>
<input type="checkbox" id="star-c3" name="rating" value="3">
<label class="full" for="star-c3"></label>
<input type="checkbox" id="star-c4" name="rating" value="2">
<label class="full" for="star-c4"></label>
<input type="checkbox" id="star-c5" name="rating" value="1">
<label class="full" for="star-c5"></label>
</fieldset>
<span class="book-voters card-vote">1.987 voters</span>
</div>
       <div class="book-sum card-sum">Readers of all ages and walks of life have drawn inspiration and empowerment from Elizabeth Gilbert’s books for years. </div>
      </div>
    </div>
     <div class="likes">
     <div class="like-profile">
    <img src="https://randomuser.me/api/portraits/women/63.jpg" alt="" class="like-img">
   </div>
     <div class="like-profile">
    <img src="https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png" alt="" class="like-img">
   </div>
     <div class="like-profile">
    <img src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80" alt="" class="like-img">
   </div>
     <div class="like-name"><span>Samantha William</span> and<span> 2 other friends</span> like this</div>
   </div>
    </div>
    <div class="book-card">
     <div class="content-wrapper">
     <img src="https://images-na.ssl-images-amazon.com/images/I/71PL7BiZ5NL.jpg" alt="" class="book-card-img">
     <div class="card-content">
     <div class="book-name">Stay And Fight</div>
      <div class="book-by">by Lucy Parker</div>
      <div class="rate">
<fieldset class="rating book-rate">
<input type="checkbox" id="star-c1" name="rating" value="5">
<label class="full" for="star-c1"></label>
<input type="checkbox" id="star-c2" name="rating" value="4">
<label class="full" for="star-c2"></label>
<input type="checkbox" id="star-c3" name="rating" value="3">
<label class="full" for="star-c3"></label>
<input type="checkbox" id="star-c4" name="rating" value="2">
<label class="full" for="star-c4"></label>
<input type="checkbox" id="star-c5" name="rating" value="1">
<label class="full" for="star-c5"></label>
</fieldset>
<span class="book-voters card-vote">1.987 voters</span>
</div>
       <div class="book-sum card-sum">Readers of all ages and walks of life have drawn inspiration and empowerment from Elizabeth Gilbert’s books for years. </div>
      </div>
    </div>
     <div class="likes">
     <div class="like-profile">
    <img src="https://randomuser.me/api/portraits/women/63.jpg" alt="" class="like-img">
   </div>
     <div class="like-profile">
    <img src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80" alt="" class="like-img">
   </div>
     <div class="like-name"><span>Samantha William</span> and<span> Jonathan</span> like this</div>
   </div>
    </div>
   </div>
  </div>
 </div>
</div>
		<!--  ------ -->
	</div>
	<!-- ------------------------------------------------------------------------------>

	<!-- 即將舉辦講座區 -->
	<div id='pageWrapper'>
		<div class="header-title">Upcoming Lecture</div>

		<hr>
	</div>

	<!-- 精采回顧區 -->
	<div id='pageWrapper'>
		<div class="header-title">Archived Lecture</div>

		<hr>
	</div>

	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />
	
	
	
</body>
</html>