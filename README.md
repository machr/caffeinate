#  [![Caffeinate](README_images/logo.png)](https://dry-falls-58899.herokuapp.com/) CAFFEINATE

**Technologies used: **
Ruby, Sinatra, HTML, SASS, JavaScript, Heroku, Postgresql

### How I approached this project ###

This project was our first full-stack project, meaning we had to use Front-end (HTML, CSS, JavaScript) and Back-end (Ruby, Sinatra, Postgres) technologies and deploy to Heroku.

In orden to come up with my idea, I set a 5 minute timer on my phone and started scribbling down as many ideas as I could before the timer ran out, without giving thought if the ideas were good or not.

I wanted to run my idea by my instructors before choosing the final concept, so I left the ideas and starting setting up my development environment so I could jump into coding when the planning phase was finished. I decided to use SASS as my CSS pre-processor, because I like the built-in functions and nesting when I work on larger projects. I used Gulp to compile my SASS to CSS, minify JavaScript, compress images and reload my browser on save to see changes. It was probably overkill for this project, but now I have a working Gulp file for the next project.

After talking to instructors about my favourite idea and getting positive feedback, I started making a Entity Relations diagram to figure out how the database tables would be connected to each other. My original idea included Shops, Users, Shop Owners, Services and a few more, but I made my scope smaller and prioritized basic CRUD functionality.

[![Caffeinate](README_images/screenshot.png)](https://dry-falls-58899.herokuapp.com/)

### What I need to work on personally ###

I need to learn to structure my JavaScript code better and make it easier to read. I've had to re-read my code a few times after leaving it for a few hours.

I also need to learn to break down problems in atomic parts to really gain a full understanding in what's happening in the compiler. Often I focus on getting it to work as fast as possible, instead of trying to understand my code on a basic level and focus on getting it to work as fast as possible.




**Bugs and Unsolved Issues**

- Game does not consider 'Draw' scenarios.

- Games does not reset on win.

- Game is using a lot of fixed dimensions and is not responsive at all.

  ​


**TO-DO List**

- Re-read complicated code sections, i.e Regex expressions in functions
- Redesign X & O symbols
- Keep score of winning
- Add input fields to get player names
- Show player turn (could be a toggleClass based on turnCounter)
- Give players avatar options
- Fix bugs and refactor code
