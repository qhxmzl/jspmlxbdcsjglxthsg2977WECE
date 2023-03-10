<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<footer id="footer-sec" class="footer">
    <div class="up-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-12 foot-about">
                    <div class="widget footer-widget text-widget">
                        <h2 class="dark-title">
                            <a >
                                行为准则
                            </a>
                        </h2>
                        <div class="f-about">
                            <p>

                            <p> 忠信仁义，以人为本。 <br>
                                忠：即忠诚，忠于国家、忠于民族、忠于客户。 <br>
                                信：即诚信，立足根本道德、信义，要诚实、讲信用。 <br>
                                义：即大义，不做损人利己的事。 <br>
                            </p>
                            </p>
                        </div>

                    </div>
                </div>
                <div class="col-md-3 col-sm-6 hidden-sm hidden-xs foot-contact">
                    <div class="widget footer-widget">
                        <h2 class="dark-title">
                            <a>
                                联系信息
                            </a>
                        </h2>
                        <div class="f-contact">
                            <p>
                                <i class="fa fa-map-marker">
                                </i>
                                &nbsp;&nbsp;地址：xxxxxxxxxxxxxxx
                            </p>
                            <p>
                                <i class="fa fa-envelope">
                                </i>
                                &nbsp;邮箱：xxxxxxx@xx.com
                            </p>
                            <p>
                                <i class="fa fa-globe">
                                </i>
                                &nbsp;网址：www.xxxxxx.com
                            </p>
                        </div>
                    </div>
                </div>
                <div class="clearfix visible-sm-block hidden-sm hidden-xs ">
                </div>
                <div class="col-md-3 col-sm-6 hidden-sm hidden-xs foot-nav">
                    <div class="widget footer-widget tags-widget">
                        <h2>
                            友情链接
                        </h2>
                        <ul>
                            <%
                                for(HashMap mapyqlj:new CommDAO().select("select * from youqinglianjie order by id desc",1,8)){
                            %>
                            <li>
                                <a href="<%=mapyqlj.get("wangzhi") %>" target="_blank">
                                    <%=mapyqlj.get("wangzhanmingcheng") %>
                                </a>
                            </li>
                            <%
                                }
                            %>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-line copyright">
        <div class="container">
            <p>
                COPYRIGHT &copy;  流行病调查数据管理系统
                <b>
                    -向着一流的信息化解决方案而努力
                </b>
                All rights reserved.
            </p>
        </div>
    </div>
</footer>
