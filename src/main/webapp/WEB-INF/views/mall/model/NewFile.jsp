<div class="app-content">
			<div class="app-content-header">
				<h1 class="app-content-headerText">Post</h1>
				<!--       月亮 -->
				<button class="mode-switch" title="Switch Theme" id="switch_moon">
					<svg class="moon" fill="none" stroke="currentColor"
						stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
						width="24" height="24" viewBox="0 0 24 24">
          <defs></defs>
          <path d="M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z"></path>
        </svg>
				</button>
			</div>
			<div class="app-content-actions">
				<!--     搜尋 -->
				<input class="search-bar" placeholder="Search..." type="text">
				<div class="app-content-actions-wrapper">
					<div class="filter-button-wrapper">
						<!--         過濾器 -->
						<button class="action-button filter jsFilter">
							<span>Filter</span>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-filter">
								<polygon points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3" /></svg>
						</button>
						<div class="filter-menu">
							<label>Category</label> <select>
								<option>All Categories</option>
								<option>Furniture</option>
								<option>Decoration</option>
								<option>Kitchen</option>
								<option>Bathroom</option>
							</select> <label>Status</label> <select>
								<option>All Status</option>
								<option>Active</option>
								<option>Disabled</option>
							</select>
							<div class="filter-menu-buttons">
								<button class="filter-button reset">Reset</button>
								<button class="filter-button apply">Apply</button>
							</div>
						</div>
					</div>
					<button class="action-button list active" title="List View">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-list">
							<line x1="8" y1="6" x2="21" y2="6" />
							
							<line x1="8" y1="12" x2="21" y2="12" />
							
							<line x1="8" y1="18" x2="21" y2="18" />
							
							<line x1="3" y1="6" x2="3.01" y2="6" />
							
							<line x1="3" y1="12" x2="3.01" y2="12" />
							
							<line x1="3" y1="18" x2="3.01" y2="18" /></svg>
					</button>
					<button class="action-button grid" title="Grid View">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-grid">
							<rect x="3" y="3" width="7" height="7" />
							
							<rect x="14" y="3" width="7" height="7" />
							
							<rect x="14" y="14" width="7" height="7" />
							
							<rect x="3" y="14" width="7" height="7" /></svg>
					</button>
				</div>
			</div>
			<div>
				<a class="" href="<c:url value="/admin/adminManage/adminPost"></c:url>">回上一頁</a>
			</div>
			<br>
			<div style="padding:3% 5%; margin-top: -3%;">
				<fieldset style="width: 90%; height: 100%;">
					<legend>修改文章</legend>
					<form:form method="POST" modelAttribute="postBean"
						enctype='multipart/form-data'>
						<table>
							<tr>
								<td>文章標題：</td>
								<td width='600'><form:input path='postTitle' type="text" />
									<form:errors path="postTitle" cssClass="error" /></td>
							</tr>
							<tr>
							<tr>
								<td>文章分類</td>
								<td><form:select path='postCategoryBean.postCategoryId'>
										<form:option label="請挑選" value="-1" />
										<form:options items="${postCategoryBeanList}"
											itemLabel='postCategoryName' itemValue='postCategoryId' />
									</form:select> <form:errors path="postCategoryBean" cssClass="error" /></td>

							</tr>
							<tr>
								<td>文章狀態：</td>
								<td width='600'>
								 	<form:radiobutton path="postStatus" value="1"/> 正常 
        							<form:radiobutton path="postStatus" value="2"/> 禁止  
								</td>
							</tr>
							<tr>
								<td>文章圖片：</td>
								<td width='600'><form:input path='postMultiImg' type="file" />
									<form:errors path="postMultiImg" cssClass="error" /></td>
							</tr>
							<tr>
								<td>文章內容：</td>
								<td width='600'><form:textarea path='postContent'
										style="width: 140%; height: 310px; overflow-y: scroll;" /> <form:errors
										path="postContent" cssClass="error" /></td>
							<tr>
								<td><input type='submit'></td>
								<td><input type="reset" value="Reset"></td>
							<tr>
						</table>
					</form:form>
				</fieldset>
			</div>
			</div>