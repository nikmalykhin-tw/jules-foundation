package jules.foundation.controller

import io.micronaut.http.MediaType
import io.micronaut.http.annotation.Controller
import io.micronaut.http.annotation.Get
import io.micronaut.http.annotation.Produces

@Controller("/")
class HelloController {

    companion object {
        private const val HELLO_WORLD = "Hello, World!"
    }

    @Get @Produces(MediaType.TEXT_PLAIN) fun index(): String = HELLO_WORLD
}
