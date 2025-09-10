# **Clean Code Guidelines for Jules**

## **1\. Core Philosophy: The Boy Scout Rule**

The fundamental principle for this codebase is **"The Boy Scout Rule": Leave the code cleaner than you found it.**

Every change, no matter how small, must contribute to improving the overall quality of the codebase. The only way to maintain velocity and meet deadlines is to keep the code as clean as possible at all times. Writing messy code to "go fast" is a fallacy that will not be accepted.

## **2\. Naming Conventions**

Names are the foundation of readable code. They must be explicit, unambiguous, and intention-revealing.

* **Intention-Revealing Names:** A name must clearly answer: why it exists, what it does, and how it is used. A name should be so clear that it requires no comment to explain its purpose.  
* **Make Meaningful Distinctions:** If two things are different, their names must reflect that. Avoid non-informative names like a1, a2 or noise words like Data, Info, Manager.  
* **Use Pronounceable and Searchable Names:** Names must be easy to discuss. A name's length should correspond to its scope; single-letter variables are only acceptable for very short loops.  
* **Class Names:** Must be nouns or noun phrases (e.g., Customer, AddressParser).  
* **Method/Function Names:** Must be verbs or verb phrases (e.g., postPayment, deletePage). Use standard prefixes like get, set, and is for accessors, mutators, and predicates.  
* **Consistency:** Use one word per abstract concept. Do not use fetch, retrieve, and get for the same type of operation across different classes.  
* **Avoid Encodings:** Do not use type encodings (e.g., Hungarian Notation like phoneString) or member prefixes (e.g., m\_description).

## **3\. Function Design**

Functions are the primary organizational unit of the code.

* **Rule 1: Small.** Functions must be small.  
* **Rule 2: Even Smaller.** Ideally, a function should be 2-4 lines long and rarely exceed 20 lines. Blocks within if, else, while statements should be a single line, which is typically a call to another function. Indentation should not exceed two levels.  
* **Do One Thing:** A function must do one thing, do it well, and do it only. All steps within a function must be at the same level of abstraction.  
* **Argument Limits:**  
  * The ideal number of arguments is zero.  
  * One or two arguments are acceptable.  
  * Three arguments should be avoided.  
  * **Never use flag arguments (booleans).** Create two separate functions instead.  
* **No Side Effects:** A function must not have hidden effects. It should not make unexpected changes to class variables, input parameters, or global state.  
* **Command Query Separation:** A function should either **do** something (command) or **answer** something (query), but not both.

## **4\. Comments and Documentation**

Comments are not a substitute for clean, expressive code. The code itself is the ultimate source of truth.

* **Primary Rule:** Don't comment bad code—rewrite it.  
* **Acceptable Comments:**  
  * **Legal Comments:** Copyright and authorship statements.  
  * **Explanation of Intent:** Why a specific, non-obvious design decision was made.  
  * **Warning of Consequences:** To warn other developers about critical side effects.  
  * **TODO Comments:** As temporary notes for work that needs to be done. These must be reviewed and removed regularly.  
* **Unacceptable Comments:**  
  * **Commented-Out Code:** This is forbidden. Delete the code; source control will remember it.  
  * **Redundant Comments:** Do not state what the code already clearly says.  
  * **Noise Comments:** Journal logs, attributions, or comments on closing braces.

## **5\. Formatting and Structure**

Code formatting is a critical aspect of communication and must be consistent across the entire project.

* **Vertical Formatting (The Newspaper Metaphor):** A source file should read like a newspaper. High-level concepts and public interfaces at the top, with details increasing as you scroll down.  
* **Vertical Density:** Use blank lines to separate distinct concepts. Keep closely related lines of code grouped together.  
* **Variable Declarations:** Declare variables as close to their usage as possible.  
* **Dependent Functions:** The calling function should be placed above the function it calls to create a natural top-down flow.  
* **Horizontal Formatting:** Lines should be kept short (ideally under 120 characters). Use horizontal whitespace to associate related items and disassociate unrelated ones.

## **6\. Class and System Design**

* **Single Responsibility Principle (SRP):** A class must have only one reason to change. Classes are measured by responsibilities, not lines.  
* **High Cohesion:** A class is cohesive if its instance variables are used by many of its methods. If a class loses cohesion, it should be split.  
* **Dependency Inversion Principle (DIP):** Depend on abstractions (interfaces), not on concrete implementations.  
* **Separate Construction from Use:** The logic for building/wiring objects should be separate from the application's runtime logic. Use factories or Dependency Injection.  
* **Objects vs. Data Structures:** Use Objects to hide data and expose behavior. Use Data Structures to expose data and have no significant behavior. Avoid hybrids.

## **7\. Error Handling**

Error handling is a primary concern but must not obscure the main logic.

* **Use Exceptions Instead of Return Codes:** This separates the primary logic from error-handling logic, making both cleaner.  
* **Provide Context with Exceptions:** Every exception must include an informative error message that explains the operation that failed.  
* **Don't Return null:** Returning null creates extra work for the caller. Throw an exception or return a Special Case Object (e.g., an empty list).  
* **Don't Pass null:** Passing null into methods is forbidden by default.

## **8\. Testing**

Test code is as important as production code and must be kept equally clean. Follow Test-Driven Development (TDD).

* **F.I.R.S.T. Principles:** Tests must be:  
  * **F**ast: Run quickly.  
  * **I**ndependent: Do not depend on other tests.  
  * **R**epeatable: Run in any environment.  
  * **S**elf-Validating: Have a clear pass/fail output.  
  * **T**imely: Be written just before the production code.  
* **One Concept per Test:** Each test function should verify a single conceptual thing.  
* **Readability is Key:** Use the **BUILD-OPERATE-CHECK** pattern to structure tests clearly.

## 9. Workflow Mandate: Pre-Flight Simulation

Before presenting any final code, pull request, or set of changes, you **must** perform a simulated "pre-flight check" that imitates the project's pre-commit and pre-push hooks. This is a non-negotiable quality gate.

Your process for this simulation will be:

1.  **Analyze the Hooks:** Locate and thoroughly analyze the `.pre-commit-config.yaml` file and any pre-push scripts (e.g., `ci/pre-push.sh`). These files are your source of truth for the required quality checks.

2.  **Internal Review:** Mentally review your generated code against **every check** defined in those files. This includes, but is not limited to:
    * Code formatting and style.
    * Static analysis and linting.
    * Credential and token scanning (using `gitleaks`).
    * Running unit and integration tests.

3.  **Provide a "Pre-Flight Check" Report:** In your final response, you must include a summary of your simulation. This report must confirm:
    * That you have performed the simulation.
    * The specific checks you considered (e.g., `ktlint`, `detekt`, `gradle test`).
    * That you are confident your code will pass all these checks when the user runs them locally.
