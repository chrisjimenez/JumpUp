# JumpUp! 
==================================================================


After solving many glitches and minor details of the game, I’ve finally finished with Jump Up. My original plan was to replicate the gaming experience of Ice Climber, but the decisions Ive made during the creation of the game deviated me away from the idea, which resulted in a unique kind of game where not only do you have to jump up, but you also have to jump down(or run down). 



### Official Game Description
The official name of the game is Jump Up. The game will have “floors” or platforms that will continuously move down and after a certain period, will reverse and move up. Your objective, as the player, is to jump up or jump down to each floor to avoid touching the bottom and top of the screen. Once you touch the bottom or top of the screen, you lose. Also, there will be enemies that will be moving on the floors with you, but you must avoid them otherwise you lose. With all that said, you get points by collecting as much coins as you can while staying alive. 

You have the option to pick one of the three memorable Nintendo characters-Mario, Donkey Kong, or Kirby. Based on who you choose as your character, the settings of the game will change based on that character. And the enemies will also change based on that character. For example, if you choose Mario, the floors will look like the ground seen in most Mario games and the enemies would be the turtles, also seen in the Mario games. There is no time limit for the game, since eventually the floors velocity will be so fast that you will lose(unless your’e pretty good). The whole idea is to collect as much coins as you can while alive.

### Problem(s)
The first major problem that I encountered with the game was, surprisingly, the replication of the Mario physics that we are all familiar with. Originally I thought this would be the easiest part since I can update the coordinate position of the player using xSpeed and ySpeed and implement the y-acceleration and x-acceleration in that way. But for some reason it wasn’t coming out correctly. Eventually after playing with many values for the y-acceleration and jumping sequence, I managed to create a playable physics environment that’s not exactly like the Mario’s physics environment, but similar. 

The second major problem that I encountered with the game was the restriction of the coordinated position of the player while between floors, which also created the platform on each floor. Originally, the only position on the floor that the player is able to go through is the “hole.” And the whole idea for the original game was for the player to only jump up through these holes. I tried using the constrain() method to constrain the y-position of the player between each floor IF the player was between those floors. 

However, even with the constrain() method, the player could still jump through the floors. I tried using many other methods but for some reason it only works if the player is on top of a floor not under. This is when I started deviating from the original idea and started coming up with a unique kind of game where the player could jump through floors, but if they’re  going down they must go through the holes.

### Images!
For all the animated objects in the game, I borrowed a class called Animation from the Processing website. The link to that reference is here. This is a very cool class because all you need is a set of images that would look like an animation if displayed consecutively.



### Floor and Enemy Mechanics
As mentioned, originally I wanted the floors to keep moving down( simulating the screen going up). Additionally, I wanted the floors to move in a constant velocity, aka no acceleration. But as I kept playing with the mechanics of the game, I figured it would be interesting to have the floors not only move up, but to also move down. And as time progresses, the floors will move up and down at higher velocities.

The enemies follow the same physics as the player. So when they encounter a hole, they would fall just like the player would. The enemies move randomly, so when you move floor to floor you have to be careful and not touch the enemies. This is going to be hard because their movements are unpredictable.

### Sounds
It should be noted that all sounds and theme music were found online so the credit should go to Nintendo and/or the individuals that provided these mp3s. So with that said, here is some of the sounds I used in the game that I got online.

### Gameplay
For some reason I’m having a hard time displaying a playable version of the game here, but as soon as I get the problem resolved, it will be posted. For the mean time, you can check out some check out some gameplay footage below.

<a href="http://www.youtube.com/watch?feature=player_embedded&v=MUOyrIigiyI
" target="_blank"><img src="http://img.youtube.com/vi/MUOyrIigiyI/0.jpg" 
alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10" /></a>


<iframe width="420" height="315" src="//www.youtube.com/embed/MUOyrIigiyI" frameborder="0" allowfullscreen></iframe>