package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by imqsl on 2017-11-21.
 */
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        String search=req.getParameter("search");
        if (search.length()==42){
            resp.sendRedirect("acount.html?coinbase="+search);
        }else if (search.length()==66){
            resp.sendRedirect("tx.html?id="+search);
        }else if (search==""||search==null){
            resp.sendRedirect("search.html");
        }else if (isNumeric(search)){
            resp.sendRedirect("block.html?number="+search);
        }else {
            resp.sendRedirect("search.html");
            out.print("其他");
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
    public boolean isNumeric(String str){
        Pattern pattern = Pattern.compile("[0-9]*");
        Matcher isNum = pattern.matcher(str);
        if( !isNum.matches() ){
            return false;
        }
        return true;
    }
}
