@testable import App
import Injection

let appModule = {
    Module {
        component { networkComponent }
        component { servicesComponent }
        component { useCaseComponent }
    }
}
