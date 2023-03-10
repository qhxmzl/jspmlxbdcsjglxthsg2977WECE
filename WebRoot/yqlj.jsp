<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="homeLink">
			<div class="wrap">
				<div class="homeTitle">
					<h2>友情链接</h2>
					<h3><span>Friendship link</span></h3>
					<div class="line"></div>
				</div>
				<div class="homeLinkWrap">
				<%
    for(HashMap mapyqlj:new CommDAO().select("select * from youqinglianjie order by id desc",1,8)){
     %>
					<a href="<%=mapyqlj.get("wangzhi") %>"  target="_blank"><%=mapyqlj.get("wangzhanmingcheng") %></a>
					 <%
								  }
								  %>
					  
				</div>
				
			</div>
		</div>