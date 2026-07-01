![](https://raw.githubusercontent.com/hackedpassword/Unciv-Assets/refs/heads/main/Images/Ultima%20V/basemod/west_of_dungeon_shame.png)

# UltimaV base mod
![](Images/TileSets/Ultima/Tiles/Citadel.png) Ultima V series **total conversion** mod ![](Images/TileSets/Ultima/Tiles/Citadel.png)

	Includes:
	  ✅ TileSet: UltimaV
	  ✅ UnitSet: UltimaV
	  ✅ Edges: UltimaV
	  ✅ Maps: Britannia Overworld
	  ✅ Skins: UltimaV, Minimal

# Info

A WIP repo for continuing development. No Unciv tags atm thus excluded from the mods menu - copy the url and d/l manually in the mods menu. When complete/ready, will package as a new mod.

Feel free to explore this repo - you've never seen modding techniques used within before! Examples will be highlighted later.

## WIP

The current focus is conversion of the Britannia map from G&K to pure UltimaV. Extensive use of terrainDecor brings forth a natural landscape cartography with stunning details.

Because the eventual gameplay will be quite different from Civ-style, all legacy resources have been ejected. Every available entity type will have a new role, including promotions and policies for example. CoeHarMod makes use of this type of modded system, to conceptualize the vision here.

Ongoing mapdev work continues to produce new and fun modding techniques that can be harnessed in the Unciv modding ecosystem. A few are downright amusing in their application.

![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/editor/menu/spacer01rgb.png)


# Updates

## New editor tech: Tile mesh overlays via Rivers

Why? Two reasons - in this mod, rivers are planned to be merged into new base terrain with river attributes thus no built-in rivers, and, rivers can be added later or last in map dev.

Most Unciv players will believe their map is on a hex grid, the truth being it's actually big square sprites with a staggered layout. Ultima mod gives the appearance of an 8-bit square layout via some sprite tricks. These tricks are confusing to regular Unciv players and modders, creating some aesthetic friction. So, for design and for clarity purposes, we can peel back the magic and see that Britannia map still exists in the hex grid realm of normal Unciv, we can see the magic of square tile design, and we can see full sized sprite tiles. These meshes can be added and deleted without impacting terrainFeatures, improvements, etc, by imposing itself as a fake river entity.

Any mod can use this tech, likely then reverting to "normal" rivers before publishing their map.

![](https://raw.githubusercontent.com/hackedpassword/Unciv-Assets/e6eb6f5a5703675a6a688d34b4619eeaf2fc5615/Images/Ultima%20V/editor_mesh.png)


## Map detailing progress - bgcolor made moddable

Load it up yourself to see mapping artistic capabilities on a whole new level. "Unciv can do that?!"

A requirement for technical visuals has been to change the root background color. This has been notoriously impossible to change, until now. Another Madmapper(tm) modhack. See:

![](https://raw.githubusercontent.com/hackedpassword/Unciv-Assets/refs/heads/main/Images/Ultima%20V/basemod/black_background.png)

The background is black!

To avoid overlap artifacts, base terrain is being re-shaped (you have to click it to see the alpha punchout):

![](https://raw.githubusercontent.com/hackedpassword/UltimaV-base/refs/heads/main/Images/TileSets/Ultima/Tiles/Grassland.png)

The issue becomes the alpha punchout exposes the base background color. For Ultima, our base background is black, not Unciv's dark blue. By changing the background color, we can use alpha exposures without artifacts.

Peruse [jsons/Skins/](jsons/Skins/) to see how this was accomplished.

## Let's Pique

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
