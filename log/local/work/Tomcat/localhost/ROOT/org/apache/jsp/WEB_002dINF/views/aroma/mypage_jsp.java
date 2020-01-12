/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.29
 * Generated at: 2020-01-12 23:06:56 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.aroma;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class mypage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\r\n");
      out.write("    <title>Aroma Shop - Blog</title>\r\n");
      out.write("    <link rel=\"icon\" href=\"/img/Fevicon.png\" type=\"image/png\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"vendors/bootstrap/bootstrap.min.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"vendors/fontawesome/css/all.min.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"vendors/themify-icons/themify-icons.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"vendors/linericon/style.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"vendors/owl-carousel/owl.theme.default.min.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"vendors/owl-carousel/owl.carousel.min.css\">\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/style.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<!-- ================ start banner area ================= -->\r\n");
      out.write("<section class=\"blog-banner-area\" id=\"blog\">\r\n");
      out.write("    <div class=\"container h-100\">\r\n");
      out.write("        <div class=\"blog-banner\">\r\n");
      out.write("            <div class=\"text-center\">\r\n");
      out.write("                <h1>My Page</h1>\r\n");
      out.write("                <nav aria-label=\"breadcrumb\" class=\"banner-breadcrumb\">\r\n");
      out.write("                    <ol class=\"breadcrumb\">\r\n");
      out.write("                        <li class=\"breadcrumb-item\"><a href=\"#\">Home</a></li>\r\n");
      out.write("                        <li class=\"breadcrumb-item active\" aria-current=\"page\">Blog</li>\r\n");
      out.write("                    </ol>\r\n");
      out.write("                </nav>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</section>\r\n");
      out.write("<!-- ================ end banner area ================= -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!--================Blog Categorie Area =================-->\r\n");
      out.write("<section class=\"blog_categorie_area\">\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <div class=\"col-sm-6 col-lg-4 mb-4 mb-lg-0\">\r\n");
      out.write("                <div class=\"categories_post\">\r\n");
      out.write("                    <img class=\"card-img100 rounded-0\" src=\"/img/blog/cat-post/1.jpg\" alt=\"post\">\r\n");
      out.write("                    <div class=\"categories_details\">\r\n");
      out.write("                        <div class=\"categories_text\">\r\n");
      out.write("                            <a href=\"/aroma/recentBook\">\r\n");
      out.write("                                <h5>최근 본 책</h5>\r\n");
      out.write("                            </a>\r\n");
      out.write("                            <div class=\"border_line\"></div>\r\n");
      out.write("                            <p>Enjoy your social life together</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-sm-6 col-lg-4 mb-4 mb-lg-0\">\r\n");
      out.write("                <div class=\"categories_post\">\r\n");
      out.write("                    <img class=\"card-img100 rounded-0\" src=\"/img/blog/cat-post/cat-post-2.jpg\" alt=\"post\">\r\n");
      out.write("                    <div class=\"categories_details\">\r\n");
      out.write("                        <div class=\"categories_text\">\r\n");
      out.write("                            <a href=\"single-blog.html\">\r\n");
      out.write("                                <h5>결제 내역</h5>\r\n");
      out.write("                            </a>\r\n");
      out.write("                            <div class=\"border_line\"></div>\r\n");
      out.write("                            <p>Be a part of politics</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-sm-6 col-lg-4 mb-4 mb-lg-0\">\r\n");
      out.write("                <div class=\"categories_post\">\r\n");
      out.write("                    <img class=\"card-img100 rounded-0\" src=\"/img/blog/cat-post/4.jpg\" alt=\"post\">\r\n");
      out.write("                    <div class=\"categories_details\">\r\n");
      out.write("                        <div class=\"categories_text\">\r\n");
      out.write("                            <a href=\"single-blog.html\">\r\n");
      out.write("                                <h5>내 리뷰 관리</h5>\r\n");
      out.write("                            </a>\r\n");
      out.write("                            <div class=\"border_line\"></div>\r\n");
      out.write("                            <p>Let the food be finished</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div style=\"height: 50px;\"></div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <div class=\"col-sm-6 col-lg-4 mb-4 mb-lg-0\">\r\n");
      out.write("                <div class=\"categories_post\">\r\n");
      out.write("                    <img class=\"card-img100 rounded-0\" src=\"/img/blog/cat-post/5.jpg\" alt=\"post\">\r\n");
      out.write("                    <div class=\"categories_details\">\r\n");
      out.write("                        <div class=\"categories_text\">\r\n");
      out.write("                            <a href=\"single-blog.html\">\r\n");
      out.write("                                <h5>내 정보 수정</h5>\r\n");
      out.write("                            </a>\r\n");
      out.write("                            <div class=\"border_line\"></div>\r\n");
      out.write("                            <p>Enjoy your social life together</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-sm-6 col-lg-4 mb-4 mb-lg-0\">\r\n");
      out.write("                <div class=\"categories_post\">\r\n");
      out.write("                    <img class=\"card-img100 rounded-0\" src=\"/img/blog/cat-post/2.jpg\" alt=\"post\">\r\n");
      out.write("                    <div class=\"categories_details\">\r\n");
      out.write("                        <div class=\"categories_text\">\r\n");
      out.write("                            <a href=\"single-blog.html\">\r\n");
      out.write("                                <h5>장바구니</h5>\r\n");
      out.write("                            </a>\r\n");
      out.write("                            <div class=\"border_line\"></div>\r\n");
      out.write("                            <p>Be a part of politics</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-sm-6 col-lg-4 mb-4 mb-lg-0\">\r\n");
      out.write("                <div class=\"categories_post\">\r\n");
      out.write("                    <img class=\"card-img100 rounded-0\" src=\"/img/blog/cat-post/3.jpg\" alt=\"post\">\r\n");
      out.write("                    <div class=\"categories_details\">\r\n");
      out.write("                        <div class=\"categories_text\">\r\n");
      out.write("                            <a href=\"single-blog.html\">\r\n");
      out.write("                                <h5>기타</h5>\r\n");
      out.write("                            </a>\r\n");
      out.write("                            <div class=\"border_line\"></div>\r\n");
      out.write("                            <p>Let the food be finished</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</section>\r\n");
      out.write("<!--================Blog Categorie Area =================-->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!--================Blog Area =================-->\r\n");
      out.write("\r\n");
      out.write("<!--================Instagram Area =================-->\r\n");
      out.write("\r\n");
      out.write("<!--================End Instagram Area =================-->\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}