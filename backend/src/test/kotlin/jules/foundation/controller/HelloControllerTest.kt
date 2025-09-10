package jules.foundation.controller

import io.micronaut.http.client.HttpClient
import io.micronaut.http.client.annotation.Client
import io.micronaut.test.extensions.kotest5.annotation.MicronautTest
import io.kotest.core.spec.style.StringSpec
import io.kotest.matchers.shouldBe
import jakarta.inject.Inject

@MicronautTest
class HelloControllerTest : StringSpec() {

    @Inject
    @field:Client("/")
    lateinit var client: HttpClient

    init {
        "test hello world response" {
            val response = client.toBlocking().retrieve("/")
            response shouldBe "Hello, World!"
        }
    }
}
