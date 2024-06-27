package au.gpsonvermont.healthcheck;


import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import java.util.List;


@ApplicationScoped
public class DBHealthCheckService {

    @Inject
    EntityManager em;


    public void testDatabaseConnection() throws IllegalStateException{
        List resultList = em.createNativeQuery("SELECT 1").getResultList();
        if(resultList.isEmpty()){
            throw new IllegalStateException("Database is not responding");
        }
    }
}
