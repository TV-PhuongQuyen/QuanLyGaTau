/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author PC
 */
public class Tau {
    public int id_tau;
    public String ten_tau;
    public String so_hieu_tau;
    public String TrangThai;


    public Tau(int id_tau, String ten_tau, String so_hieu_tau, String TrangThai) {
        this.id_tau = id_tau;
        this.ten_tau = ten_tau;
        this.so_hieu_tau = so_hieu_tau;
        this.TrangThai = TrangThai;
    }

    public Tau() {
    }

    public int getId_tau() {
        return id_tau;
    }

    public void setId_tau(int id_tau) {
        this.id_tau = id_tau;
    }

 

    public String getTen_tau() {
        return ten_tau;
    }

    public void setTen_tau(String ten_tau) {
        this.ten_tau = ten_tau;
    }

    public String getSo_hieu_tau() {
        return so_hieu_tau;
    }

    public void setSo_hieu_tau(String so_hieu_tau) {
        this.so_hieu_tau = so_hieu_tau;
    }

    public String getTrangThai() {
        return TrangThai;
    }

    public void setTrangThai(String TrangThai) {
        this.TrangThai = TrangThai;
    }
    
    
}
