package com.healthcare.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.healthcare.entity.Patient;
import com.healthcare.resource.SessionFactoryResource;

public class PatientDao {

    public void addPatient(Patient patient) {
        SessionFactory sf = SessionFactoryResource.getSessionFactory();
        Session session = sf.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.save(patient);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public List<Patient> getAllPatients() {
        SessionFactory sf = SessionFactoryResource.getSessionFactory();
        Session session = sf.openSession();
        try {
            Query<Patient> query = session.createQuery("FROM Patient", Patient.class);
            return query.list();
        } finally {
            session.close();
        }
    }

    public Patient getPatientById(int id) {
        SessionFactory sf = SessionFactoryResource.getSessionFactory();
        Session session = sf.openSession();
        try {
            return session.get(Patient.class, id);
        } finally {
            session.close();
        }
    }
    
    public List<Patient> listAllPatientsDetails() {
        SessionFactory sf = SessionFactoryResource.getSessionFactory();
        Session session = sf.openSession();
        try {
            Query<Patient> query = session.createQuery("FROM Patient", Patient.class);
            return query.list();
        } finally {
            session.close();
        }
    }

    // Search patients by name or diagnosis
    public List<Patient> searchPatientsByNameOrDiagnosis(String keyword) {
        SessionFactory sf = SessionFactoryResource.getSessionFactory();
        Session session = sf.openSession();
        try {
            Query<Patient> query = session.createQuery(
                    "FROM Patient WHERE name LIKE :keyword OR diagnosis LIKE :keyword",
                    Patient.class
            );
            query.setParameter("keyword", "%" + keyword + "%");
            return query.list();
        } finally {
            session.close();
        }
    }

    public void updatePatientDetails(Patient updatedPatient) {
        SessionFactory sf = SessionFactoryResource.getSessionFactory();
        Session session = sf.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            // Retrieve the existing patient from the database
            Patient existingPatient = session.get(Patient.class, updatedPatient.getId());
            if (existingPatient != null) {
                // Update the existing patient with new details
                existingPatient.setName(updatedPatient.getName());
                existingPatient.setPhone(updatedPatient.getPhone());
                existingPatient.setAge(updatedPatient.getAge());
                existingPatient.setGender(updatedPatient.getGender());
                existingPatient.setDiagnosis(updatedPatient.getDiagnosis());
                existingPatient.setRemarks(updatedPatient.getRemarks());

                // Save the updated patient
                session.update(existingPatient);
                tx.commit();
            } else {
                // Handle the case where the patient with the given ID is not found
                // You can throw an exception or log an error message
            }
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public List<Patient> searchPatients(String keyword) {
        SessionFactory sf = SessionFactoryResource.getSessionFactory();
        Session session = sf.openSession();
        try {
            Query<Patient> query = session.createQuery(
                    "FROM Patient WHERE name LIKE :keyword OR diagnosis LIKE :keyword",
                    Patient.class
            );
            query.setParameter("keyword", "%" + keyword + "%");
            return query.list();
        } finally {
            session.close();
        }
    }
}
