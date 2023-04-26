class CsvGenerator
  require 'csv'
  def self.generate_csv
    CSV.generate do |csv|
      csv << %w[library_id library_name library_city library_zip_code library_address]
      Library.all.each do |library|
        csv << [library.id, library.name, library.city, library.zip_code, library.address]
      end

      csv << %w[user_id user_last_name user_first_name user_patronymic user_email user_birth_date]
      User.all.each do |user|
        csv << [user.id, user.last_name, user.first_name, user.patronymic, user.email, user.birth_date]
      end
    end
  end
end