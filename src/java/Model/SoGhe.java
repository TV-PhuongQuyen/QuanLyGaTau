/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author PC
 */
public class SoGhe {
    public int id_soghe;
    public int maTau;
    public int soGhe;
    public String HangGhe;
    public int GiaVe;
    public String TrangThai;
    public Tau tau;

    

    public SoGhe() {
    }

    public SoGhe(int id_soghe, int maTau, int soGhe, String HangGhe, int GiaVe, String TrangThai) {
        this.id_soghe = id_soghe;
        this.maTau = maTau;
        this.soGhe = soGhe;
        this.HangGhe = HangGhe;
        this.GiaVe = GiaVe;
        this.TrangThai = TrangThai;
    }

    public int getId_soghe() {
        return id_soghe;
    }

    public void setId_soghe(int id_soghe) {
        this.id_soghe = id_soghe;
    }

    public int getMaTau() {
        return maTau;
    }

    public void setMaTau(int maTau) {
        this.maTau = maTau;
    }


    public int getSoGhe() {
        return soGhe;
    }

    public void setSoGhe(int soGhe) {
        this.soGhe = soGhe;
    }

    public String getHangGhe() {
        return HangGhe;
    }

    public void setHangGhe(String HangGhe) {
        this.HangGhe = HangGhe;
    }

    public int getGiaVe() {
        return GiaVe;
    }

    public void setGiaVe(int GiaVe) {
        this.GiaVe = GiaVe;
    }

    public String getTrangThai() {
        return TrangThai;
    }

    public void setTrangThai(String TrangThai) {
        this.TrangThai = TrangThai;
    }

    public Tau getTau() {
        return tau;
    }

    public void setTau(Tau tau) {
        this.tau = tau;
    }
    
}
