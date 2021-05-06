package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="CTHoaDon")
public class CTHoaDon {
	@Override
	public String toString() {
		return "CTHoaDon [maCTHoaDon=" + maCTHoaDon + ", soLuong=" + soLuong + ", hoaDon=" + hoaDon + ", hangHoa="
				+ hangHoa + "]";
	}

	@Id @GeneratedValue
	private int maCTHoaDon;
	private int soLuong;
	
	@ManyToOne
	@JoinColumn(name="maHoaDon")
	private HoaDon hoaDon;
	
	@ManyToOne
	@JoinColumn(name="maHangHoa")
	private HangHoa hangHoa;
	
	public void setMaCTHoaDon(int maCTHoaDon) {
		this.maCTHoaDon = maCTHoaDon;
	}

	public HoaDon getHoaDon() {
		return hoaDon;
	}

	public void setHoaDon(HoaDon hoaDon) {
		this.hoaDon = hoaDon;
	}

	public int getMaCTHoaDon() {
		return maCTHoaDon;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public HangHoa getHangHoa() {
		return hangHoa;
	}

	public void setHangHoa(HangHoa hangHoa) {
		this.hangHoa = hangHoa;
	}

}
