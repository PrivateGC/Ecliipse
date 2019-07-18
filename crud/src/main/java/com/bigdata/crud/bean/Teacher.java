package com.bigdata.crud.bean;

public class Teacher {
    private Integer tid;

    private String tname;

    private String sex;

    private String majo;

    private String professional;

    private String education;

    private String phone;

    private String idcard;

    private String address;

    private String mailbox;

    private Integer departmentalid;

    private Departmental dept;
    
    
    
    public Departmental getDept() {
		return dept;
	}

	public void setDept(Departmental dept) {
		this.dept = dept;
	}

	public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname == null ? null : tname.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getMajo() {
        return majo;
    }

    public void setMajo(String majo) {
        this.majo = majo == null ? null : majo.trim();
    }

    public String getProfessional() {
        return professional;
    }

    public void setProfessional(String professional) {
        this.professional = professional == null ? null : professional.trim();
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education == null ? null : education.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getMailbox() {
        return mailbox;
    }

    public void setMailbox(String mailbox) {
        this.mailbox = mailbox == null ? null : mailbox.trim();
    }

    public Integer getDepartmentalid() {
        return departmentalid;
    }

    public void setDepartmentalid(Integer departmentalid) {
        this.departmentalid = departmentalid;
    }
}