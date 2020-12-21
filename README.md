# Spiraling Spirograph Scene!
This applet allows the user to easily create their own spirograph design and experiment with the different mathematical proportions that lead to different shapes. The user is casually creating a design of different fractal-based spirographs which they have a TON of control over. It's meant to be fun and relaxing, allowing them to enter a state of **flow** by watching the spirographs spin and figuring out the wide range of shapes you can create!

The user is kept engaged by all of the various elements they can manipulate. These elements are (they are also outlined in the control panel):

- The number of circles in the spirograph. This is initialized to 4 circles total but there is a button that allows the user to seamlessly increase/decrease the number of circles. More circles lead to more intricate shapes, fewer circles more simple shapes.
- The percent decrease of each inner circle from it's parent. Each spirograph has a radius that is a fixed percentage smaller than its parents. The user controls this percentage, but it is initialized to 1/3, meaning each inner circle has a radius 1/3 of the parent. To change this value, the user simply clears the current drawing and a new one will appear with a random percentage.
- The number of layers in the drawing. This is basically just the thickness of the spirograph's path; having a thicker path gives the drawing the sense of being 3D
- The spirograph's colors. There are sliders to manipulate the amount of red, green, and blue in each one.
- The number of spirographs on the screen. The user simply clicks the screen where they want a new spirograph to appear. This new spirograph will have the same speed, number of circles, and percent decrease in circle size, but the radius of the new circle will be randomized.

## Other elements the user can manipulate
The user also has control of other aspects of the drawing. They have the ability to pause and play the drawing, clear the current spirograph, and save the image.
- If the user presses 'p' it pauses the drawing by calling noLoop(), which pauses the draw function in Processing. If they press 'p' again, it plays it again. This is useful if the user wants to pause the drawing to think about what/where they want to draw next.
- If the user presses 's' it stops the spirograph and hides the circles. This is very similar to pressing 'p', but the big difference here is that all we are doing is hiding the circles instead of actually stopping the entire drawing process. This is useful if the user wants to see that the drawing looks like without the white circles. They simply press 's' again to start the drawing and make the circles reappear.
- If the user clicks the screen anywhere, a new spirograph will appear with a random radius and percent decrease in circle size.
- If the user presses 'c' it clears the current spirograph. A new one is created when the user clicks the screen again, with a random radius and random percent decrease in circle size. In other words, if the user doesn't like the shape of the current drawing they can erase it and try again with a new random spirograph.
- If the user presses 'p' and then clicks the screen, then presses 'p' again, it will start another spiral with the **same percentage decrease in circle size** but **different radius**. This feature is useful if you want to create multiple spirographs with the same shape but different radius. 
- If the user presses 's' and then clicks the screen, then presses 's' again, it will **erase** the current spiral and start another one with the **same percentage decrease in circle size and the same size radius**. The benefit of this is that if the user likes the current shape of the spirograph but simply wants it in a new location, they can do that.

## Why this project
I have always been fascinated by fractals and geometrical patterns; in my 8th grade geometry class we had tables that were entirely whiteboards. I would enter my own world during class of drawing elaborate fractal designs all over the surface, hoping my teacher wouldn't notice (they did). I am not sure what it is about fractal designs I've always loved, but it has seeped into an interest in Islamic art and architecture, which uses lots of properties of fractals.

What made me want to do a project about spirographs specifically is twofold. First, I simply had a lot of fun with them as a child. Second, I took Group Theory last year, which professor Taback would always summarize as the study of the symmetrical properties of mathematical objects. A group is super abstract, but basically is anything set of objects under an operation that has:
1. Closure (when you perform the operation on two elements of the group the resulting element is also in the group)
2. Associativity (if * is our operation then A*(B * C) = (A * B) * C
3. Every element has an inverse
4. The group has an identity element (if our identity is I then for any element A, I * A + A * I + A)

Why am I going through this? Well, as it turns out spirographs are actually a group! I read [this paper](https://scholarship.claremont.edu/cgi/viewcontent.cgi?referer=https://www.google.com/&httpsredir=1&article=1328&context=hmnj#:~:text=In%20a%20spirograph%20set%2C%20each,to%20the%20number%20of%20teeth.) at the start of this project to get a refresher on the mathematics behind spirographs. Basically, they are a symmetric group because they have rotational and reflective symmetry. For more about symmetry and group theory, I also found [this page](http://www.ics.uci.edu/~eppstein/junkyard/sym.html) useful. Basically, I thought it would be fun to create a project where the user can explore these different symmetric properties themselves, by seeing how different components of the spirograph lead to vastly different shapes. There are certain ratios of speed to radius that yield beautifully symmetric curves, and others that are quite wonky and not too pretty. I wanted the user to be able to figure out and explore what they thought was interesting, rather than hard-coding in the best ratios. This is also relaxing, as it's kinda nice to just watch a spiral being traced over and over! My thought was that it would put the user in a bit of a trance.
## Example Spirograph Images
![Example 1](spirograph_example1.png)
## What did I get out of this project?
First, I have never used Processing before, and it's been *quite* some time since I last used Java. Thus, this was challenging for me as I had to parse through lots of documentation to refresh myself on how the language itself actually worked. I also spent quite a bit of time learning about G4P since I wanted a rather complex control board for the user to manipulate. This required opening a second window in Processing and creating control buttons/sliders that the program interprets from the user. As G4P is rather sparse in terms of documentation, this in itself was a bit challenging. I also pushed myself out of my comfort zone by combining mathematics and computer science in this project. Even though the mathematics I ended up using were pretty simple, it still took some time to think through the mathematical formulations of how the different circles were related and how I could trace a curve based on their movement. This challenge felt important as I have wanted to do something like this for a long time. I also thought it would be fun since I made fractals using Turtle back in CSCI 1101, so in a way I kind of wanted to circle back to when I was a beginner at coding.
Going forward, I hope to continue working on dynamically updating content based on user interactions with my computer programs. I feel like I have a very strong foundation in algorithms and optimization in computer programming, but I do not have nearly as much experience with APIs and computer-user interaction. While I am not explicity interested in front-end development, I do think I want to improve my understanding of how front and backend components interact.

## Known Bugs
These are not bugs that will stop the program, but rather aspects of the user interaction that might yield some unwanted results.
- adding many layers will cause the program to become quite slow after adding a few spirographs. This is simply because the data structure used is an Array List of Array Lists, where each spirograph path is an array list of points and we keep track of every spirograph.
- based on how the *paused* and *stop* booleans are coded, if the user clicks *stop* and then *pause* before clicking *stop* again, they might lose the entire drawing. this is because clicking p calls noLoop() and clicking p again calls loop() to restart it, while clicking s just doesn't show the circles and stops the circles from rotating. If both are called, we will not see the circles or the path, and the user might be confused as to how to start the spirograph again. I played around with this a lot to try and catch any actual errors in the code, but never got anything that actually caused it to crash. I just fitgeted with pressing s and p until it came back on.
