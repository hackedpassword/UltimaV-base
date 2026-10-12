# Spawn system — prototype notes (redirected 2026-10-11)

The only planned AI element: monster spawning. **Redirect:** monsters impede the
pilgrimage; they are not a gameplay loop. Monster *hunting* is out of scope, and
the invisible mobile spawner concept is shelved with it (it served a hunting game
this isn't). What remains is the dungeon-as-fixed-quest-site pipeline.

## Components

**Dungeon** (`Improvements.json`) — carries `"Marks a barbarian camp"` (verified,
UniqueType.kt L728). The eight dungeons sit at their canonical U5 locations
(virtue/dungeon/Word table in UV_SYSTEMS_MAP.md §0); hand-placed map-authored
dungeon improvements **spawn normally** per source, so fixed geography costs
nothing and keeps the Ultima Dragons' trust. Each dungeon is a quest site first
(Words of Power, Mondain's shards), a spawn point second — and fictionally a
dungeon is *not* a camp (camps are hole-up actions; see UV_SYSTEMS_MAP.md §4).

**Roster curation** — `"Never appears as a Barbarian unit"` (verified, L578) is
an exclusion list: party/Avatar/boss units carry it, everything else may spawn.
The spawn table is defined by what you *exclude* — you don't curate monsters in,
you curate the party out.

**Boss sketch** — `Dungeon Boss` + `Dread Aura` promotion (`UnitPromotions.json`):
`"[30]% Strength bonus for [All] units within [2] tiles"`, gated by the
availability hack so only bosses take it. Z2's Shield pattern, verbatim. Bosses
read as Shadowlord lieutenants or dungeon guardians — obstacles on the delve,
not hunt targets.

## Shelved

**Wisp Spawner** (`Units.json`) — the invisible mobile spawn point. Mechanically
sound (all uniques verified) but answers a design question no longer asked.
Kept in the file as a documented dead end, not a plan.

## Bidirectional interlocks (proposals)

- **Dungeon clear → virtue proof:** clearing is the vanilla encampment pipeline
  (gold via `"When conquering an encampment, earn [amount] Gold..."`). A *proof*
  on top of that needs a clear-detection trigger — no clean unit triggerable was
  found in source. **Open design question** — see LAB_NOTEBOOK.md D5.
- **Revolts → spawns** (Design.md): `"Rebel units may spawn"` is verified;
  cadence knob is `ModConstants.baseTurnsUntilRevolt = 4` via ModOptions constants
  (corrected 2026-10-11). Threshold is the editable `<when below [-20]
  [Happiness]>` conditional.

## What the AI sees

The standing warning from Z2's food/gold lesson applies: the AI evaluates what
it can see. Roaming barbarians are standard barbarians, so the AI's barbarian
handling applies unchanged — the reinterpretation stays inside behavior the
engine already understands. Fixed dungeons are *easier* for the AI than wandering
ones: no novel placement logic to misunderstand.

## Engine truth constraining this design

- Placement is engine-controlled: 50% skip roll, fog-of-war land, no resource,
  ≥7 tiles from a live camp, ≥4 from a capital. No unique tunes cadence.
- Spawn countdown 8–12 turns per camp, accelerating as it spawns more.
- **No restock:** a cleared camp "haunts" (blocks spawns within 4 tiles for 15
  turns), then the tile re-enters random placement. The design primitive is the
  15-turn quiet period, not a restock timer.
- `OneTimeRebel` ("A [unit] rebels", Triggerable) is a scriptable
  monster-invasion button for policies/buildings/events.
