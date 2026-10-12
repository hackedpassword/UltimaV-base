# Spawn system — prototype notes

The only planned AI element: monster spawning. Design decision: **dungeons and
barbarian camps are the same mechanic.** A dungeon *is* a camp-equivalent
improvement, so "delving a dungeon" and "clearing a barb camp" run through one
pipeline — spawning, notifications, clearing gold. One mechanic, two fictions,
zero new AI behavior for the engine to misunderstand.

## Components

**Dungeon / Monster Lair** (`Improvements.json`) — both carry `"Marks a
barbarian camp"` (verified, UniqueType.kt L728). The engine picks randomly among
camp-equivalents for each new camp, so dungeons and lairs mix naturally.

**Wisp Spawner** (`Units.json`) — the invisible mobile spawn point. Civilian-type,
`"Invisible to others"` + `"Uncapturable"` + `"Can pass through impassable
tiles"` (all verified), with `"Can build [Dungeon] improvements on tiles"`.
It roams and plants dungeons where the party isn't looking. **[NEEDS TEST]** —
how the AI treats invisible units (does anything try to attack/reveal it? does
the barbarian AI move it sensibly?) is unknowable from source; this is an
in-game question.

**Roster curation** — `"Never appears as a Barbarian unit"` (verified, L578) is
an exclusion list: party/Avatar/boss units carry it, everything else may spawn.
The spawn table is defined by what you *exclude*, which inverts the usual design
burden — you don't curate monsters in, you curate the party out.

**Boss sketch** — `Dungeon Boss` + `Dread Aura` promotion (`UnitPromotions.json`):
`"[30]% Strength bonus for [All] units within [2] tiles"`, gated by the
availability hack so only bosses take it. Z2's Shield pattern, verbatim.

## Bidirectional interlocks (proposals)

- **Dungeon clear → virtue proof:** clearing is the vanilla encampment pipeline
  (gold via `"When conquering an encampment, earn [amount] Gold..."`). A *proof*
  on top of that needs a clear-detection trigger — no clean unit triggerable was
  found in source. Candidate: location-gated grant when the Avatar *enters* the
  dungeon tile post-clear is indistinguishable from entering pre-clear. **Open
  design question** — see LAB_NOTEBOOK.md.
- **Revolts → spawns** (Design.md): `"Rebel units may spawn"` is verified, but no
  revolt-timing unique exists. If revolts join the spawn design, cadence must be
  measured, not set.

## What the AI sees

The standing warning from Z2's food/gold lesson applies: the AI evaluates what
it can see. Invisible spawners are invisible to the AI too — which is the point
(they're ambience, not tactics), but the roaming monsters they plant dungeons
for *are* standard barbarians, so the AI's barbarian handling applies unchanged.
The reinterpretation stays inside behavior the engine already understands.
