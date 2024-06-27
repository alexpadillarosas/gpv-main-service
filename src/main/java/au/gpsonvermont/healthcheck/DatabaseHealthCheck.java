package au.gpsonvermont.healthcheck;

import jakarta.inject.Inject;
import org.eclipse.microprofile.health.HealthCheck;
import org.eclipse.microprofile.health.HealthCheckResponse;
import org.eclipse.microprofile.health.HealthCheckResponseBuilder;

//@Readiness
//@ApplicationScoped
public class DatabaseHealthCheck implements HealthCheck {

    @Inject
    DBHealthCheckService dbHealthCheckService;

    private boolean healthy = false;

    @Override
    public HealthCheckResponse call() {

        HealthCheckResponseBuilder responseBuilder = HealthCheckResponse.named("Readiness Database Health Check");
        try {
            dbHealthCheckService.testDatabaseConnection();
            responseBuilder.up();
        } catch (IllegalStateException e) {
            responseBuilder.down();
        }
        return responseBuilder.build();
    }
}
