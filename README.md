# Flying Dude - A Flappy Bird Clone in Godot
This project, Flying Dude, is a simple clone of the popular game Flappy Bird, implemented in the Godot game engine using GDScript.

# Game Mechanics
The game mechanics are simple. The player controls a character, referred to as the "Flying Dude", who is constantly falling due to gravity. The player can make the Flying Dude "flap" its wings to counteract the force of gravity and move upwards.

# Code Overview
The game is controlled by several scripts:

- `main.gd`: This is the main script that controls the game flow. It handles the game state (running, game over), scrolling of the ground, input events, and generation of pipes. It also keeps track of the score and high score.

- `player.gd`: This script controls the Flying Dude's behavior. It handles the physics of the Flying Dude's movement and the flap action.

- `pipe.gd`: This script controls the behavior of the pipes that the Flying Dude has to navigate through.

- `saveScore.gd`: This script manages the high score feature. It saves the highest score achieved by the player to a file and loads it when the game starts.

# How to Run
To run this project, you will need to have Godot installed. Open the project in Godot, and press the "Play" button.

# Contributing
Contributions are welcome! Please feel free to submit a pull request.

# License
This project is licensed under the MIT License
