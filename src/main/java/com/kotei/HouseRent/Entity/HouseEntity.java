package com.kotei.HouseRent.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="house")
public class HouseEntity {
	  
		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)//主键生成策略
		@Column(name="Hid")//数据库字段名
	  	private Integer hid;
	  
		
		public Integer getHid() {
			return hid;
		}

		public void setHid(Integer hid) {
			this.hid = hid;
		}

		public String getHname() {
			return hname;
		}

		public void setHname(String hname) {
			this.hname = hname;
		}

		public String getHprice() {
			return hprice;
		}

		public void setHprice(String hprice) {
			this.hprice = hprice;
		}

		public String getHaddress() {
			return haddress;
		}

		public void setHaddress(String haddress) {
			this.haddress = haddress;
		}

		public String getHsize() {
			return hsize;
		}

		public void setHsize(String hsize) {
			this.hsize = hsize;
		}

		public Integer getHflag() {
			return hflag;
		}

		public void setHflag(Integer hflag) {
			this.hflag = hflag;
		}

		public String getHdesc() {
			return hdesc;
		}

		public void setHdesc(String hdesc) {
			this.hdesc = hdesc;
		}

		public Integer getUid() {
			return uid;
		}

		public void setUid(Integer uid) {
			this.uid = uid;
		}

		@Column(name="Hname")
		private String hname;
	  
		//  价格
		@Column(name="Hprice")
		private String hprice;
	  
		// 地址
		@Column(name="Haddress")
		private String haddress;
	  
		// 户型
		@Column(name="Hsize")
		private String hsize;
	  
		// 标识
		@Column(name="Hflag")
		private Integer hflag;
	  
		// 描述信息
		@Column(name="Hdesc")
		private String hdesc;
	  
		// 用户ID
		@Column(name="Uid")
		private Integer uid;
}
