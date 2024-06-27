package au.gpsonvermont;

import io.quarkus.test.junit.QuarkusTest;
import io.restassured.http.ContentType;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;

@QuarkusTest
public class OccupationResourceTest {

    @Test
    void testGetOccupations(){
        given().contentType(ContentType.JSON)
        .when().get("/occupation/all")
                .then()
                .statusCode(200);

    }
}
