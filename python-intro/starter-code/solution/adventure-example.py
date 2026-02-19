# Interactive Text Adventure - Example Solution

# Story Variables
story_title = "The Crystal Caves"
treasure_found = 0
has_magic_key = False

# Ask the Player's Name
print("=== " + story_title + " ===")
print()
hero = input("What is your name, adventurer? ")
print()

# Story Opening
print(f"Welcome, {hero}! You stand at the entrance to the Crystal Caves.")
print("Strange lights flicker from deep within...")
print()

# First Choice
print("Two tunnels stretch before you.")
choice1 = input("Do you take the glowing tunnel (1) or the dark tunnel (2)? ").lower()
print()

if choice1 == "1":
    print(f"{hero} follows the glowing light deeper into the cave.")
    print("You discover a chamber filled with crystals!")
    treasure_found = treasure_found + 3
    print(f"You collected {treasure_found} crystals!")
else:
    print(f"{hero} bravely enters the dark tunnel.")
    print("You find an old chest with a magic key inside!")
    has_magic_key = True
    treasure_found = treasure_found + 1
    print(f"You found {treasure_found} treasure and a magic key!")

print()

# Second Choice
print("You reach a massive door with a golden lock.")
choice2 = input("Do you try to open it (1) or explore further (2)? ").lower()
print()

if choice2 == "1":
    if has_magic_key:
        print("Your magic key fits perfectly!")
        print("The door opens to reveal a dragon's treasure room!")
        treasure_found = treasure_found + 5
    else:
        print("The door is locked tight. You push with all your might...")
        print("It creaks open just enough to squeeze through!")
        treasure_found = treasure_found + 2
else:
    print(f"{hero} decides to explore the nearby passages.")
    print("You find a hidden waterfall with gems behind it!")
    treasure_found = treasure_found + 3

print()

# Story Ending
print("=== The End ===")
print()
print(f"Congratulations, {hero}!")
print(f"You completed {story_title}!")
print(f"Total treasure collected: {treasure_found} items")
if has_magic_key:
    print("You also kept the magic key for future adventures!")
print()
print("Thanks for playing!")
