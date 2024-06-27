package au.gpsonvermont.app.occupation;

import jakarta.persistence.*;


@Entity
@Table(name = "OCCUPATION")
public class OccupationEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "occupation_generator")
    @SequenceGenerator(name = "occupation_generator", sequenceName = "OCCUPATION_ID_SEQ")
    @Column(name = "ID")
    public Long id;

    @Column(name = "NAME")
    public String name;

    @Column(name = "ABBREVIATION")
    public String abbreviation;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAbbreviation() {
        return abbreviation;
    }

    public void setAbbreviation(String abbreviation) {
        this.abbreviation = abbreviation;
    }

    @Override
    public String toString() {
        return "OccupationEntity{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", abbreviation='" + abbreviation + '\'' +
                '}';
    }
}
