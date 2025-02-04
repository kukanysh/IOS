
import Ap

func listRunningApps() {
    let runningApps = NSWorkspace.shared.runningApplications
    for app in runningApps {
        if let name = app.localizedName {
            print(name)
        }
    }
}

listRunningApps()
