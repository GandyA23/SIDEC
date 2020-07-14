package mx.edu.utez.model.bean;

public class LoginBean {
    private String cct;
    private String password;

    public LoginBean(String cct, String password) {
        this.cct = cct;
        this.password = password;
    }

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
