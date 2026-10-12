# UV → Unciv Systems Map

Mapping Ultima V concepts onto Unciv's native systems for the UltimaV-base total conversion.
Every entry below is a **reasoned proposal, not fact** — each needs prototyping before it becomes design.

Grounding: `docs/Design.md` (repo), Z2's proven modhack patterns (`hackedpassword/Z2`:
`HybridTileTech.md`, `jsons/UnitPromotions.json`, `jsons/Units.json`, `jsons/Terrains.json`),
Unciv master source verified 2026-10-11, and Ultima V canon (walkthroughs + Codex wiki,
verified 2026-10-11).

Conventions: **[P]** = proposal. **[Z]** = proven in Z2. **[V]** = verified in Unciv source.
**[!]** = known risk / needs in-game test.

---

## 0. The retelling premise (design frame, 2026-10-11 redirect)

UVB is **a new iteration of Ultima V, not a sequel** — the Spider-Man rule: same
myth, new telling. Britannia under Blackthorn's virtue-twisted tyranny; the three
Shadowlords (Falsehood, Hatred, Cowardice — antitheses of Truth, Love, Courage)
loose; Lord British lost in the Underworld. But there is **no chosen Avatar yet**:
parties arrive through *all* the moongates at once, and the adventure determines
who is worthy of the designation. Competing avatar parties aren't a gimmick on top
of the design — they *are* the design, and the reason the Ultima Dragons took it
seriously. Everything below serves that frame: a pilgrimage anyone can walk, that
only one party completes first.

Canonical anchors (non-negotiable while the Dragons are watching):

| Virtue | City | Mantra | Dungeon | Word of Power |
|---|---|---|---|---|
| Honesty | Moonglow | Ahm | Deceit | FALLAX |
| Compassion | Britain | Mu | Despise | VILIS |
| Valor | Jhelom | Ra | Destard | INOPIA |
| Justice | Yew | Beh | Wrong | MALUM |
| Sacrifice | Minoc | Cah | Covetous | AVIDUS |
| Honor | Trinsic | Summ | Shame | INFAMA |
| Spirituality | Skara Brae | Om | Hythloth | IGNAVUS |
| Humility | New Magincia | Lumm | Doom | VERAMOCOR |

