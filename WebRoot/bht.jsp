<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="slider" class="slider2">
    <div class="tp-banner-container">
        <div class="tp-banner">
            <ul><%--前台变换图--%>
                <%
                    int bhti=0;
                    int xxbbt=0;
                    for(HashMap map:new CommDAO().select("select shouyetupian from xinwentongzhi where leibie='变幻图'  order by id desc ")){
                        bhti++;
                        if(bhti<=5)
                        {
                %>
                <li data-transition="random" data-slotamount="7" data-masterspeed="500">
                    <img src="<%=map.get("shouyetupian")%>"  data-bgfit="cover" data-bgposition="center top" data-bgrepeat="no-repeat"/>
                </li>
                <%
                        }
                    }
                %>

            </ul>
            <div class="tp-bannertimer">
            </div>
        </div>
    </div>
</div>