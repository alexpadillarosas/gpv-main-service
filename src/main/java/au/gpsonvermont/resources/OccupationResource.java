package au.gpsonvermont.resources;

import au.gpsonvermont.app.occupation.OccupationEntity;
import au.gpsonvermont.app.occupation.OccupationService;
import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.util.List;

@Path("/occupation")
public class OccupationResource {

    @Inject
    OccupationService occupationService;

    @GET
    @Path("/all")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getOccupations() {
        Response response = null;
        List<OccupationEntity> occupations = occupationService.getOccupations();

        if(occupations.isEmpty()) {
            response = Response.status(Response.Status.NOT_FOUND).build();
        }else{
            response = Response.status(Response.Status.OK).entity(occupations).build();
        }

        return response;
    }
}
