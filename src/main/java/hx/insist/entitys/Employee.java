package hx.insist.entitys;

import lombok.Data;

@Data
public class Employee {
    private Integer id;
    private String lastName;
    private String email;
    private Integer gender; //1男， 0女
    private Department department;

    public Employee() {

    }
    public Employee(Integer id, String lastName, String email, Integer gender, Department department) {
        this.id = id;
        this.lastName = lastName;
        this.email = email;
        this.gender = gender;
        this.department = department;
    }

}