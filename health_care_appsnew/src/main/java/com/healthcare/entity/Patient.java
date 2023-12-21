package com.healthcare.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity

public class Patient {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    private String phone;
    private int age;
    private String gender;
    private String diagnosis;
    private String remarks;
	public Patient() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Patient(int id, String name, String email, String phone, int age, String diagnosis, String remark, String gender, String remarks) {
	    super();
	    this.id = (int) id;
	    this.name = name;
	    this.phone = phone;
	    this.age = age;
	    this.gender = gender;
	    this.diagnosis = diagnosis;
	    this.remarks = remarks;
	}	public Long getId() {
		return (long) id;
	}
	public void setId(int id) {
		this.id =  id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDiagnosis() {
		return diagnosis;
	}
	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	@Override
	public String toString() {
		return "Patient [id=" + id + ", name=" + name + ", phone=" + phone + ", age=" + age + ", gender=" + gender
				+ ", diagnosis=" + diagnosis + ", remarks=" + remarks + "]";
	}
    
    
}
