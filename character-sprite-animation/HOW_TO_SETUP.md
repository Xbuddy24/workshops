# 🎮 Setup Guide — Deymoon Platformer Starter

Good news: all the game code is already written! Your job is just to get
the character art files into Godot. Follow these steps and you'll have a
playable game in minutes.

---

## 🕹️ Step 1 — Load the Project

1. Open your browser and go to **https://editor.godotengine.org**
2. Drag **character-sprite-animation.zip** onto the Project Manager window
3. Click **Install** and wait for it to finish loading
4. Press the ▶ **Play** button at the top — you should see the game running!

> 💡 **Try it out!** Press A/D to move and Space to jump. This is your game.

---

## 🎨 Step 2 — Download the Character Sprites

The game needs 13 image files — one for each move your character can do.

1. Go to **https://deymoon.itch.io/character-template** and click **Download**
2. Open the ZIP file that downloads to your computer
3. Find the folder containing the PNG files (they all start with `character_`)
4. Keep this folder open — you'll need it in the next step

> 📁 You're looking for 13 files like `character_idle.png`, `character_walk.png`, etc.

---

## 🖌️ Step 3 — Customize a Sprite in Piskel

1. Open **https://www.piskelapp.com/** in your browser
2. Drag and drop one PNG from your Deymoon folder into the Piskel editor (for example `character_idle.png`)
3. In **Import and Merge**, choose **Import as spritesheet**
4. Set **Frame size** to **48 × 48** (width **48px**), then click **import**
5. Edit each frame in the timeline to draw your own character over the existing animation
6. When you're done: **Export → PNG**, set **Rows** to **1** (and **Columns** to match the number of frames), then click **Download**
7. Drag the exported PNG into Godot to replace the original file (keep the filename exactly the same)

---

## 📂 Step 4 — Add the Sprites to Godot

> ⚠️ **Important:** Drag the PNG files in directly — do NOT drag the ZIP file.

1. In Godot, find the **FileSystem panel** in the bottom-left corner
2. Click on the `sprites/player/` folder to open it
3. Drag ALL 13 PNGs from your Deymoon folder into `sprites/player/`

Godot will automatically import them as you drop them in. Here are the exact
file names — they must match exactly:

```
character_air-spin.png
character_crouch-idle.png
character_crouch-walk.png
character_idle.png
character_jump.png
character_land.png
character_ledge-climb.png
character_ledge-grab.png
character_roll.png
character_run.png
character_walk.png
character_wall-land.png
character_wall-slide.png
```

| Animation    | PNG File                  | Columns | What It Does            |
|--------------|---------------------------|---------|-------------------------|
| idle         | character_idle.png        | 6       | Standing still          |
| walk         | character_walk.png        | 8       | Slow walk               |
| run          | character_run.png         | 8       | Fast run (hold Shift)   |
| roll         | character_roll.png        | 11      | Rolling dodge           |
| jump         | character_jump.png        | 4       | Jumping up              |
| air_spin     | character_air-spin.png    | 8       | Double jump spin        |
| land         | character_land.png        | 3       | Landing on ground       |
| crouch_idle  | character_crouch-idle.png | 4       | Crouching still         |
| crouch_walk  | character_crouch-walk.png | 11      | Crouching + moving      |
| ledge_climb  | character_ledge-climb.png | 5       | Climbing up a ledge     |
| ledge_grab   | character_ledge-grab.png  | 1       | Hanging from a ledge    |
| wall_slide   | character_wall-slide.png  | 2       | Sliding down a wall     |
| wall_land    | character_wall-land.png   | 1       | Landing from a wall     |

---

## 🔧 Step 5 — Fix the Blurry Pixels

Pixel art looks blurry by default. This one setting makes it look crisp:

**Project → Project Settings → Rendering → Textures → Default Texture Filter → Nearest**

Then click **Save & Restart**.

> 🖼️ Without this, your sprites will look soft and blurry. With it, every pixel is sharp!

---

## 🕹️ Controls

| Key                | Action                        |
|--------------------|-------------------------------|
| A or ← Arrow       | Move left                     |
| D or → Arrow       | Move right                    |
| Space or ↑ Arrow   | Jump                          |
| Space (in air)     | Double jump spin 🌀            |
| S or ↓ Arrow       | Crouch                        |
| Hold Shift         | Run fast                      |
| Tap Shift (moving) | Roll / dodge                  |
| Jump into a wall   | Wall slide 🧗                  |
| Jump near a ledge  | Grab and climb the ledge 🪝    |
