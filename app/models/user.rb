class User < ApplicationRecord
  belongs_to :readers_card

  def self.insert_100
    (1..100).each do |x|
      self.new(first_name: "FN#{x}", last_name: "LN#{x}", patronymic: "PT#{x}", birth_date: "2023-03-22", readers_card: ReadersCard.last, email: "EM#{x}").save
    end
  end

  def update_first_name(first_name)
    self.first_name=first_name
    self.updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    self.save()
  end

  def update_last_name(last_name)
    self.last_name=last_name
    self.updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    self.save()
  end

  def update_patronymic(patronymic)
    self.patronymic=patronymic
    self.updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    self.save()
  end

  def update_birth_date(birth_date)
    self.birth_date=birth_date
    self.updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    self.save()
  end

  def update_readers_card(readers_card)
    self.readers_card=readers_card
    self.updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    self.save()
  end

  def update_email(email)
    self.email=email
    self.updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    self.save()
  end
  
end