Reagents (8): Black Pearl, Blood Moss, Garlic, Ginseng, Mandrake Root, Nightshade,
Spider Silk, Sulphurous Ash. Shadowlord kills need the shards of Mondain's Gem used
at the flames of Truth (Lycaeum), Love (Empath Abbey), Courage (Serpent's Hold).

---

## 1. Spell system (8 Circles of Magic)

- **Maps to:** Promotions (primary), Policies (level-gating layer). **[P]**
- **Z2 precedent [Z]:** the entire dynamic-promotion toolkit — availability hack
  (`"Only available <for units with [X]>"`), migration chains (pick grants successor,
  loses predecessor), location-gated grants (towns granting techniques), promos as
  action buttons (Overload → Self Destruct).
- **Design.md tension to resolve:** the notes say "Policies become spells available per
  level," but Z2's *proven* machinery is promotions. Proposal: **policies gate access,
  promotions are the spells.** Adopting a policy branch = attuning to a circle (level
  gating, per Design.md); the spells themselves live in the promotion tree where the
  dynamic patterns work. The two systems interlock instead of competing. **[P]**
- **Reagents → boolean flags, not stockpiles [P]** (2026-10-11 redirect): the supply
  management of UV is pruned under the 4:1 consolidation rule. Each reagent is one
  canonical tile in the world (the Mandrake tile — there is exactly one). Occupy the
  adjacent tile (Z2's skill-gain mechanic) and the party gains the flag: *yes, you
  have Mandrake*. A spell's availability condition is then "has all required flags."
  The diabolical twist the design asks for: **the Mandrake tile goes dormant for 30
  turns after harvest** — every party races the same single source on the same
  cooldown. Flags live as promotions on the party leader (availability conditions
  read them); the 30-turn lockout is a per-tile cooldown to prototype.
  The old `"Costs [X] [reagent]"` question is demoted to a fallback — flags are the
  direction. See `spell-system/`.

## 2. Virtues (the 8 — the core of the game, not a subsystem)

- **Maps to:** Religion, refactored (per Design.md) + events. **[P]**
- Beliefs.json → the virtues as the religion's spine; religious units →
  virtue seekers/pilgrims; shrines → holy-site equivalents; the events system
  carries virtue judgments (Blackthorn's twisted virtue-laws are event fuel: the
  tyranny is *content*, not backdrop).
- **Bidirectional interlock [P]:** virtue *proofs* are promotions granted by
  location-gated triggerables (Z2's town pattern): visiting the Shrine of Valor with
  the right conditions grants "Proof of Valor." The religion system produces the
  shrines; the promotion system consumes the visits. Neither system "owns" the quest.
- The virtue table in §0 is the design's load-bearing canon — cities, dungeons,
  mantras, and Words of Power all key off it.

## 3. Parties (civilizations → adventuring parties, several competing)

- **Maps to:** Nations.json. **[P]** (Design.md direction)
- Leader = the Avatar-candidate; uniques = party-wide traits. Multiple avatar parties =
  multiple "civs" in the same game — the Ultima Dragons' excitement is structurally
  sound: Unciv already supports N competing civs.
- Party *members* → units (the candidate as a hero unit, companions as units).
- **Inventory** → promotions on party members (Z2's Magic Key pattern: aluminum
  reskinned as magic containers) and/or carried "item" units (bag-of-holding pattern).

## 4. Camps (cities → hole-up / party-management events)

- **Maps to:** Cities + city screen, heavily reinterpreted. **[P]**
- The city screen becomes the camp interface: rest, heal, resupply, manage the party.
  **Probabilistic, not fixed:** leaving camp *may* resolve as the camp dispersing
  (raze), persisting as a waypoint, or being overrun — never anchor on one outcome.
- Settling restricted to camps (Settler → "Make Camp" unit). City-states rep the
  keeps and minor settlements (Design.md).
- **Temporary city-interface** (Design.md): a placeholder city adjacent to a real
  location for "entering" it (buying supplies), razed on departure. **[P]**

## 5. Moongates (arrival + fast travel)

- **Maps to:** Starting positions + Paradrop on an 8-turn cycle. **[P/V]**
- **Arrival [P]:** every party begins the game at a moongate tile — the retelling's
  opening beat is literal. Moongate tiles → improvements or terrain features.
- **Travel [V]:** `"May Paradrop to [tileFilter] tiles up to [positiveAmount] tiles
  away"` (Unit) + `"every [positiveAmount] turns"` (Conditional, engine evaluates
  `turns % N == 0`) gives a Paradrop button live only on turns 8, 16, 24… — the
  div/8 moongate cycle from Design.md, directly implementable.

## 6. Dungeons (fixed, canonical, quest-bearing)

- **Maps to:** Barbarian camps (spawn pipeline) + quest locations. **[P/V]**
- `"Marks a barbarian camp"` (Improvement) is verified — the whole encampment
  pipeline (spawning, clearing gold) keys off it, and hand-placed map-authored camps
  **do spawn normally [V]** — so the eight dungeons sit exactly where canon puts
  them (see §0 table) and the engine still runs monsters through them. Fixed
  geography is engine-supported; wandering dungeons would cost the Dragons'
  interest for nothing.
- **Dungeons are quest sites first, spawn points second [P]** (2026-10-11 redirect):
  each dungeon holds its Word of Power's prize — the shards of Mondain's Gem that
  kill Shadowlords live down there, as in U5. Delving is progression, not farming.
- **Monsters impede, they are not the hunt [P]:** roaming barbarians are obstacles
  on the pilgrimage routes, not a gameplay loop. Monster *hunting* is out of scope.
  The invisible mobile spawner concept is **shelved** — it served a hunting game
  this isn't.
- **Roster curation [V]:** `"Never appears as a Barbarian unit"` excludes party/
  Avatar units from the spawn table; everything else is spawnable.
- **Revolts-as-spawners** (Design.md): `"Rebel units may spawn"` (Global) is verified;
  cadence knob is `ModConstants.baseTurnsUntilRevolt = 4` via ModOptions constants
  (corrected 2026-10-11 — the earlier "no knob" claim was half-wrong). Threshold is
  the editable `<when below [-20] [Happiness]>` conditional.
- Engine truth constraining dungeon design: placement is engine-controlled (50% skip
  roll, fog/land/no-resource, ≥7 tiles from a live camp, ≥4 from a capital); spawn
  countdown 8–12 turns accelerating; **no restock** — a cleared camp "haunts" (blocks
  spawns within 4 tiles for 15 turns), then re-enters random placement. The design
  primitive is the 15-turn quiet period. Bonus tool: `OneTimeRebel` ("A [unit]
  rebels", Triggerable) — scriptable monster-invasion button.

## 7. The quest spine (the pilgrimage)

UV *heralds adventure*: it opens with a summons, teaches the world by walking it,
and unfolds the quest in layers. The retelling keeps that shape, with the worthiness
contest as the new frame. **[P]** throughout:

1. **Arrival.** Parties step through all moongates. No Avatar; the designation is
   the prize.
2. **The Pilgrimage.** First quest: visit each of the 8 cities of virtue. Visiting =
   occupying the adjacent tile (Z2's skill-gain mechanic — the world is huge, the
   route is the player's to resolve). Monsters impede; a rival party on a collision
   course may mean battle. **Progress tracking candidates:** culture unlocks per city
   visited (a "Pilgrim of Honesty" policy), promotion flags, or tech — culture is
   the current favorite since it already has an unlock-per-milestone shape. **[P/!]**
3. **The Turning.** When all eight are visited, an event fires and the next quest
   assigns: gather the Words of Power (learned in the cities, as in U5) and reopen
   the dungeons.
4. **The Delving.** Fixed dungeons, Words spoken, shards of Mondain's Gem recovered.
5. **The Shadowlords.** Shards used at the flames of Truth, Love, Courage
   (Lycaeum, Empath Abbey, Serpent's Hold) — Falsehood, Hatred, Cowardice destroyed.
6. **The Descent.** Doom, in the Underworld; Lord British rescued; the worthiest
   party named Avatar.

- Shrines & proofs: `Tile.canBeSettled()` has **no natural-wonder exclusion** — a
  city *can* be founded on a wonder tile (only water/impassible/distance/territory
  block). Open: does the wonder survive founding, and do adjacency uniques see it.
  **[V/!]**

## 8. Combat, movement, gold, food

- Mostly standard Unciv; bent where UV demands (spell-effect promos, hybrid tiles).
- **Z2 lesson carried forward:** yields conditional on `<in [Friendly Land] tiles>`
  cleared visual chaff but broke the AI's tile evaluation — neither you nor yairm210
  resolved it. Any conditional-yield trick in UVB inherits this adversary. **[Z/!]**

## 9. Systems deliberately left quiet (for now)

- **Tech tree:** candidate for "lore/quest progression" but unmapped — do not force it.
- **Espionage:** spies → thieves/stealth is the obvious fiction; unprototyped.
- **Victory types:** 4.22.0 added uniques on victories — a virtue-quest victory
  (all 8 proofs, Shadowlords destroyed, LB rescued) is now expressible. **[V]**
  Worth a prototype once the pilgrimage chain works.

---

## Cross-cutting principles

1. **The retelling rule.** Same myth, new telling. Canon is the anchor (cities,
   dungeons, virtues, reagents, Words), the worthiness contest is the invention.
   Never chase another game's concepts (Dragon Warrior detour, 2026-10-11) when
   UV's own structure answers the question.
2. **Canonical fidelity is credibility.** The Ultima Dragons are watching; dungeons
   go where they're supposed to go. Fixed geography is also *cheaper* — the engine
   already supports hand-placed camps.
3. **4:1 consolidation.** The map is 4:1 scale; gameplay consolidates to match.
   Reagents become flags, not stockpiles. Prune the management layer, keep the
   decision.
4. **Probabilistic design.** No element gets one fixed resolution. The camp *may*
   disperse; the spell *may* fizzle; the dungeon *may* be empty. Design the
   distribution, not the event.
5. **Bidirectional interlocks.** Every system should feed another: dungeon clears →
   virtue proofs (promotions), shrine visits → spell attunement, reagent flags →
   casting. If a system only points inward, it gets cut or merged.
6. **The AI is the adversary.** Every reinterpretation must be playtested against
   what the AI *evaluates* (yields, settle spots, promotions), not just what the
   player sees. Z2's food/gold lesson is the standing warning.
7. **Details over scale.** A 24-spell prototype with working cast chains beats a
   64-spell roster that doesn't cast.
