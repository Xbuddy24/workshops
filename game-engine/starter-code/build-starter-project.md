# Build the Platformer Starter Project (Godot 4.x)

This guide walks you through creating the **starter project** used in the
Game Engine Tools workshop.

It’s written so:

- A student can follow it alone.
- An instructor can keep it open while recording a build video.

## Target "starter project" behavior

When you are done, the game should be true:

- A 2D player can **move left/right** and **jump** on a small area.
- The player has animations available: `idle`, `move`, `jump`.
- The player’s appearance is **always** the `idle` animation (even when moving).
- There are **gems** the player can jump/move into.
- When the player touches a gem, the gem is removed.

Later, during the workshop, students will:

- Switch animations based on movement (idle/move/jump)
- Flip the sprite left/right
- Add scoring, then (if time) a winner message

## Before you start

### Godot

- Godot **4.x** (latest stable).
- Web editor: <https://editor.godotengine.org/releases/latest/>
- Desktop install is fine too (steps are similar).

### Assets

You need:

- A player sprite with three animations (or frames you can treat as): `idle`, `move`, `jump`
- A gem sprite
- A tiles/platform sprite (or a plain colored rectangle)

I'm using the [Simplified Platformer Pack](https://www.kenney.nl/assets/simplified-platformer-pack) by Kenney, which is free and works well for a demo. You can use any art you like, but you should pay attention to the license and make sure you have permission to use it.

## Part A — Create the project

### A1) New project

1. Open Godot.

- If using the web editor, you will get a warning message that you can click away and then click "Start Godot editor"

2. Create a new project named: `platformer-starter-godot4`

- Leave the defaults and click "Create"

3. Switch to the "2D" workspace (top of the editor, toward the middle).
4. In the filesystem area (lower left), create these folders (right-click on the parent folder, `res://`, then click "New Folder"):

- `scenes`
- `scripts`
- `assets`
  - under assets, create subfolders:
    - `sprites`
    - `sounds` (optional, for later)

### A2) Project settings

1. Open **Project > Project Settings**.
2. (Optional) Set a window size (`Display -> Window`) that looks good for a workshop demo, for example:
   - Width: `960`
   - Height: `540`
3. Close Project Settings.

### A3) Import assets

1. In the filesystem area, select the `assets/sprites` folder.
2. From your operating system file explorer, drag your sprites into that folder.
  - For the `kenney_simplified-platformer-pack`, unzip it and go to the `Tilesheet` folder and drag `platformerPack_character.png` and `platformPack_tilesheet.png` onto the `assets/sprites` in the filesystem area of Godot.

## Part B — Create the main scene

We will make a "main" scene that holds the level and the player.

### B1) Create and save the scene

1. Create a new "Root Node" of type **2D Scene**.
2. Rename the root node to: `Main`
3. Save the scene as: `scenes/main.tscn`

### B2) Add a ground platform (simple version)

Goal: a flat platform the player can stand on.

1. Under `Main`, add a **StaticBody2D** named: `Ground`
2. Under `Ground`, add a **CollisionShape2D**
3. For the shape, choose **WorldBoundaryShape2D**
5. (Temporary visuals) Under `Ground`, add a **ColorRect**


Checklist:

- [ ] Player will have something to land on
- [ ] The level is small (fits on one screen)

## Part C — Add the player

### C1) Create the player scene/node

1. Create a new scene, choosing "Other Node" and selecting **CharacterBody2D**.
2. Rename the root node to: `Player`
3. Save it as: `scenes/player.tscn`
4. Under `Player`, add a **CollisionShape2D**
5. Choose a **CapsuleShape2D** (or RectangleShape2D) and size it to the player.
6. Switch back to the Main scene (`scenes/main.tscn`).
7. Drag `scenes/player.tscn` into the Main scene to create an instance of the player.

### C2) Add the player script

1. Switch to the player scene (`scenes/player.tscn`).
2. Select `Player`.
3. Click **Attach Script** (the scroll icon with the green plus sign in the top right of the editor).
4. Use the template "CharacterBody2D: Basic Movement".

### C3) Add the player visuals

To start with, add a ColorRect as a placeholder so we can test movement.

1. Under `Player`, add a **ColorRect**
2. Set the ColorRect to a visible color and size it to match the player.

**Now start the game and test that you can move the player left/right and jump.** Close the Game view to continue.

Now we can improve the visuals with **AnimatedSprite2D**

