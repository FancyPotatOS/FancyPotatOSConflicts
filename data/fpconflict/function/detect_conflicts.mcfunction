
# Reset all values of conflict map but return the setup values to original
scoreboard objectives remove fpconflict.conflict_map
scoreboard objectives add fpconflict.conflict_map dummy
scoreboard players set setup fpconflict.conflict_map 2

scoreboard players set checkable_datapacks fpconflict.conflict_map 0

function #fpconflict:fp_conflict_precheck

function #fpconflict:fp_conflict_check
