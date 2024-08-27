
## Documentation to check for conflicts:

- How to run
  - Simple run the command `function fpconflict:detect_conflicts`
  - Any conflicts should be displayed in the chat

- Values to remember
 
  - `fpconflict.conflict_map`: Scoreboard that everything is saved to

- Tags for functions:

  - `#fpconflict:fp_conflict_precheck`
    - This is where you add your static values (described later) to the conflict map scoreboard

  - `#fpconflict:fp_conflict_check`
    - This is where you check the static values in the conflict map scoreboard and print if there is one

- Naming Format for Conflict Map
  - version.lowercasename
  - gamerule.lowercasename
  - entity.functionality.namespace.name
  - item.functionality.namespace.item
    - Example: item.functionality.minecraft.disc
  - Basic datapacks stucture
    - (Example: Most common conflicts)
      - advancement.namespace.dir...dir.name
      - loot_table.namespace.dir...dir.name
      - recipe.namespace.dir...dir.name
      - structure.namespace.dir...dir.name
      - tags.namespace.type.dir...dir.name
        
    - Example
      - recipe.minecraft.acacia_stairs
      

- Examples
  - Datapack replaces Nether generation:
    - scoreboard players add dimension.minecraft.the_nether fpconflict.conflict_map 1
    
  - Datapack replaces Ancient City entrance generation:
    - scoreboard players add structures.minecraft.ancient_city.city.entrance fpconflict.conflict_map 1

  - Datapack replaces zombie loot table:
    - scoreboard players add loot_table.minecraft.entities.zombie fpconflict.conflict_map 1

  - Datapack replaces 'climbable' block tag:
    - scoreboard players add tags.minecraft.block.climbable fpconflict.conflict_map 1

  - Datapack overhauls goat horns:
    - scoreboard players add item.functionality.minecraft.goat_horn fpconflict.conflict_map 1

  - Examples
    - Detecting if there is a zombie loot table conflict
  
      - #fpconflict:fp_conflict_precheck
        - `scoreboard players add loot_table.minecraft.entities.zombie fpconflict.conflict_map 1`

      - #fpconflict:fp_conflict_check
        - `execute if score loot_table.minecraft.entities.zombie fpconflict.conflict_map matches 2.. run tellraw @a ["",{"text":"[Conflict]","color":"red"}," - ",{"text":"DATAPACK_NAME ","obfuscated":false,"color":"blue"},"(",{"text":"loot_table.minecraft.entities.zombie","italic":true,"color":"dark_aqua"},")"]`
        - (Note that the score must be above 1 to be a conflict because this own datapack adds 1 itself)


    - Detecting if there is a conflict between two nether modifying datapacks

      - #fpconflict:fp_conflict_precheck
        - `scoreboard players add dimension.minecraft.the_nether fpconflict.conflict_map 1`

      - #fpconflict:fp_conflict_check
        - `execute if score dimension.minecraft.the_nether fpconflict.conflict_map matches 2.. run tellraw @a ["",{"text":"[Conflict]","color":"red"}," - ",{"text":"DATAPACK_NAME ","obfuscated":false,"color":"blue"},"(",{"text":"dimension.minecraft.the_nether","italic":true,"color":"dark_aqua"},")"]`