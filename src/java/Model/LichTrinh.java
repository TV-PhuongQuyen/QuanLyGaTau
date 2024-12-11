/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
import Model.Tau;
        
/**
 *
 * @author PC
 */
public class LichTrinh {
    public int id_lich_trinh;
    public int id_tau;
    public String ga_kh;
    public String ga_den;
    public String time_kh;
    public String time_den;
    public String ngay_kh;
    public String ngay_den;
    public String TrangThai;
    public  Tau tau;

    public Tau getTau() {
        return tau;
    }

    public void setTau(Tau tau) {
        this.tau = tau;
    }
    
    
   

    public LichTrinh(int id_lich_trinh, int id_tau, String ga_kh, String ga_den, String time_kh, String time_den, String ngay_kh, String ngay_den, String TrangThai) {
        this.id_lich_trinh = id_lich_trinh;
        this.id_tau = id_tau;
        this.ga_kh = ga_kh;
        this.ga_den = ga_den;
        this.time_kh = time_kh;
        this.time_den = time_den;
        this.ngay_kh = ngay_kh;
        this.ngay_den = ngay_den;
        this.TrangThai = TrangThai;
    }


  

    public LichTrinh() {
    }

    public int getId_lich_trinh() {
        return id_lich_trinh;
    }

    public void setId_lich_trinh(int id_lich_trinh) {
        this.id_lich_trinh = id_lich_trinh;
    }

    public int getId_tau() {
        return id_tau;
    }

    public void setId_tau(int id_tau) {
        this.id_tau = id_tau;
    }



    public String getGa_kh() {
        return ga_kh;
    }

    public void setGa_kh(String ga_kh) {
        this.ga_kh = ga_kh;
    }

    public String getGa_den() {
        return ga_den;
    }

    public void setGa_den(String ga_den) {
        this.ga_den = ga_den;
    }

    public String getTime_kh() {
        return time_kh;
    }

    public void setTime_kh(String time_kh) {
        this.time_kh = time_kh;
    }

    public String getTime_den() {
        return time_den;
    }

    public void setTime_den(String time_den) {
        this.time_den = time_den;
    }

    public String getNgay_kh() {
        return ngay_kh;
    }

    public void setNgay_kh(String ngay_kh) {
        this.ngay_kh = ngay_kh;
    }

    public String getNgay_den() {
        return ngay_den;
    }

    public void setNgay_den(String ngay_den) {
        this.ngay_den = ngay_den;
    }

    public String getTrangThai() {
        return TrangThai;
    }

    public void setTrangThai(String TrangThai) {
        this.TrangThai = TrangThai;
    }

}
