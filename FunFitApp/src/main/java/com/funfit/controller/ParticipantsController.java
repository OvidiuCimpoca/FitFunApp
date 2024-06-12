package com.funfit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.funfit.bean.Batch;
import com.funfit.bean.Participants;
import com.funfit.service.BatchService;
import com.funfit.service.ParticipantsService;

@WebServlet("/ParticipantsController")
public class ParticipantsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    ParticipantsService ps = new ParticipantsService();
	BatchService bs = new BatchService();
    
    public ParticipantsController() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	PrintWriter pw = response.getWriter();
		HttpSession hs = request.getSession();
		List<Participants> listOfParticipants = ps.viewAllParticipants();
		List<Batch> listOfBatch = bs.viewAllBatch();
		hs.setAttribute("participants", listOfParticipants);
		hs.setAttribute("batches", listOfBatch);
		response.sendRedirect("viewParticipants.jsp");
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		String fname = request.getParameter("fname");
		int age  = Integer.parseInt(request.getParameter("age"));
		String phonenumber = request.getParameter("phonenumber");
		int bid = Integer.parseInt(request.getParameter("bid"));
		RequestDispatcher rd = request.getRequestDispatcher("addParticipants.jsp");
		Participants pp = new Participants();
		pp.setFname(fname);
		pp.setAge(age);
		pp.setPhonenumber(phonenumber);
		pp.setBid(bid);
		
		String result = ps.addParticipants(pp);
		pw.print(result);
		rd.include(request, response);
	}
    
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		JSONObject body = new JSONObject(request.getReader().readLine().toString());
		
		int pid = Integer.parseInt(body.get("pid").toString());
		String fname = body.get("fname").toString();
		int age = Integer.parseInt(body.get("age").toString());
		String phonenumber = body.getString("phonenumber".toString());
		int bid = Integer.parseInt(body.getString("bid").toString());
		RequestDispatcher rd = request.getRequestDispatcher("editParticipants.jsp");
		Participants pp = new Participants();
		pp.setPid(pid);
		pp.setFname(fname);
		pp.setAge(age);
		pp.setPhonenumber(phonenumber);
		pp.setBid(bid);
		String result = ps.updateParticipants(pp);
		pw.println(result);
		rd.include(request, response);
	
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		JSONObject body = new JSONObject(request.getReader().readLine().toString());
		
		int pid = Integer.parseInt(body.get("pid").toString());
		request.getRequestDispatcher("viewParticipants.jsp");
		Participants pp = new Participants();
		pp.setPid(pid);
		String result = ps.deleteParticipants(pp);
		pw.println(result);
	}
}