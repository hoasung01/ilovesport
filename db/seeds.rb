if Rails.env.development?
  ###############################################################
  admin = Admin.find_or_initialize_by(email: "admin@example.com")

  if admin.new_record?
    admin.password = "password123"
    admin.password_confirmation = "password123"
    admin.save!
    puts 'Default admin account created for development.'
  else
    puts 'Default admin account already exists in development.'
  end

  ###############################################################
  facility_owner = FacilityOwner.find_or_initialize_by(email: "owner@example.com")

  if facility_owner.new_record?
    facility_owner.password = "password123"
    facility_owner.password_confirmation = "password123"
    facility_owner.save!
    puts 'Default facility_owner account created for development.'
  else
    puts 'Default facility_owner account already exists in development.'
  end

  ###############################################################
  # Create some dummy sports
  sports = ['Football', 'Basketball', 'Tennis', 'Swimming', 'Cricket']
  sports.each do |sport_name|
    Sport.find_or_create_by(name: sport_name)
  end

  # Create some dummy locations
  10.times do
    Location.create(
      address: Faker::Address.street_address,
      city: Faker::Address.city,
      country: Faker::Address.country,
      latitude: Faker::Address.latitude,
      longtitude: Faker::Address.longitude
    )
  end

  # Create dummy training grounds
  20.times do
    TrainingGround.create(
      name: Faker::Sports::Football.team,
      facility_owner_id: FacilityOwner.pluck(:id).sample,
      sport_id: Sport.pluck(:id).sample,
      location_id: Location.pluck(:id).sample
    )
  end

  puts "Dummy training grounds created!"
end
