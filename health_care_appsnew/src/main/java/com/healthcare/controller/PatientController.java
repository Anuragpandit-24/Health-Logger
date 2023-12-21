package com.healthcare.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthcare.dao.PatientDao;
import com.healthcare.entity.Patient;

/**
 * Servlet implementation class PatientController
 */
@WebServlet("/PatientController")
public class PatientController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  
		 String action = request.getParameter("action");

		    if ("listPatient".equals(action)) {
		        listPatients(request, response);
		    } else if ("editPatient".equals(action)) {
		        // Handle editPatient action
		    }
		        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "addPatient":
                    addPatient(request, response);
                    break;
                case "updatePatient":
                    updatePatient(request, response);
                    break;
                case "searchPatients":
                    searchPatients(request, response);
                    break;
                // Add more cases for other patient-related actions
            }
        }

	}
	private void listPatients(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PatientDao patientDao = new PatientDao();
        List<Patient> patients = patientDao.getAllPatients();
        request.setAttribute("patients", patients);
        request.getRequestDispatcher("listPatients.jsp").forward(request, response);
    }

    private void addPatient(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve patient details from the form
    	String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String diagnosis = request.getParameter("diagnosis");
        String remarks = request.getParameter("remarks");

        // Create a new Patient object
        Patient patient = new Patient();
        patient.setName(name);
        patient.setPhone(phone);
        patient.setAge(age);
        patient.setGender(gender);
        patient.setDiagnosis(diagnosis);
        patient.setRemarks(remarks);

        // Add the patient to the database
        PatientDao patientDao = new PatientDao();
        patientDao.addPatient(patient);

        // Redirect to the listPatients page
        response.sendRedirect("PatientController?action=listPatients");
    }

    private void editPatient(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve patient ID from the request parameter
        int patientId = Integer.parseInt(request.getParameter("id"));

        // Retrieve the patient from the database using PatientDao
        PatientDao patientDao = new PatientDao();
        Patient patient = patientDao.getPatientById(patientId);

        // Set the patient as an attribute to be used in the JSP page
        request.setAttribute("patient", patient);

        // Forward to a JSP page with a form for editing the patient
        request.getRequestDispatcher("editPatient.jsp").forward(request, response);
    }

    private void updatePatient(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve and validate updated patient details from the form
        int patientId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String diagnosis = request.getParameter("diagnosis");
        String remarks = request.getParameter("remarks");

        // Retrieve the existing patient from the database
        PatientDao patientDao = new PatientDao();
        Patient patient = patientDao.getPatientById(patientId);

        // Update the patient details
        patient.setName(name);
        patient.setPhone(phone);
        patient.setAge(age);
        patient.setGender(gender);
        patient.setDiagnosis(diagnosis);
        patient.setRemarks(remarks);

        // Update the patient in the database
        patientDao.updatePatientDetails(patient);

        // Redirect to the listPatients page
        response.sendRedirect("PatientController?action=listPatients");
    }

    private void searchPatients(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve and validate search keyword from the form
        String keyword = request.getParameter("keyword");

        // Search for patients using PatientDao
        PatientDao patientDao = new PatientDao();
        List<Patient> searchResults = patientDao.searchPatients(keyword);

        // Set search results as an attribute to be used in the JSP page
        request.setAttribute("searchResults", searchResults);

        // Forward to a JSP page with the search results
        request.getRequestDispatcher("searchResults.jsp").forward(request, response);
    }

}
