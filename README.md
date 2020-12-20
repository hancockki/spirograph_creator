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
