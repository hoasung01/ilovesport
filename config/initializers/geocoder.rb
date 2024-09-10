Geocoder.configure(
  # Geocoding options
  timeout: 5,                 # geocoding service timeout (seconds)
  lookup: :nominatim,         # name of geocoding service (you can change this to `:google` if you're using Google's API)
  ip_lookup: :ipinfo_io,      # IP address geocoding service
  language: :en,              # ISO-639 language code
  use_https: true,            # use HTTPS for lookup requests? (if supported)
  units: :km,                 # :km for kilometers or :mi for miles
  distances: :linear          # :spherical or :linear for distance calculation
)
