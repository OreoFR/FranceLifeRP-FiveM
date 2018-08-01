resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

data_file 'VEHICLE_LAYOUTS_FILE' 'r35/vehiclelayouts.meta'
data_file 'HANDLING_FILE' 'r35/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'r35/vehicles.meta'
data_file 'CARCOLS_FILE' 'r35/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'r35/carvariations.meta'

files {
  'r35/vehiclelayouts.meta',
  'r35/handling.meta',
  'r35/vehicles.meta',
  'r35/carcols.meta',
  'r35/carvariations.meta',
}

client_script 'vehicle_names.lua'
