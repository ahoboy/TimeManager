package com.kotei.HouseRent.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="owner")
public class OwnerEntity {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)//主键生成策略
	@Column(name="Oid")//数据库字段名
	private Integer oid;
	
	@Column(name="Oname")
	private String oname;
	
	@Column(name="Password")
	private String password;
	
	@Column(name="Telephone")
	private String telephone;
	
	@Column(name="Osex")
	private String osex;

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getOsex() {
		return osex;
	}

	public void setOsex(String osex) {
		this.osex = osex;
	}
}
