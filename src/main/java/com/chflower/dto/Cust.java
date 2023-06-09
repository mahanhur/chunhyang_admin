package com.chflower.dto;

import lombok.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Cust {
    @NotEmpty(message = "ID는 필수항목 입니다.")
    @Size(min=4, max=10, message = "ID는 최소 4자리, 최대 10자리 입니다.")
    private String cust_id;
    @NotEmpty(message = "이름은 필수항목 입니다.")
    @Size(min=2, max=10, message = "이름은 최소 2자리, 최대 10자리 입니다.")
    private String cust_name;
    @NotEmpty(message = "PW는 필수항목 입니다.")
//    @Size(min=5, max=20, message = "PW는 최소 5자리, 최대 20자리 입니다.")
//    private String cust_pwd;

//    private String cust_id;
//    private String cust_name;
    private String cust_pwd;
    private String phone;
    private int age;
    private String email;
    private Date cust_rdate;
    private Date cust_del_date;

    public Cust(String cust_id, String cust_name, String cust_pwd, String phone, int age, String email, Date cust_rdate) {
        this.cust_id = cust_id;
        this.cust_name = cust_name;
        this.cust_pwd = cust_pwd;
        this.phone = phone;
        this.age = age;
        this.email = email;
        this.cust_rdate = cust_rdate;
    }

    public Cust(String cust_id, String cust_name, String cust_pwd, String phone, int age, String email) {
        this.cust_id = cust_id;
        this.cust_name = cust_name;
        this.cust_pwd = cust_pwd;
        this.phone = phone;
        this.age = age;
        this.email = email;
    }
}
