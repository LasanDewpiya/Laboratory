package com;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Laboratory;

/**
 * Servlet implementation class LaboratoryAPI
 */
@WebServlet("/LaboratoryAPI")
public class LaboratoryAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	Laboratory LabObj = new Laboratory();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LaboratoryAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String output = LabObj.AddLabDetails(request.getParameter("Lab_type"), request.getParameter("Lab_date"),
				request.getParameter("Des"), request.getParameter("PatientId"), request.getParameter("HospitalId"));
		
		response.getWriter().write(output);

	}
	// Convert request parameters to a Map
	private static Map getParasMap(HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
			String queryString = scanner.hasNext() ? scanner.useDelimiter("\\A").next() : "";
			scanner.close();
			String[] params = queryString.split("&");
			for (String param : params) {

				String[] p = param.split("=");
				map.put(p[0], p[1]);
			}
		} catch (Exception e) {
		}
		return map;
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map paras = getParasMap(request);
		//System.out.println(paras);
				String output = LabObj.Updatelab(paras.get("hidDoctorIDSave").toString(), 
						paras.get("Lab_type").toString(),
						paras.get("Lab_date").toString(), 
						paras.get("Des").toString(), 
						paras.get("PatientId").toString(),
						paras.get("HospitalId").toString());

				response.getWriter().write(output);
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map paras = getParasMap(request);
		String output = LabObj.RemoveLab(paras.get("Lab_Id").toString());
		response.getWriter().write(output);
	}

}
