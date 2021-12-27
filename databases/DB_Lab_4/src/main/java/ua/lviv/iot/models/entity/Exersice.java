package ua.lviv.iot.models.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Data
@Entity
@Table(name = "exersices")
public class Exersice {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name")
    @NotNull
    private String name;

    @Column(name = "targeted_bodypart")
    @NotNull
    private String targeted_bodypart;

    @Override
    public String toString() {
        return String.format("id: %s, name: %s, targeted_bodypart: %s", id, name, targeted_bodypart);
    }
}
