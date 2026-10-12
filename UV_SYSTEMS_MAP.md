# UV → Unciv Systems Map

Mapping Ultima V concepts onto Unciv's native systems for the UltimaV-base total conversion.
Every entry below is a **reasoned proposal, not fact** — each needs prototyping before it becomes design.

Grounding: `docs/Design.md` (repo), Z2's proven modhack patterns (`hackedpassword/Z2`:
`HybridTileTech.md`, `jsons/UnitPromotions.json`, `jsons/Units.json`, `jsons/Terrains.json`),
and Unciv master source verified 2026-10-11.

Conventions: **[P]** = proposal. **[Z]** = proven in Z2. **[V]** = verified in Unciv source.
**[!]** = known risk / needs in-game test.

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
- **Reagents** (Black Pearl, Blood Moss, Garlic, Ginseng, Mandrake, Nightshade,
  Spider Silk, Sulphurous Ash) → TileResources, consumed via
  `"Costs [1] [Garlic]"` on cast promos. **[!]** — `CostsResources` on a *promotion*
  is not confirmed to charge on pick (source shows it in construction/upgrade paths).
  Fallback: `"Consumes [1] [Garlic]"` = per-turn drain while held (Z2-proven usage).
  Needs in-game test. See `spell-system/`.

## 2. Virtues (the 8: Honesty, Compassion, Valor, Justice, Sacrifice, Honor, Spirituality, Humility)

- **Maps to:** Religion, refactored (per Design.md). **[P]**
- Beliefs.json → the virtues as follower/founder beliefs; religious units → virtue
  seekers/pilgrims; shrines → holy-site equivalents.
- **Bidirectional interlock [P]:** virtue *proofs* are promotions granted by
  location-gated triggerables (Z2's town pattern): visiting the Shrine of Valor with
  the right conditions grants "Proof of Valor." The religion system produces the
  shrines; the promotion system consumes the visits. Neither system "owns" the quest.

## 3. Parties (civilizations → adventuring parties, several competing)

- **Maps to:** Nations.json. **[P]** (Design.md direction)
- Leader = the Avatar; uniques = party-wide traits. Multiple avatar parties =
  multiple "civs" in the same game — the Ultima Dragons' excitement is structurally
  sound: Unciv already supports N competing civs.
- Party *members* → units (the Avatar as a hero unit, companions as units).
- **Inventory** → promotions on party members (Z2's Magic Key pattern: aluminum
  reskinned as magic containers) and/or carried "item" units (bag-of-holding pattern).

## 4. Camps (cities → hole-up / party-management events)

- **Maps to:** Cities + city screen, heavily reinterpreted. **[P]**
- The city screen becomes the camp interface: rest, heal, resupply, manage the party.
  **Probabilistic, not fixed:** leaving camp *may* resolve as the camp dispersing
  (raze), persisting as a waypoint, or being overrun — never anchor on one outcome.
- Settling restricted to camps (Settler → "Make Camp" unit). City-states rep the
  cities of virtue, keeps, etc. (Design.md).
- **Temporary city-interface** (Design.md): a placeholder city adjacent to a real
  location for "entering" it (buying supplies), razed on departure. **[P]**

## 5. Moongates (fast travel)

- **Maps to:** Paradrop on an 8-turn cycle. **[V]** — `"May Paradrop to [tileFilter]
  tiles up to [positiveAmount] tiles away"` (Unit) + `"every [positiveAmount] turns"`
  (Conditional, engine evaluates `turns % N == 0`) gives a Paradrop button live only
  on turns 8, 16, 24… — the div/8 moongate cycle from Design.md, directly implementable.
- Moongate tiles → improvements or terrain features the paradrop targets.

## 6. Dungeons + monster spawning (the only planned AI element)

- **Maps to:** Barbarian camps + barbarian civ. **[P/V]**
- `"Marks a barbarian camp"` (Improvement) is verified — the whole encampment
  pipeline (spawning, clearing gold) keys off it, and with several camp-equivalents
  each new camp picks randomly.
- **Dungeons and camps merge [P]:** the Dungeon *is* a camp-equivalent improvement.
  One mechanic, two fictions — dungeon delving and barb-camp clearing are the same
  pipeline. See `spawn-system/`.
- **Invisible mobile spawners [P]:** Civilian-type unit, `"Invisible to others"` +
  `"Uncapturable"` + `"Can pass through impassable tiles"` + `"Can build [Dungeon]
  improvements on tiles"`. Roaming spawn points. **[!]** AI-vs-invisible behavior
  needs in-game testing.
- **Roster curation [V]:** `"Never appears as a Barbarian unit"` excludes party/
  Avatar units from the spawn table; everything else is spawnable.
- **Revolts-as-spawners** (Design.md): `"Rebel units may spawn"` (Global) is verified,
  but **there is no revolt-timing unique** — zero "evolt" matches in UniqueType.kt.
  The `baseTurnsUntilRevolt` knob in Design.md does not exist; cadence must be
  measured empirically. **[V]**

## 7. Shrines & virtue proofs (quest spine)

- **Maps to:** Natural Wonders or Improvements + location-gated promotion grants. **[P]**
- Verified: `Tile.canBeSettled()` has **no natural-wonder exclusion** — a city *can*
  be founded on a wonder tile (only water/impassible/distance/territory block).
  Open: does the wonder survive founding, and do adjacency uniques see it. **[V/!]**
- The Avatar's game flow (visit cities of virtue → proofs → shrines, per Design.md)
  is a chain of location-gated grants — Z2's town-technique pattern scaled up.

## 8. Combat, movement, gold, food

- Mostly standard Unciv; bent where UV demands (spell-effect promos, hybrid tiles).
- **Z2 lesson carried forward:** yields conditional on `<in [Friendly Land] tiles>`
  cleared visual chaff but broke the AI's tile evaluation — neither you nor yairm210
  resolved it. Any conditional-yield trick in UVB inherits this adversary. **[Z/!]**

## 9. Systems deliberately left quiet (for now)

- **Tech tree:** candidate for "lore/quest progression" but unmapped — do not force it.
- **Espionage:** spies → thieves/stealth is the obvious fiction; unprototyped.
- **Victory types:** 4.22.0 added uniques on victories — a virtue-quest victory
  (all 8 proofs) is now expressible. **[V]** Worth a prototype later.

---

## Cross-cutting principles

1. **Probabilistic design.** No element gets one fixed resolution. The camp *may*
   disperse; the spell *may* fizzle; the dungeon *may* be empty. Design the
   distribution, not the event.
2. **Bidirectional interlocks.** Every system should feed another: dungeon clears →
   virtue proofs (promotions), shrine visits → spell attunement, reagents →
   economy → casting. If a system only points inward, it gets cut or merged.
3. **The AI is the adversary.** Every reinterpretation must be playtested against
   what the AI *evaluates* (yields, settle spots, promotions), not just what the
   player sees. Z2's food/gold lesson is the standing warning.
4. **Details over scale.** A 24-spell prototype with working cast chains beats a
   64-spell roster that doesn't cast.
