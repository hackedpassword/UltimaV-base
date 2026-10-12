# UVB Lab Notebook

Prediction → result log. Everything uncertain gets a prediction first, then what
the source (or the game) said. Source checks are against Unciv master, 2026-10-11.

---

## 2026-10-11 — Spell system & spawn system prototyping

### P1 — Reagent costs: does `Costs [1] [Garlic]` charge on promotion pick?
- **Prediction:** picking the `Cast X` promo deducts 1 Garlic from the stockpile.
- **Found:** template verified — `Costs [amount] [stockpiledResource]`
  (UniqueType.kt L239, Unit target). But in source, `CostsResources` is consumed in
  construction/upgrade paths; nothing shows it firing on *promotion pick*.
- **Result:** NOT VERIFIED. In-game test required.
- **Fallback (Z2-proven):** `"Consumes [1] [Garlic]"` — but note what source says:
  `MapUnit.getResourceRequirementsPerTurn()` documents it as **per-turn** drain
  ("Gets *per turn* resource requirements"). Z2's rocket-aluminum was a standing
  tax, not a per-shot cost. Design spells accordingly until P1 resolves.

### P2 — One-shot spells via 1-turn statuses: does expiry clean up the effect?
- **Prediction:** granting `"[Effect] status for [1] turn(s)"` applies the effect,
  then it vanishes with no lose-triggerable needed.
- **Found:** `OneTimeUnitGainStatus` verified (L980); `ConditionalUnitWithPromotion`
  explicitly "also applies to units with temporary status."
- **Result:** VERIFIED in source. In-game feel (does the status show sanely in UI?)
  still needs a playtest.

### P3 — `<for all movement> <once>` as triggerable conditionals
- **Prediction:** these work in `<...>` position on gain-promotion triggerables.
- **Found:** both are `UniqueTarget.UnitActionModifier` (L597, L610) — NOT in the
  `Conditional` target list. Yet Z2 shipped exactly this usage and the thrust
  grants fired (Z2 issue #4 is about *timing*, not failure).
- **Result:** PROVEN IN PRACTICE, unexplained in source. The engine is more
  permissive than its target lists suggest — file under "the gap," treat as
  load-bearing but re-verify if it ever breaks.

### P4 — Invisible spawner safety: will anything attack or capture it?
- **Prediction:** `"Invisible to others"` + `"Uncapturable"` makes the Wisp
  Spawner untouchable while it roams and plants dungeons.
- **Found:** all three uniques verified (L549, L485, L563). AI-vs-invisible
  behavior is not determinable from source.
- **Result:** NEEDS IN-GAME TEST. Watch for: AI pathing around it, reveal
  mechanics, whether the barbarian AI moves it sensibly at all.

### P5 — Does a unit-built Dungeon join the barb-camp spawn pipeline?
- **Prediction:** `"Marks a barbarian camp"` on a buildable improvement makes new
  camps able to appear as Dungeons.
- **Found:** unique verified (L728) with doc: "When several barbarian camp
  improvements are available, each new camp chooses one randomly."
- **Result:** VERIFIED in source as designed; in-game confirmation still wanted
  (map-gen vs. runtime camp creation may differ).

### F1 — Revolt timing: not a unique, but a moddable constant [CORRECTED 2026-10-11]
- **Found:** zero "evolt" matches in UniqueType.kt — no revolt-timing *unique*
  exists. BUT `ModConstants.baseTurnsUntilRevolt = 4` is real
  (ModConstants.kt L109), settable via ModOptions.json `constants`, exactly
  like `maxRiverLength`. The earlier "not a thing" claim was half-wrong:
  Design.md's plan to set it to 1–2 IS implementable.
- **Also:** the vanilla revolt gate is the editable conditional on
  `"Rebel units may spawn <when below [-20] [Happiness]>"` — threshold is
  tunable there. Bonus tool: `OneTimeRebel` ("A [unit] rebels", Triggerable)
  is a scriptable monster-invasion button from policies/buildings/events.
- **Result:** CORRECTED. Cadence knob exists (ModOptions constants);
  threshold knob exists (happiness conditional). Both settable, then
  measured in-game.

### F2 — Cities can found on natural wonders [verified earlier]
- **Found:** `Tile.canBeSettled()` blocks only water, impassible, city-distance,
  foreign territory. No wonder exclusion.
- **Result:** VERIFIED. Open: does the wonder survive founding; do adjacency
  uniques see it.

### F3 — Migration chains work (Z2 precedent, re-confirmed)
- **Found:** Z2's Training II: gains successor, loses predecessor, "GUI menu
  button noise removed, correctly." Engine tolerates tree rewriting via
  triggerables; it does NOT tolerate promos vanishing from the *ruleset*
  mid-game (Unciv #11481 NPE).
- **Result:** PROVEN IN PRACTICE. Rule: mutate *units'* promos freely, never the
  ruleset's promo list mid-save.

---

## Test queue (in-game, when there's a build to poke at)

1. P1 reagent charging — pick `Cast An Nox`, watch the Garlic stockpile.
2. P4 spawner behavior — 20 turns, observe.
3. Dungeon-clear → proof interlock — no clean triggerable found; design first,
   then test.
4. P2 status UI — does a 1-turn effect status read clearly to the player?
