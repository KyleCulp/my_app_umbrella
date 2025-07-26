# MyAppUmbrella

mix igniter.install ash ash_postgres ash_authentication \
  ash_oban ash_state_machine ash_events \
  ash_money ash_double_entry ash_archival \
  --auth-strategy password \
  --auth-strategy api_key --yes 
  
  \
  tidewave ash_paper_trail ash_ai cloak ash_cloak --yes
  --auth-strategy password \
  --auth-strategy magic_link \
  --auth-strategy api_key --yes \
  && mix ash.setup
