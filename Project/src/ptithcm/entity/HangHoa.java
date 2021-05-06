package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="HangHoa")
public class HangHoa {
	@Id
	private String maHangHoa;
	private String tenHangHoa;
	private int donGia;
	private String anh;
	private int giamGia;
	private Boolean tinhTrang;
	
	@ManyToOne
	@JoinColumn(name="maLoai")
	private TheLoai theLoai;
	
	@OneToMany(mappedBy = "hangHoa",fetch = FetchType.EAGER)
	private Collection<CTHoaDon> dsCTHoaDon;
	
	public int getPhanTram() {
		int n = 0;
		if(giamGia != 0) {
			n = (giamGia * 100)/donGia ;
		}				
		return n;
	}
	
	public TheLoai getTheLoai() {
		return theLoai;
	}
	public void setTheLoai(TheLoai theLoai) {
		this.theLoai = theLoai;
	}
	public Boolean getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(Boolean tinhTrang) {
		this.tinhTrang = tinhTrang;
	}
	public String getMaHangHoa() {
		return maHangHoa;
	}
	public void setMaHangHoa(String maHangHoa) {
		this.maHangHoa = maHangHoa;
	}
	public String getTenHangHoa() {
		return tenHangHoa;
	}
	public void setTenHangHoa(String tenHangHoa) {
		this.tenHangHoa = tenHangHoa;
	}
	public int getDonGia() {
		return donGia;
	}
	public void setDonGia(int donGia) {
		this.donGia = donGia;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public int getGiamGia() {
		return giamGia;
	}
	public void setGiamGia(int giamGia) {
		this.giamGia = giamGia;
	}
}
