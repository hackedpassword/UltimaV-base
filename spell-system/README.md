# Spell system — prototype notes

`UnitPromotions.json` in this folder is a structural prototype of Ultima V's
8 Circles of Magic, built entirely from Z2's proven dynamic-promotion patterns.
The *patterns* are the deliverable; the spell roster is a proposal.

## Architecture

**8 branches = 8 circles.** Columns 1–8 in the promotion tree. Each circle has:

1. **An attunement gate** (`Circle N Attuned`) — granted by visiting that circle's
   shrine: `"This Unit gains the [Circle 1 Attuned] promotion <in [Shrine of
   Compassion] tiles> <for all movement> <once>"` on the `Arcane Seeker` base promo.
   (Z2's Jump → Upward Thrust town pattern, verbatim.)
2. **Cast promos** — action buttons in Z2's Overload style. Each is pickable only
   with its attunement (`"Only available <for units with [Circle N Attuned]>"`),
   costs reagents, and grants a **1-turn status** carrying the effect:
   `"This Unit gains the [An Nox Effect] status for [1] turn(s)"`.
3. **Effect promos** — the actual mechanical uniques. The status expiry *is* the
   cleanup: no lose-triggerable needed, no tree surgery per cast.

This is a deliberate improvement on Z2's cast pattern: Z2's Self Destruct consumed
the *unit*; here the *status duration* consumes the effect. One-shot spells without
tree mutation.

## The four Z2 patterns, mapped

| Z2 pattern | UVB use |
|---|---|
| Availability hack (`Only available <for units with [X]>`) | Spell visibility gating per circle |
| Migration chains (gain successor, lose predecessor) | `Mend Wounds` → `Restore Vigor` demo; spell upgrade paths |
| Location-gated grants (towns → techniques) | Shrines → circle attunements; later: shrines → virtue proofs |
| Promos as action buttons (Overload → Self Destruct) | `Cast X` promos as the spellcasting UI |

## Branch structure proposal

- **Circle 1:** fully worked (8 spells) as the exemplar.
- **Circle 2:** migration-chain demo.
- **Circles 3–8:** attunement gates + one iconic stub each. Full 64-spell roster
  is future work — details over scale.
- **Policies layer (per Design.md):** policy branches could gate *circle access by
  level* while promotions remain the spells. Unprototyped; the interlock is the
  interesting bit.

## Verification status

Every unique string checked against Unciv master `UniqueType.kt` / `Conditionals.kt`
2026-10-11. The single open item: **`"Costs [1] [Garlic]"`** — the template
(`Costs [amount] [stockpiledResource]`) is verified, but whether it charges the
stockpile *on promotion pick* is not confirmed in source. Fallback, Z2-proven:
`"Consumes [1] [Garlic]"` (per-turn drain while held). See LAB_NOTEBOOK.md.

`unitTypes: ["Avatar", "Companion"]` are placeholders — they must exist in
`UnitTypes.json`/`Units.json`. Shrine tile names (`Shrine of Compassion`, …) must
exist as improvements/terrain. Reagents must be defined as stockpiled resources
in `TileResources.json`.
