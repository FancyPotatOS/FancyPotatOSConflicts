
scoreboard objectives add fpconflict.conflict_map dummy

execute unless score setup fpconflict.conflict_map matches 1.. run function fpconflict:setup
