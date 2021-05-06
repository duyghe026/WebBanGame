package ptithcm.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="HoaDon")
public class HoaDon {
	@Id @GeneratedValue
	private int maHoaDon;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date ngayBan;
	private Boolean tinhTrang;
	
	@ManyToOne
	@JoinColumn(name="iDUser")
	private User user;
	
	@OneToMany(mappedBy = "hoaDon",fetch = FetchType.EAGER)
	private Collection<CTHoaDon> dsCTHoaDon;
	
	public long getTongTien() {
		long tong = 0;
		for (CTHoaDon u : dsCTHoaDon) {
			long gia = u.getHangHoa().getDonGia() - u.getHangHoa().getGiamGia();
			tong += (long)(gia * u.getSoLuong());
		}
		return tong;	
	}
	
	
	public int getMaHoaDon() {
		return maHoaDon;
	}

	public Collection<CTHoaDon> getDsCTHoaDon() {
		return dsCTHoaDon;
	}


	public void setDsCTHoaDon(Collection<CTHoaDon> dsCTHoaDon) {
		this.dsCTHoaDon = dsCTHoaDon;
	}


	public void setMaHoaDon(int maHoaDon) {
		this.maHoaDon = maHoaDon;
	}

	public Date getNgayBan() {
		return ngayBan;
	}

	public void setNgayBan(Date ngayBan) {
		this.ngayBan = ngayBan;
	}

	public Boolean getTinhTrang() {
		return tinhTrang;
	}

	public void setTinhTrang(Boolean tinhTrang) {
		this.tinhTrang = tinhTrang;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "HoaDon [maHoaDon=" + maHoaDon + ", ngayBan=" + ngayBan + ", tinhTrang=" + tinhTrang + ", user=" + user
				+ ", dsCTHoaDon=" + dsCTHoaDon + "]";
	}
	
	
}
