/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
import Model.LichTrinh;
/**
 *
 * @author PC
 */
public class KhachHang {
    public int id_kh;
    public String name;
    public String gioi_tinh;
    public String email;
    public String cccd;
    public String number;
    public String id_soghe;
    public String id_lich_trinh;
    public String ngay_dk;
    public String TrangThai;
    public LichTrinh lichtrinh;
    public SoGhe soghe;
    public int tongSoCho;

    public int getTongSoCho() {
        return tongSoCho;
    }

    public void setTongSoCho(int tongSoCho) {
        this.tongSoCho = tongSoCho;
    }

    public KhachHang(int id_kh, String name, String gioi_tinh, String email, String cccd, String number, String id_soghe, String id_lich_trinh, String ngay_dk, String TrangThai) {
        this.id_kh = id_kh;
        this.name = name;
        this.gioi_tinh = gioi_tinh;
        this.email = email;
        this.cccd = cccd;
        this.number = number;
        this.id_soghe = id_soghe;
        this.id_lich_trinh = id_lich_trinh;
        this.ngay_dk = ngay_dk;
        this.TrangThai = TrangThai;
    }

   
    

    public KhachHang() {
    }
    public LichTrinh getLichtrinh() {
        return lichtrinh;
    }

    public void setLichtrinh(LichTrinh lichtrinh) {
        this.lichtrinh = lichtrinh;
    }

    public SoGhe getSoghe() {
        return soghe;
    }

    public void setSoghe(SoGhe soghe) {
        this.soghe = soghe;
    }

    public int getId_kh() {
        return id_kh;
    }

    public void setId_kh(int id_kh) {
        this.id_kh = id_kh;
    }

 

    public String getName() {
        return name;
    }

    public String getId_soghe() {
        return id_soghe;
    }

    public void setId_soghe(String id_soghe) {
        this.id_soghe = id_soghe;
    }

    public String getId_lich_trinh() {
        return id_lich_trinh;
    }

    public void setId_lich_trinh(String id_lich_trinh) {
        this.id_lich_trinh = id_lich_trinh;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGioi_tinh() {
        return gioi_tinh;
    }

    public void setGioi_tinh(String gioi_tinh) {
        this.gioi_tinh = gioi_tinh;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCccd() {
        return cccd;
    }

    public void setCccd(String cccd) {
        this.cccd = cccd;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }




    public String getNgay_dk() {
        return ngay_dk;
    }

    public void setNgay_dk(String ngay_dk) {
        this.ngay_dk = ngay_dk;
    }

    public String getTrangThai() {
        return TrangThai;
    }

    public void setTrangThai(String TrangThai) {
        this.TrangThai = TrangThai;
    }

  
    
}
