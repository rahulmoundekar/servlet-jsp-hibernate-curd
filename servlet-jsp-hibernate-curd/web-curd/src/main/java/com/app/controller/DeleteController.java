package com.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.service.EmployeeService;
import com.app.service.impl.EmployeeServiceImpl;

@WebServlet("/delete")
public class DeleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer id = Integer.parseInt(req.getParameter("id"));
		EmployeeService employeeService = new EmployeeServiceImpl();
		Boolean flag = employeeService.deleteEmployee(id);
		if (flag) {
			req.setAttribute("employees", employeeService.findAll());
			req.setAttribute("success", "Employee deleted with id :" + id);
		} else
			req.setAttribute("error", "employee does not deleted with id : " + id + ", Please try again!");

		req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
	}

}
