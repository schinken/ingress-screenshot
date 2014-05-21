ingress-screenshot
==================

Takes ingress screenshots with a headless firefox and make a video of those screenshots afterward

== Firefox Setup ==

=== Create Profile ===

First you have to set up a new profile for Firefox. You can easily do this by just typing

    firefox -P

into a terminal window while no other firefox window is opened. Firefox will now prompt you to create a new profile.

* Click the '''Create Profile'''-button
* Press '''Next''' to proceed on the Create Profile Wizard
* Enter your profile name - preferrably without spaces. e.g. use "ingress_cityname"
* Finish.

Firefox has now created a new user directory inside your home.

 ~/.mozilla/firefox/$randomnum.ingress_yourcity

'''Remember:''' If you want to take screenshots on a virtual machine/root-server you have to copy this profile to the machine using e.g. '''scp'''

Start firefox with your profile by clicking on "Start Firefox" or run it from console with:

 firefox -P ingress_cityname

=== Log in to Google Account ===

To watch the intel map you need to log in to your Google account.

* Navigate to http://ingress.com/intel
* Log in to your Google account
* Allow Ingress to access your Google account

=== Choose your Viewport ===

On the Ingress intel map, just zoom in to the location you want to capture, and copy the link by using the "link" symbol in the upper right-hand corner. This link contains lat/lon coordinates and the zoom level of your current view.

== Taking Screenshots ==

=== Dependencies ===

First you need to have these tools installed:

* firefox
* Xvfb
* avconv

You can install these scripts with the package manager of the linux distribution of your choice.

=== Start Script ===

Just create a clone of the ingress-screenshot repository somewhere:

 git clone https://github.com/schinken/ingress-screenshot

and configure the run.sh-script with your favorite text editor (vim, emacs, etc..). The parameter names should be self-explanatory.

Simply run the bash script with:

 ./run.sh

After a couple of minutes/seconds your first screenshot should appear in your current directory.

== Creating a Video ==

To create a video there is also a simple bash script in the git repository. Just run

 ./make_video.sh 

This will do the dirty work for you.


== FAQ ==

=== Needed ===

  sudo apt-get install libavcodec-extra-53 imagemagick xvfb 

=== Xlib:  extension "RANDR" missing on display ":23". ===

This is mostly just a warning, and everything will work fine

=== run.sh: import: Command not found ===

Make sure you have imagemagick installed. Install it on Ubuntu with this command:
 
  sudo apt-get install imagemagick
