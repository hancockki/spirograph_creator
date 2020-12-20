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
- If the user presses 'c' it clears the current spirograph. A new one is created when the user clicks the screen again, with a random radius but the same 
- If the user presses 'p' or 's' and then clicks the screen, then finally presses 'p' or 's' again, it will **erase** the current spiral and start another one with the **same radius and percentage decrease in circle size**. The benefit of this is that if the user likes the current shape of the spirograph but simply wants it in a new location, they can do that.

## Why this project
I have always been fascinated by fractals and geometrical patterns; in my 8th grade geometry class we had tables that were entirely whiteboards. I would enter my own world during class of drawing elaborate fractal designs all over the surface, hoping my teacher wouldn't notice (they did). I am not sure what it is about fractal designs I've always loved, but it has seeped into an interest in Islamic art and architecture, which uses lots of properties of fractals.

What made me want to do a project about spirographs specifically is twofold. First, I simply had a lot of fun with them as a child. Second, I took Group Theory last year, which professor Taback would always summarize as the study of the symmetrical properties of mathematical objects. A group is super abstract, but basically is anything set of objects under an operation that has:
1. Closure (when you perform the operation on two elements of the group the resulting element is also in the group)
2. Associativity (if * is our operation then A*(B * C) = (A * B) * C
3. Every element has an inverse
4. The group has an identity element (if our identity is I then for any element A, I * A + A * I + A)

Why am I going through this? Well, as it turns out spirographs are actually a group! I read [this paper](https://scholarship.claremont.edu/cgi/viewcontent.cgi?referer=https://www.google.com/&httpsredir=1&article=1328&context=hmnj#:~:text=In%20a%20spirograph%20set%2C%20each,to%20the%20number%20of%20teeth.) at the start of this project to get a refresher on the mathematics behind spirographs.

At least 1 paragraph that explains how the system is personally meaningful to you.
At least 1 paragraph that explains how working on this system challenged you as a computer scientist. How did you push yourself outside of your comfort zone? Why was this an important challenge for you? What are the next steps for you going forward?
