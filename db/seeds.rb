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
  facility_owner = FacilityOwner.find_or_initialize_by(email: "admin@example.com")

  if facility_owner.new_record?
    facility_owner.password = "password123"
    facility_owner.password_confirmation = "password123"
    facility_owner.save!
    puts 'Default facility_owner account created for development.'
  else
    puts 'Default facility_owner account already exists in development.'
  end
end
