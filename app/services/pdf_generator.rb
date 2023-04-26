class PdfGenerator
  def self.generate_libraries_users_pdf
    Prawn::Document.new do
      text "Libraries", align: :center
      Library.all.each do |library|
        begin
          text "#{library.id}: #{library.name}, #{library.city} (#{library.zip_code}), #{library.address}"
        rescue Prawn::Errors::IncompatibleStringEncoding
          next
        end
      end

      start_new_page

      text "Users", align: :center
      User.all.each do |user|
        text "#{user.id}: #{user.last_name} #{user.first_name} #{user.patronymic}, #{user.email}, #{user.birth_date}"
      end

    end.render
  end

  def self.generate_users_pdf
    Prawn::Document.new do
      font_size 24
      text "Users", align: :center, color: 'FF0000'
      font_size 16
      User.all.each do |user|
        text(
            "<color rgb='ff0000'>#{user.id}</color>: #{user.last_name} #{user.first_name} #{user.patronymic}, #{user.email}, #{user.birth_date}",
            color: '00FF00',
            inline_format: true
        )
      end
    end.render
  end

  def self.generate_libraries_pdf
    Prawn::Document.new do
      font_size 24
      text "Libraries", align: :center, color: 'FF0000'
      font_size 16
      Library.all.each do |library|
        begin
          text(
              "<color rgb='ff0000'>#{library.id}</color>: #{library.name}, #{library.city} (#{library.zip_code}), #{library.address}",
              color: '00FF00',
              inline_format: true
          )
          image "app/assets/images/library.jpg", width: 50, height: 50, position: :right
          move_down 20
        rescue Prawn::Errors::IncompatibleStringEncoding
          next
        end
      end
    end.render
  end
end