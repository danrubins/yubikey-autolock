# Yubikey Auto Lock for Mac

I attached my keycard to my Yubikey so I don't forget to lock my computer when I leave my desk. Pull out the Yubikey and **poof**, the Mac locks itself. I didn't want to grant admin permissions to some opaque and bloated auto-unlocking utility so that it can unlock my Mac, just a basic script to lock it when I walk away. I might update this to work with Bluetooth and link it up to my Apple Watch or iPhone.

## Instructions

1. Open up the Automator app on your Mac
1. Create a "New Document" at the prompt
1. Select Application and click "Choose"
1. Search for and select "Run Shell Script"
1. Paste this script (or a link to the location where you've saved this script on your machine)
1. Save and exit Automator
1. Open up the Users Settings panel, go to Login Items, and add your new Automator App.
