# Jump Up 
==================================================================

### Game Description
The game is called Jump Up. You could pick one of the three classic Nintendo characters-<strong>Mario, Donkey Kong, or Kirby</strong>. The game has “floors” or platforms that move up and down with increasing speed and your objective is to jump up or run down to each floor to avoid touching the bottom and top of the screen. Once you touch the bottom or top of the screen, you lose. Also, there will be enemies that will be moving on the floors with you, but you must avoid them otherwise you lose. There is no time limit for the game, since eventually the floors velocity will be so fast that you will lose(unless your’re pretty good!). With all that said, you get points by collecting as much coins as you can while staying alive!

Based on who you choose as your character, the settings and enemies of the game will change based on that character. For example, if you choose Mario, the floors will look like the ground sprites seen in most Mario games and the turtles will be your enemy.


### Problem(s)
The first major problem that I had with the game was the replication of the Mario game physics. Originally I thought this would be the easiest part since I can update the coordinate position of the player using xSpeed and ySpeed and implement the y-acceleration and x-acceleration in that way. But for some reason it wasn’t coming out correctly. Eventually after playing with many values for the y-acceleration and jumping sequence, I managed to create a playable physics environment that’s not exactly like the Mario’s physics environment, but similar. I could've also used the Fisica 2D physics engine for Processing but I wanted to work out the physics myself.

The second major problem that I encountered with the game was the restriction of the position of the player while between floors, which also created the platform on each floor. Originally, the only position on the floor that the player was able to go through was the “hole.” And the whole idea for the original game was for the player to only jump up through these holes. I tried using the constrain() method to constrain the y-position of the player between each floor IF the player was between those floors. However, even with the constrain() method, the player could still jump through the floors. This is when I started deviating from the original idea and started coming up with a unique kind of game where the player could jump through floors, but if they’re going down they must go through the holes.

### Animation!
For all the animated objects in the game, I borrowed a class called Animation from the Processing website. The link to that reference is [here](https://processing.org/examples/animatedsprite.html). 



### Floor and Enemy Mechanics
I originally wanted the floors to move in a constant velocity with no acceleration. But as I kept playing with the mechanics of the game, I figured it would be interesting to have the floors not only move up, but to also move down and in increasing velocity.

The enemies follow the same physics as the player. So when they encounter a hole, they would fall just like the player would. They also move randomly, so their behavior is unpredictable. 

### Sounds
It should be noted that all sounds and theme music were found online so the credit should go to Nintendo and/or the individuals that provided these mp3s.

### Game
You could check out the game [here](http://chrisjimenez.github.io/JumpUp/)!
