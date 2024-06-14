# notifyBuildResult
Push notification from Xcode on build complete using PushBullet app.

Aren't you boring to wait computer while compiling Swift code?
My project will helpful. Now you can enjoy your leisure compile time.

![GetBackToWork](https://imgs.xkcd.com/comics/compiling.png)

## Usage:

### Messanger Setting
#### PushBullet
* Download the PushBullet app (https://www.pushbullet.com/apps).
  * Create an account.
  * Under my account on the website, create access token (https://www.pushbullet.com/#settings/account).

* Clone this repository.
  * Save access token with `config-PushBullet.sh <your-pushbullet-access-token>` command.

#### KakaoWork, Slack
* Clone this repository.
  * Save KakaoWork webhook url with `config-KakaoWork.sh <webhook-url>` command.
  * Save Slack webhook url with `config-Slack.sh <webhook-url>` command.

### Xcode Setting 
* In Xcode, go to Preferences -> Behaviors. 
  * Under Build -> Start, add `build-start.sh` to Run.
  * Under Build -> Succeeds, add `build-succeeded.sh` to Run.
  * Under Build -> Fails, add `build-failed.sh` to Run.
  * Press '+' button on the left bottom to create new behavior under Custom.
  * Name it anything you want. (e.g.) `Notify Build Result`
  * Specify shortcut to anthing you want. (e.g.) `Shift+Ctrl+Option+Cmd+N`
  * Add `notifyBuildResult.sh` to Run.
    
* Press shortcut key you specified to custom behavior in Xcode. You will see:
  ![Screenshot](https://raw.github.com/knine79/notifyBuildResult/master/notifyBuildResult.png)
  * You can choose:
    * `Notify` to receive notifications of all build result since now.
    * `Notify Once` to receive notifications of build result until build succeeded once.
    * `Don't Notify` not to receive notifications no longer.
  
* Enjoy your leisure compile time

#### Clean Removal

* Remove `$HOME/.NotifyBuildResult/` directory.
* Remove cloned repository.
