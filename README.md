# Welcome to Friendly Character Generator!

  

**Friendly Character Generator** is an app for quickly and easily creating ready-to-use tabletop RPG characters, especially  for users that have no prior knowledge or experience! Currently, the generator is creating characters for **Dungeons & Dragons 5th Edition** only.

When creating a new character, users are asked simple and straightforward questions--basically "Do you prefer to fight or solve puzzles?" and "Do you like to deal lots of damage or heal people?"--and the app uses those answers to generate a customized character with a uniquely-generated backstory. **The goal is for users to have a usable, level 1 character sheet in less than 15 seconds.**

Additionally, users can create an account and log in to contribute new character Archetypes to the system for others to use!

The frontend repo can be found here: [https://github.com/isalevine/friendly-character-generator-frontend](https://github.com/isalevine/friendly-character-generator-frontend)
  
  

## Overview

**To create a new character:**

* On the main page, click the "Create New Character!" button on the left-hand card. 

* Click the deck to flip the first question card. 

* As you select the multiple-choice answers, new questions will appear. 

* When you have answered all questions, click the "Create Character!" button.

* A new card will appear with your character's Archetype, portrait, and a "Show More!" button to see additional info. 

* Click the "Show More!" button and your character's stats, skills, powers, and backstory will display, along with a "Print!" button.

* Click the "Print!" button and a printer dialog box will open up in your browser.
  

## Install

  
**To create a local version of this app:**

* Make sure you have Ruby and Bundler installed.

* Clone this repo onto your machine. 

* ```cd friendly-character-generator-backend-api``` to move into the folder.

* In your console, run ```bundle install``` to install Ruby gems.

* Make sure you have the JavaScript frontend cloned down, installed, and running on localhost:3001. [Directions can be found here.](https://github.com/isalevine/friendly-character-generator-frontend)

* Run ```rails s``` to start the app on localhost:3000.

* Open your browser (Chrome recommended), and navigate to localhost:3001 to use the frontend of the app!

  
  
  

## Release Notes


#### NEXT GOALS:

1. Refactor components/HTML for readability and screen-reader compatibility.
2. Add spell-selection to Archetypes with {spellcaster: true} attribute.
3.  Create tool to add Backstory Snippets to the database.
4. Create tool to add additional Game Systems to the character converter.


## Credits

Love and gratitude to Chris Arnold, Cody Green, and Ix Procopios at Flatiron School Seattle for their help and guidance on this project.

Special thanks to all the artists who provided creative-commons/fair-use/royalty-free images! You all really helped bring this project to life! <3
[https://www.reddit.com/r/PixelArt/comments/886vy0/occc_a_floating_island/](https://www.reddit.com/r/PixelArt/comments/886vy0/occc_a_floating_island/)
[https://www.reddit.com/r/PixelArt/comments/69ft7s/newbie_oc_cc_just_some_generic_floating_island/](https://www.reddit.com/r/PixelArt/comments/69ft7s/newbie_oc_cc_just_some_generic_floating_island/)
[https://www.reddit.com/r/PixelArt/comments/844xpz/occc_floating_island_for_pixel_dailys_theme/](https://www.reddit.com/r/PixelArt/comments/844xpz/occc_floating_island_for_pixel_dailys_theme/)
[https://www.oldbookillustrations.com/illustrations/grey-dolphin/](https://www.oldbookillustrations.com/illustrations/grey-dolphin/)
[https://www.oldbookillustrations.com/illustrations/wizard-sigh/](https://www.oldbookillustrations.com/illustrations/wizard-sigh/)
[https://www.oldbookillustrations.com/illustrations/pressure-fingers/](https://www.oldbookillustrations.com/illustrations/pressure-fingers/)

The beautiful background image animation and CSS is provided by Julien Amblard on CodePen: [https://codepen.io/Capse/pen/epmwRj](https://codepen.io/Capse/pen/epmwRj)

And of course, for the mage sprite--thank you once again Jerom on OpenGameArt:
[https://opengameart.org/content/16x16-fantasy-tileset](https://opengameart.org/content/16x16-fantasy-tileset)



Additional images used for dummy character portraits--please message me and I will gladly take them down:
[https://forums.nexusmods.com/index.php?/topic/5896894-yhorm-the-giant-from-dark-souls-3/](https://forums.nexusmods.com/index.php?/topic/5896894-yhorm-the-giant-from-dark-souls-3/)

[https://imgbin.com/png/iiWuN7V6/tuxedo-mask-sailor-moon-png](https://imgbin.com/png/iiWuN7V6/tuxedo-mask-sailor-moon-png)

[https://www.google.com/search?q=corn+wizard&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjfhd6ekMDiAhVrHTQIHderBsUQ_AUIDigB&biw=1440&bih=717#imgrc=Y25Fr9tskYFtLM:](https://www.google.com/search?q=corn+wizard&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjfhd6ekMDiAhVrHTQIHderBsUQ_AUIDigB&biw=1440&bih=717#imgrc=Y25Fr9tskYFtLM:)

[https://weheartit.com/entry/130762762](https://weheartit.com/entry/130762762)

https://pm1.narvii.com/6802/a6d3c9a8e762d8a55e1418a04521feb166c6c631v2_hq.jpg

https://i.pinimg.com/originals/f2/9d/7c/f29d7c6b070ebb09143387258e9b0de9.png

http://25.media.tumblr.com/a9abdc846ff91adbe3c00505e9db3c0d/tumblr_n0fso0bACm1r5yty8o1_1280.jpg

https://www.midnightpulp.com/wp-content/uploads/2018/03/drunken-master-slippery-snake_channel_poster.jpg
