package au.gpsonvermont.app.occupation;

import io.quarkus.hibernate.orm.panache.PanacheRepository;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class OccupationRepository implements PanacheRepository<OccupationEntity> {
}
