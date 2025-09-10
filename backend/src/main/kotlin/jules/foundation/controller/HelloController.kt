package jules.foundation.controller

import io.micronaut.http.MediaType
import io.micronaut.http.annotation.Controller
import io.micronaut.http.annotation.Get
import io.micronaut.http.annotation.Produces

@Controller("/")
class HelloController {

    @Get
    @Produces(MediaType.TEXT_PLAIN)
    fun index(): String {
        return "Hello, World!"
    }
}
