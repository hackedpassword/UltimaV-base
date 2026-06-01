![](https://raw.githubusercontent.com/hackedpassword/Unciv-Assets/refs/heads/main/Images/Ultima%20V/basemod/west_of_dungeon_shame.png)

# UltimaV base mod
![](Images/TileSets/Ultima/Tiles/Citadel.png) Ultima V series **total conversion** mod ![](Images/TileSets/Ultima/Tiles/Citadel.png)

	Includes:
	  ✅ TileSet
	  ✅ UnitSet
	  ✅ Edges
	  ✅ Map

# Info

A WIP repo for development, excluded from the mods menu. When complete/ready, will package as a new mod. Feel free to explore this repo if you've never seen it before.

# Updates

A requirement for technical visuals has been to change the root background color. This has been notoriously impossible to change, until now. Another Madmapper(tm) modhack. See:

![](https://raw.githubusercontent.com/hackedpassword/Unciv-Assets/refs/heads/main/Images/Ultima%20V/basemod/black_background.png)

The background is black!

To avoid overlap artifacts, base terrain is being re-shaped (you have to click it to see the alpha punchout):

![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/Grassland.png)

The issue becomes the alpha punchout exposes the base background color. For Ultima, our base background is black, not Unciv's dark blue. By changing the background color, we can use alpha exposures without artifacts.

Peruse [jsons/Skins/](jsons/Skins/) to see how this was accomplished.

# Let's Pique

Want to see something unusual? Assets leverage Unicode symbols. "picture worth 1000 words", so using symbols, long asset names have been reduced to 2-4 self-describing symbols.

To see this in action, check out this example of [the rivers asset scheme](https://github.com/hackedpassword/UltimaV-base/tree/main/Images/TileSets/Ultima/Tiles/rivers). Also look at the tables below. Asset entity blocks are in [jsons/Terrains.json](jsons/Terrains.json) for perusal.

![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/river/%E2%AE%9F%20%E2%95%9A.png)![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/river/%E2%AE%9F%20%E2%95%97.png)![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/river/%E2%AE%9F%20%E2%96%84.png)<br>![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/path/%E2%AE%9F%20%E2%95%97.png)![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/river/%E2%95%91.png)![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/Waterfall.png)<br>![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/bridge/%E2%AE%9D%20%5D%5B.png)![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/river/%E2%AE%9D%20%E2%95%A9.png)![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/river/%E2%AE%9D%20%CB%AD.png)![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/river/%E2%AE%9D%20%E2%95%A6.png)![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/river/%E2%AE%9D%20%E2%8B%97%E2%96%A8.png)<br>![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/path/%E2%95%91.png)![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/Academy.png)![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/Mountain.png)![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/river/%E2%AE%9D%20%E2%95%9A.png)![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/river/%E2%AE%9D%20%E2%95%97.png)<br>![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/path/%E2%AE%9D%20%E2%95%9A.png)![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/path/%E2%AE%9D%20%CB%AD.png)![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/path/%E2%AE%9D%20%E2%95%97%E2%95%9A%20%E2%AE%9F.png)![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/path/%E2%AE%9F%20%E2%80%97.png)![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/bridges/%E2%AE%9F%20%E2%8E%B6.png)![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/path/%E2%AE%9F%20%E2%95%9D.png)


## Symbol rendering in browsers (vs in-game)

Unicode can be stressful on various apps and platforms. The glyph maps below render as follows:

| Android | Chrome | Firefox | Edge | Ghostery |
| --- | --- | --- | --- | --- |
| Renders |   |   |   |   |
| Doesn't |   | X | X |   |
| Partial | X |   |   | X |

| Windows | Chrome | Firefox | Edge | cmd | powershell | explorer | |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Renders |  |  |  |  | | | | |
| Doesn't |  |  |  |  | | | | |
| Partial |  |  |  |  | | | | |



## River glyph map

|     |     |     |      |     |     |     |     |
| :-: | :-: | :-: | :--: | :-: | :-: | :-: | :-: |
|  ║  | ⮝ ╚ | ⮟ ╚ | ⮝ ⋗▨ | ⮝ ╠ | ⮝ ╦ | ⮝ ▀ | ⮝ ⩓ |
| ⮝ ˭ | ⮝ ╝ | ⮟ ╝ | ⮟ ⋗▨ | ⮝ ╣ | ⮝ ╩ | ⮟ ▄ | ⮝ ⩔ |
| ⮟ ‗ | ⮝ ╔ | ⮟ ╔ | ⮝ ▨⋖ | ⮟ ╠ | ⮟ ╦ |     | ⮟ ⩓ |
|     | ⮝ ╗ | ⮟ ╗ | ⮟ ▨⋖ | ⮟ ╣ | ⮟ ╩ |     | ⮟ ⩔ |

|                                                                                                                                                    |                                                                                                                                                    |                                                                                                                                                    |                                                                                                                                                              |                                                                                                                                                    |                                                                                                                                                    |                                                                                                                                                    |                                                                                                                                                    |
| :------------------------------------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------------------------------------: |
|        ![║](Images/TileSets/Ultima/Tiles/river/%E2%95%91.png)        | ![⮝ ╚](Images/TileSets/Ultima/Tiles/river/%E2%AE%9D%20%E2%95%9A.png) | ![⮟ ╚](Images/TileSets/Ultima/Tiles/river/%E2%AE%9F%20%E2%95%9A.png) | ![⮝ ⋗▨](Images/TileSets/Ultima/Tiles/river/%E2%AE%9D%20%E2%8B%97%E2%96%A8.png) | ![⮝ ╠](Images/TileSets/Ultima/Tiles/river/%E2%AE%9D%20%E2%95%A0.png) | ![⮝ ╦](Images/TileSets/Ultima/Tiles/river/%E2%AE%9D%20%E2%95%A6.png) | ![⮝ ▀](Images/TileSets/Ultima/Tiles/river/%E2%AE%9D%20%E2%96%80.png) | ![⮝ ⩓](Images/TileSets/Ultima/Tiles/river/%E2%AE%9D%20%E2%A9%93.png) |
|   ![⮝ ˭](Images/TileSets/Ultima/Tiles/river/%E2%AE%9D%20%CB%AD.png)  | ![⮝ ╝](Images/TileSets/Ultima/Tiles/river/%E2%AE%9D%20%E2%95%9D.png) | ![⮟ ╝](Images/TileSets/Ultima/Tiles/river/%E2%AE%9F%20%E2%95%9D.png) | ![⮟ ⋗▨](Images/TileSets/Ultima/Tiles/river/%E2%AE%9F%20%E2%8B%97%E2%96%A8.png) | ![⮝ ╣](Images/TileSets/Ultima/Tiles/river/%E2%AE%9D%20%E2%95%A3.png) | ![⮝ ╩](Images/TileSets/Ultima/Tiles/river/%E2%AE%9D%20%E2%95%A9.png) | ![⮟ ▄](Images/TileSets/Ultima/Tiles/river/%E2%AE%9F%20%E2%96%84.png) | ![⮝ ⩔](Images/TileSets/Ultima/Tiles/river/%E2%AE%9D%20%E2%A9%94.png) |
| ![⮟ ‗](Images/TileSets/Ultima/Tiles/river/%E2%AE%9F%20%E2%80%97.png) | ![⮝ ╔](Images/TileSets/Ultima/Tiles/river/%E2%AE%9D%20%E2%95%94.png) | ![⮟ ╔](Images/TileSets/Ultima/Tiles/river/%E2%AE%9F%20%E2%95%94.png) | ![⮝ ▨⋖](Images/TileSets/Ultima/Tiles/river/%E2%AE%9D%20%E2%96%A8%E2%8B%96.png) | ![⮟ ╠](Images/TileSets/Ultima/Tiles/river/%E2%AE%9F%20%E2%95%A0.png) | ![⮟ ╦](Images/TileSets/Ultima/Tiles/river/%E2%AE%9F%20%E2%95%A6.png) |                                                                                                                                                    | ![⮟ ⩓](Images/TileSets/Ultima/Tiles/river/%E2%AE%9F%20%E2%A9%93.png) |
|                                                                                                                                                    | ![⮝ ╗](Images/TileSets/Ultima/Tiles/river/%E2%AE%9D%20%E2%95%97.png) | ![⮟ ╗](Images/TileSets/Ultima/Tiles/river/%E2%AE%9F%20%E2%95%97.png) | ![⮟ ▨⋖](Images/TileSets/Ultima/Tiles/river/%E2%AE%9F%20%E2%96%A8%E2%8B%96.png) | ![⮟ ╣](Images/TileSets/Ultima/Tiles/river/%E2%AE%9F%20%E2%95%A3.png) | ![⮟ ╩](Images/TileSets/Ultima/Tiles/river/%E2%AE%9F%20%E2%95%A9.png) |                                                                                                                                                    | ![⮟ ⩔](Images/TileSets/Ultima/Tiles/river/%E2%AE%9F%20%E2%A9%94.png) |



## Path and bridge glyph map

| | | | | | |
|:-:|:-:|:-:|:-:|:-:|:-:|
| ║ | ⮝ ╝ | ⮟ ╝ | ⮝ ╗╚ ⮟ | ⮝ ╦ | ⮝ ][ |
| ⮝ ˭ | ⮝ ╚ | ⮟ ╚ | ⮟ ╝╔ ⮝ | ⮟ ╩ | ⮝ ⎶ |
| ⮟ ‗ | ⮝ ╔ | ⮟ ╔ | | | ⮟ ][ |
| | ⮝ ╗ | ⮟ ╗ | | | ⮟ ⎶ |

| | | | | | |
|:-:|:-:|:-:|:-:|:-:|:-:|
| ![║](Images/TileSets/Ultima/Tiles/path/%E2%95%91.png) | ![⮝ ╝](Images/TileSets/Ultima/Tiles/path/%E2%AE%9D%20%E2%95%9D.png) | ![⮟ ╝](Images/TileSets/Ultima/Tiles/path/%E2%AE%9F%20%E2%95%9D.png) | ![⮝ ╗╚ ⮟](Images/TileSets/Ultima/Tiles/path/%E2%AE%9D%20%E2%95%97%E2%95%9A%20%E2%AE%9F.png) | ![⮝ ╦](Images/TileSets/Ultima/Tiles/path/%E2%AE%9D%20%E2%95%A6.png) | ![⮝ \]\[](Images/TileSets/Ultima/Tiles/bridge/%E2%AE%9D%20%5D%5B.png) |
| ![⮝ ˭](Images/TileSets/Ultima/Tiles/path/%E2%AE%9D%20%CB%AD.png) | ![⮝ ╚](Images/TileSets/Ultima/Tiles/path/%E2%AE%9D%20%E2%95%9A.png) | ![⮟ ╚](Images/TileSets/Ultima/Tiles/path/%E2%AE%9F%20%E2%95%9A.png) | ![⮟ ╝╔ ⮝](Images/TileSets/Ultima/Tiles/path/%E2%AE%9F%20%E2%95%9D%E2%95%94%20%E2%AE%9D.png) | ![⮟ ╩](Images/TileSets/Ultima/Tiles/path/%E2%AE%9F%20%E2%95%A9.png) | ![⮝ ⎶](Images/TileSets/Ultima/Tiles/bridge/%E2%AE%9D%20%E2%8E%B6.png) |
| ![⮟ ‗](Images/TileSets/Ultima/Tiles/path/%E2%AE%9F%20%E2%80%97.png) | ![⮝ ╔](Images/TileSets/Ultima/Tiles/path/%E2%AE%9D%20%E2%95%94.png) | ![⮟ ╔](Images/TileSets/Ultima/Tiles/path/%E2%AE%9F%20%E2%95%94.png) | | | ![⮟ \]\[](Images/TileSets/Ultima/Tiles/bridge/%E2%AE%9F%20%5D%5B.png) |
| | ![⮝ ╗](Images/TileSets/Ultima/Tiles/path/%E2%AE%9D%20%E2%95%97.png) | ![⮟ ╗](Images/TileSets/Ultima/Tiles/path/%E2%AE%9F%20%E2%95%97.png) | | | ![⮟ ⎶](Images/TileSets/Ultima/Tiles/bridge/%E2%AE%9F%20%E2%8E%B6.png) |
