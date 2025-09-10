package jules.foundation

import io.micronaut.runtime.Micronaut.run

@Suppress("SpreadOperator")
fun main(args: Array<String>) {
    run(*args) // Spread operator is idiomatic for Micronaut entrypoints
}
