# sm-ot-ht-duration
SourceMod plugin which allows different durations for regulation and overtime halftime intermissions.

## Installation

This plugin has no external dependencies. You can download the pre-compiled .smx from [Releases](../../releases), or compile it yourself using either the local compiler or the [SourceMod Web Plugin Compiler](https://www.sourcemod.net/compiler.php). Once downloaded, place the file in `addons/sourcemod/plugins` and load it.

## Settings

**Note:** This plugin dynamically fetches `mp_maxrounds` in order to determine whether or not it is overtime. The example round numbers below are based on an assumed `mp_maxrounds 30`.

* `sm_halftime_duration_enabled` (default: `1`) - this convar enables or disables the plugin's function
* `sm_halftime_duration_regulation` (default: `15`) - this convar sets the halftime duration during regulation (e.g. at 15 rounds and 30 rounds)
* `sm_halftime_duration_overtime` (default: `15`) - this convar sets the halftime duration during overtime (e.g. past 30 rounds)

## Example

Using default settings above, with `sm_halftime_duration_overtime 5` in an MR3 overtime setting:

* round 15 (first halftime): duration will be 15 seconds
* round 30 (second halftime): duration will be 15 seconds
* round 33 (first halftime in overtime): duration will be 5 seconds
* etc
