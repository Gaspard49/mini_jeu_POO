#Welcome to my Ruby Program!

# Tout le monde veut ta POO

> Created on 23/07/2019 by Gaspard Tertrais.

**Note aux correcteurs**

A bientôt au téléphone ;)

Execute *app.rb*, *app_2.rb*, or *app_3* to run program in its corresponding version.

## Content

- **lib/** : Classes `Game` et `Player`, and data file for names list.
- **spec/**: Execute *app_spec.rb*, *app_2_spec.rb*, or *app_3_spec* to check programs
- **app_ -/2/3** : execution files.
- **Gemfile, Gemfile.lock** : Gem and dependencies. See below.

## Classes

### Game

Provides methods and variables to organize game process and its different phases.

- \# human_player
- \# ennemies
- \# initialize
- \# kill_players
- \# is_still_going?
- \# show_players
- \# menu
- \# menu_choice
- \# ennemies_attack
- \# end


### Player

Provides methods and variable to manage players actions and status.

- \# name
- \# life_points
- \# initialize
- \# show_state
- \# gets_dammage
- \# attacks
- \# compute_dammage

### HumanPlayer

*Inherits from Player* - Provides specific methods for Player played by real user.

- \# weapon_level
- \# initialize
- \# show_state
- \# compute_dammage
- \# search_weapon
- \# search_health_pack

## Gemfile

```
ruby '2.5.1'
source 'https://rubygems.org'
gem 'dotenv'
gem 'pry'


