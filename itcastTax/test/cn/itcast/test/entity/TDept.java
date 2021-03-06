package cn.itcast.test.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * TDept entity. @author MyEclipse Persistence Tools
 */

public class TDept implements java.io.Serializable {

	// Fields

	private String deptId;
	private TOrg TOrg;
	private String name;
	private Set TEmps = new HashSet(0);

	// Constructors

	/** default constructor */
	public TDept() {
	}

	/** minimal constructor */
	public TDept(TOrg TOrg) {
		this.TOrg = TOrg;
	}

	/** full constructor */
	public TDept(TOrg TOrg, String name, Set TEmps) {
		this.TOrg = TOrg;
		this.name = name;
		this.TEmps = TEmps;
	}

	// Property accessors

	public String getDeptId() {
		return this.deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public TOrg getTOrg() {
		return this.TOrg;
	}

	public void setTOrg(TOrg TOrg) {
		this.TOrg = TOrg;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set getTEmps() {
		return this.TEmps;
	}

	public void setTEmps(Set TEmps) {
		this.TEmps = TEmps;
	}

}