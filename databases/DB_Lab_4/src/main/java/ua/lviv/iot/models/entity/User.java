package ua.lviv.iot.models.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Data
@Entity
@Table(name = "user")
public class User {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name")
    @NotNull
    private String name;

    @Column(name = "surname")
    @NotNull
    private String surname;

    @Column(name = "coach_id")
    private Integer coachId;

    @Override
    public String toString() {
        return String.format("id: %s, name: %s, surname: %s, coach_id: %s",id, name, surname, coachId);
    }
}
