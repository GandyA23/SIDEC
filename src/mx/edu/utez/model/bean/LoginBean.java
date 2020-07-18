package mx.edu.utez.model.bean;

public class LoginBean {
    private String cct;
    private String password;
    private String rol = null;

    public LoginBean(String cct, String password) {
        this.cct = cct;
        this.password = password;
    }

    public String getRol() { return rol; }

    public void setRol(String rol) { this.rol = rol; }

    public String getCct() {
        return cct;
    }

    public void setCct(String cct) {
        this.cct = cct;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
