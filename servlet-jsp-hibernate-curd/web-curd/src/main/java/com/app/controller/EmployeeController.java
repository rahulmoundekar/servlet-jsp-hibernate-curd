package com.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.entity.Employee;
import com.app.service.EmployeeService;
import com.app.service.impl.EmployeeServiceImpl;

@WebServlet("/register")
public class EmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private EmployeeService employeeService = null;

	public EmployeeController() {
		employeeService = new EmployeeServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Employee> list = employeeService.findAll();
		request.setAttribute("employees", list);
		request.getRequestDispatcher("dashboard.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Employee employee = new Employee();
		String sid = request.getParameter("id");
		if (sid != null && sid != "") {
			employee.setId(Integer.parseInt(sid));
		}
		employee.setName(request.getParameter("name"));
		employee.setMobile(request.getParameter("mobile"));
		employee.setSalary(Double.parseDouble(request.getParameter("salary")));
		Boolean flag = employeeService.saveEmployee(employee);
		if (flag) {
			request.setAttribute("success", "employee saved Successfully");
		} else {
			request.setAttribute("error", "employee saved Successfully");
		}
		request.getRequestDispatcher("dashboard.jsp").forward(request, response);
	}

}
