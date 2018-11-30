# notifyBuildResult
Push notification from xcode on build complete using Pushbullet

#### Usage:

* Clone repository into your project root. (Let 'notifyBuildResult' directory be in your project root.)
* Give all the scripts execute permissions (`chmod a+x script`).
* In Xcode, go to Preferences -> Behaviors. 
  * Under Build -> Start, add `build-start.sh` to Run.
  * Under Build -> Succeeds add `build-succeeded.sh` to Run.
  * Under Build -> Fails add `build-failed.sh` to Run.
  * Press + button on the left bottom to create new behavior under Custom.
  * Name it 'Notify Build Result' (or anything).
  * Specify shortcut to anthing you want.
  * Add `notifyBuildResult.sh` to Run.
    
* Download the PushBullet app (https://www.pushbullet.com/apps).
  * Create an account.
  * Under my account on the website create access token.
  * Open `access-token` file and write down your access token instead of "<your_access_token_here>".

* Press shortcut key you specified to custom behavior in Xcode. You will see:
  ![Screenshot](https://raw.github.com/knine79/notifyBuildResult/master/notifyBuildResult.png)
  * You can choose:
    * `Notify` to receive notifications of all build result since now.
    * `Notify Once` to receive notifications of build result until build succeeded once.
    * `Don't Notify` not to receive notifications no longer.
  
* Enjoy your leisure compile time
