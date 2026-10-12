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
- **Reagents — the open question is "how do reagents work?" [P]** (2026-10-12
  correction: never call a candidate a "spec" — anchoring kills alternatives).
  **Candidate A — boolean flags, not stockpiles:** the supply management of UV is
  pruned under the 4:1 consolidation rule. Each reagent is one canonical tile in
  the world (the Mandrake tile — there is exactly one). Occupy the adjacent tile
  (Z2's skill-gain mechanic) and the party gains the flag: *yes, you have
  Mandrake*. A spell's availability condition is then "has all required flags."
  The diabolical twist under consideration: **the Mandrake tile goes dormant for
  30 turns after harvest** — every party races the same single source on the same
  cooldown, which turns reagent gathering into contest terrain rather than
  bookkeeping. Flags would live as promotions on the party leader (availability
  conditions read them); the 30-turn lockout is a per-tile cooldown to prototype.
  The old `"Costs [X] [reagent]"` question is demoted to a fallback. Candidate A
  is one solution, not the design — alternatives stay on the table.
  See `spell-system/`.

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

## 4. Camps (the hole-up action — NOT fixed features)

- **Maps to:** Cities + city screen + events, heavily reinterpreted. **[P]**
- **Correction (2026-10-12):** in UV, camps only occur as hole-up actions — there
  are no fixed camps. Dungeons are fixed; camps are not. The two fictions must
  stay unmerged even where they share mechanics.
- The hole-up sequence in U5 is load-bearing design, not a throwaway rest stop:
  the party rests and heals; a member may be placed **on watch**; the camp **could
  be ambushed**; and **Lord British's apparition may appear** in the campfire to
  heal, impart level-ups, and (per the design read) assess the party's virtue.
  Every one of these has an Unciv-native mapping:
  - **Rest/heal** → city healing on the camp tile. **[P]**
  - **Watch** → an event on camping: if a watch is posted, borders expand 0→2,
    creating a protection area through city mechanics — Unciv's workable-land
    concept applied to the camp scenario. **[P]**
  - **Ambush** → the barbarian spawn pipeline. Camping in the wild risks a
    monster encounter; the engine already spawns barbarians at camps, so the
    ambush is native behavior, not a new system. This is the "monsters impede"
    directive made mechanical. **[P/V]**
  - **LB apparition** → the events system: probabilistic appearance on camping,
    healing, level-up grants, virtue assessment of the party lead. In the
    retelling frame (no chosen Avatar yet), the apparition's judgment *is* the
    worthiness instrument — which party it visits, and what it says, can respond
    to virtue standings. **[P]**
- Settling restricted to camps (Settler → "Make Camp" unit). Leaving camp *may*
  resolve as the camp dispersing (raze), persisting as a waypoint, or being
  overrun — probabilistic, never anchored on one outcome.
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
- **Moongates as shrine access [P]** (community-verified U5 fact): the Shrine of
  Spirituality sits in the Ethereal Void, reachable *only* through the Minoc
  moongate at double full moons. Moongates aren't just fast travel — phase-gated
  moongate travel is shrine access control. The turn-cycle mechanic above doubles
  as the lock on the eighth shrine.

## 6. Dungeons (fixed, canonical, quest-bearing — not camps)

- **Maps to:** Barbarian camps (spawn pipeline) + quest locations. **[P/V]**
- **Fiction/mechanics split (2026-10-12):** a dungeon is *not* a camp in UV's
  fiction — camps are hole-up actions (§4). Dungeons merely *borrow* the
  encampment spawn pipeline: `"Marks a barbarian camp"` (Improvement) is verified,
  and hand-placed map-authored camp-equivalents **do spawn normally [V]** — so the
  eight dungeons sit exactly where canon puts them (see §0 table) with the engine
  running monsters through them. Fixed dungeon geography is engine-supported;
  wandering dungeons would cost the Dragons' interest for nothing. Never describe
  this as "fixed camps" — that invents a UV feature that doesn't exist.
- **Dungeons are quest sites first, spawn points second [P]** (2026-10-11 redirect):
  each dungeon holds its Word of Power's prize — the shards of Mondain's Gem that
  kill Shadowlords live down there, as in U5. Delving is progression, not farming.
  (No rune hunt: U5 has no runes of entry — that's U4. Words of Power are learned
  from NPCs. U5 pruned U4's rune fetch, which is precedent for the anti-fetch
  instinct in the principles below.)
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

## 7. The quest spine (the pilgrimage — a contest, not a checklist)

UV *heralds adventure*: it opens with a summons, teaches the world by walking it,
and unfolds the quest in layers. The retelling keeps that shape, with the worthiness
contest as the new frame. **[P]** throughout — and under the standing design law:
**no fetch chains.** The Zelda-patterned "find three things, k!, now find three more
things" is the cliche this design refuses. Beats below are *phases of a race* —
order within a phase is the player's to resolve, rival parties and Blackthorn's
tyranny supply the interference, and replayability comes from the contest, never
from a longer checklist:

1. **Arrival.** Parties step through all moongates. No Avatar; the designation is
   the prize.
2. **The Pilgrimage.** The opening quest: visit the 8 cities of virtue. Visiting =
   occupying the adjacent tile (Z2's skill-gain mechanic — the world is huge, the
   route is the player's to resolve). Monsters impede; a rival party on a collision
   course may mean battle. **Progress tracking candidates:** culture unlocks per city
   visited (a "Pilgrim of Honesty" policy), promotion flags, or tech — culture is
   the current favorite since it already has an unlock-per-milestone shape. **[P/!]**
3. **The Turning.** When all eight are visited, an event fires and the Words of
   Power hunt opens — learned from NPCs in the cities, as in U5 (no rune hunt;
   U5 pruned U4's rune fetch, which is exactly the instinct being followed here).
4. **The Delving.** Fixed dungeons, Words spoken, shards of Mondain's Gem recovered —
   in whatever order the party dares.
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

**Ordered, from the designer (2026-10-12):**
1. **Replayability.** The game must be worth playing again — the contest, the
   routes, the interference.
2. **Accessibility.** Playable without a walkthrough open beside it.
3. **Don't be cliche.** The standing example of the failure mode: the
   fetch-chain — "find three things, k!, now find three more things." Quest
   structure must never be a checklist with extra steps. (U5 itself pruned U4's
   rune fetch; follow that instinct.)

**Working rules:**
1. **The retelling rule.** Same myth, new telling. Canon is the anchor (cities,
   dungeons, virtues, reagents, Words), the worthiness contest is the invention.
   Never chase another game's concepts (Dragon Warrior detour, 2026-10-11) when
   UV's own structure answers the question.
2. **Canonical fidelity is credibility.** The Ultima Dragons are watching; dungeons
   go where they're supposed to go. Fixed geography is also *cheaper* — the engine
   already supports hand-placed camp-equivalents.
3. **4:1 consolidation.** The map is 4:1 scale; gameplay consolidates to match.
   Prune the management layer, keep the decision. (Candidate solutions only —
   see next.)
4. **Candidates, never specs.** A theoretical feature is a *candidate solution*
   to an open question, never a "spec." Calling it a spec anchors the design and
   kills alternatives. The open question is the spec; the solution stays
   provisional until prototyped.
5. **Probabilistic design.** No element gets one fixed resolution. The camp *may*
   disperse; the spell *may* fizzle; the dungeon *may* be empty. Design the
   distribution, not the event.
6. **Bidirectional interlocks.** Every system should feed another: dungeon clears →
   virtue proofs (promotions), shrine visits → spell attunement, reagent flags →
   casting. If a system only points inward, it gets cut or merged.
7. **The AI is the adversary.** Every reinterpretation must be playtested against
   what the AI *evaluates* (yields, settle spots, promotions), not just what the
   player sees. Z2's food/gold lesson is the standing warning.
8. **Details over scale.** A 24-spell prototype with working cast chains beats a
   64-spell roster that doesn't cast.
9. **Research over training.** Community sources (Codex wiki, walkthroughs) carry
   the nuance training data doesn't. When a UV mechanic is in doubt, look it up —
   more research, more design coherence.
