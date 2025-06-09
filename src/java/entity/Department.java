/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import org.hibernate.*;
import jakarta.persistence.*;

/**
 *
 * @author vinhnnpc
 */
@Entity
@Table(name = "Department")
public class Department {

    public Department() {
    }

    public Department(String id, String name) {
        this.id = id;
        this.name = name;
    }
    
    private String id;
    private String name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
