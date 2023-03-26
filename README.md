# GitHubApp
---

<img src="https://www.linkpicture.com/q/GitHubAppList.png" width="393" height="852"> <img src="https://www.linkpicture.com/q/GitHubAppFavourites.png" width="393" height="852">
<img src="https://www.linkpicture.com/q/GitHubAppDetail1.png" width="393" height="852"> <img src="https://www.linkpicture.com/q/GitHubAppDetail2.png" width="393" height="852">
<img src="https://www.linkpicture.com/q/GitHubAppFilterSort.png" width="393" height="852">


## Overview
---
GitHubApp is based on searching GitHub Repositories and reading detail of it


## Features
---
- List repositories
- See repositories's detailed explanation


## Tech Stack
---
- Xcode: Version 14.2
- Language: Swift 5.7
- Layout: Auto Layout in xib
- Minimum iOS Version: 13.0
- Dependency Manager: CocoaPods


## Dependencies
---
| Dependency | Reason |
| ------ | ------ |
| [Alamofire](https://github.com/Alamofire/Alamofire) | Network abstraction layers |
| [Kingfisher](https://github.com/onevcat/Kingfisher) | Image abstraction layers |
| [lottie-ios](https://github.com/airbnb/lottie-ios) | Custom Loading Indicator |
| [SwiftLint](https://github.com/realm/SwiftLint) | Syntax Rules |


## Architecture
---
![VIPER Module Representation](https://i.stack.imgur.com/bpM7t.png)

VIPER is selected as the project's architectural pattern. VIPER helps us at scaling the project. It separates responsibilities of components and increases testability. It is also easy to add feature (update).

## Unit Tests
---

## Limitations
---
[GitHub API](https://api.github.com/orgs/google/repos) provides GitHub Repositories.


## Installation
---
Clone the repository to your local
```bash
git clone https://github.com/GameAppDev/GitHubApp.git
```
Run GitHubApp.xcworkspace


## Contributing
---
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
Please make sure to update tests as appropriate.


## License
---
