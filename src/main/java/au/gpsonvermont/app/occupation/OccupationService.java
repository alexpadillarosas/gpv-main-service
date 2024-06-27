package au.gpsonvermont.app.occupation;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

import java.util.List;

@ApplicationScoped
public class OccupationService {

    @Inject
    OccupationRepository occupationRepository;

    public List<OccupationEntity> getOccupations() {
        return occupationRepository.listAll();
    }
}
