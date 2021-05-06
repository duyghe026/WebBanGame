package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Users")
public class User {
	@Id
	private String iDUser;
	private String password;
	private String userName;
	private Boolean type;
	private String email;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@OneToMany(mappedBy = "user",fetch = FetchType.EAGER)
	private Collection<HoaDon> dsHoaDon;
	
	public Collection<HoaDon> getDsHoaDon() {
		return dsHoaDon;
	}
	public void setDsHoaDon(Collection<HoaDon> dsHoaDon) {
		this.dsHoaDon = dsHoaDon;
	}
	public String getiDUser() {
		return iDUser;
	}
	public void setiDUser(String iDUser) {
		this.iDUser = iDUser;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Boolean getType() {
		return type;
	}
	public void setType(Boolean type) {
		this.type = type;
	}
	
}
