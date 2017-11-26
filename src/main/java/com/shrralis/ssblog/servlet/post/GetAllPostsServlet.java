package com.shrralis.ssblog.servlet.post;

import com.shrralis.ssblog.service.PostServiceImpl;
import com.shrralis.ssblog.service.interfaces.IPostService;
import com.shrralis.tools.model.JsonError;
import com.shrralis.tools.model.JsonResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/")
public class GetAllPostsServlet extends HttpServlet {
    private static Logger logger = LoggerFactory.getLogger(GetAllPostsServlet.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        IPostService postService;
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/posts.jsp");

        try {
            postService = new PostServiceImpl();
        } catch (ClassNotFoundException | SQLException e) {
            logger.debug("Exception with creating PostService!", e);
            req.setAttribute("response", new JsonResponse(JsonError.Error.UNEXPECTED));
            dispatcher.forward(req, resp);
            return;
        }
        req.setAttribute("response", postService.getAll());
        dispatcher.forward(req, resp);
    }
}