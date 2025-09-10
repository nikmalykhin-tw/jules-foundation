package jules.foundation

import io.micronaut.runtime.Micronaut.run
import io.swagger.v3.oas.annotations.*
import io.swagger.v3.oas.annotations.info.*

@OpenAPIDefinition(
    info = Info(
            title = "jules-foundation",
            version = "0.0"
    )
)
object Api {
}
fun main(args: Array<String>) {
	run(*args)
}