1. Under `Player`, add **AnimatedSprite2D** named: `AnimatedSprite2D`
2. In the Inspector, create a new **SpriteFrames** resource
3. For the "Sprite Frames" property, click the "New SpriteFrames" option, then click the "Edit" button that appears.
4. Click the grid icon to "Add Frames from Sprite Sheet".
5. Select your player sprite sheet (for example, `platformerPack_character.png`).
6. Zoom in enough to see the image, and adjust the horizontal and vertical frame counts to match your sprite sheet layout. For example, if there are 4 columns and 2 rows of images, you would set:
   - Horizontal Frames: `4`
   - Vertical Frames: `2`
7. Select the first frame, click "Add 1 Frame(s)", and rename the animation from `default` to `idle`.
8. Create the other animations by selecting the appropriate frames and clicking "Add 1 Frame(s)" for each, naming them `move` and `jump`.
9. Make sure you on the 2D workspace and that the `AnimatedSprite2D` node is selected, then play the animation, and adjust the FPS to make it look right (5.0 FPS works well for our example).
10. Select idle and then click the "Autoplay on Load" option to make sure this animation plays when the game starts.

Now that we have the AnimatedSprite2D set up, we can delete the ColorRect. Adjust the position and size of the AnimatedSprite2D if needed to align it with the collision shape.

## Part D — Add gems

We’ll make one gem scene and then place several in the level.

### D1) Create the Gem scene

1. Create a new `Area2D` scene.
2. Rename the root node to: `Gem`
3. Save it as: `scenes/gem.tscn`

Add nodes:

1. Under `Gem`, add an **AnimatedSprite2D** for the gem art.
  - Set it up with the gem sprite (similar to how we set up the player sprite), but this time load the sprite sheet for the gem (for example, `platformPack_tilesheet.png`).
  - "Horizontal" and "Verical" for the example should be set to 14 x 7.
  - Create an animation with just the single frame of the gem you want to use.
2. Under `Gem`, add a **CollisionShape2D**
   - Choose **CircleShape2D** and size it to the gem.

### D2) Gem pickup script

Attach a script to `Gem` (Area2D):

1. Select `Gem`.
2. Attach script: `gem.gd`
3. Save it at: `scripts/gem.gd`

```gdscript
extends Area2D

func collect_gem() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	collect_gem()
```

Now connect the signal:

1. Select `Gem`.
2. Go to the **Node** tab.
3. Double-click **body_entered**.
4. Connect it to `gem.gd` and choose `_on_body_entered`.

Checklist:

- [ ] Touching a gem removes it
- [ ] Touching with something else does nothing
- [ ] No score is changed

### D3) Place gems in Main

1. Open `scenes/main.tscn`.
2. Drag `scenes/gem.tscn` into the scene.
3. Duplicate it a few times and spread them around the platforms.

## Part E — Final starter-project check

Run the game.

✅ Must-have checklist:

- [ ] Player moves left/right
- [ ] Player jumps
- [ ] Player collides with ground/platforms
- [ ] Gems disappear when collected

## Part F — Improvements (optional)

- Add a Camera2D that follows the player.
- Add tile-based platforms using TileMap.

### F1) Add a Camera2D

1. In the Player scene, under `Player`, add a **Camera2D**.
2. Adjust the zoom and limits as needed to make the level look good.

### F2) Add tile-based platforms

1. In the Main scene, delete the `Ground` node we made earlier.
2. Under `Main`, add a **TileMapLayer**.
3. In the Inspector, create a new **Tile Set** resource for the TileMapLayer by selecting "TileSet", then selecting "Edit".
5. Drag `platformPack_tilesheet.png` in the TileSet editor and let it create a new tiles in atlas.
6. Add a Physics Layer to the TileSet and set the collision shape for the tiles you want to use as platforms.
7. Use the TileMapLayer by switching to the TileMap tab to paint platforms in the level.

### F3) Add RichTextLabel for score

1. In the Main scene, under `Main`, add a **CanvasLayer** named: `UI`
2. Under `UI`, add a **RichTextLabel** named: `ScoreLabel`
3. Position `ScoreLabel` in the top left corner and set the text to: `
Score: 0`
4. You can later add logic to update the score as gems are collected.

## Part F — Prepare the zip for students

Goal: create `platformer-starter-godot4.zip`.

### Desktop Godot

1. Close Godot.
2. Zip the entire project folder (the one containing `project.godot`).
3. Name the zip: `platformer-starter-godot4.zip`

### Web editor

1. Project -> Tools -> Download Project Source
2. Name the zip: `platformer-starter-godot4.zip`

Final check:

- [ ] The zip contains `project.godot` at the top level (or one folder down, consistently)
- [ ] Importing the zip into Godot works
