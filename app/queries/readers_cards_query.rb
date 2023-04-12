class ReadersCardsQuery
  def self.call(params, readers_cards)
    readers_cards = readers_cards.where(library_id: params[:library_id]).page(params[:page])
    readers_cards = readers_cards.joins(:user).where('users.last_name || " " || users.first_name LIKE ?', "%#{params[:search]}%") if params[:search].present?
    readers_cards = readers_cards.joins(:user).order(last_name: :desc) if params[:sort] == "name_desc"
    readers_cards = readers_cards.joins(:user).order(last_name: :asc) if params[:sort] == "name_asc"
    readers_cards = readers_cards.joins(:user).order(birth_date: :asc) if params[:sort] == "age_desc"
    readers_cards = readers_cards.joins(:user).order(birth_date: :desc) if params[:sort] == "age_asc"
    readers_cards = readers_cards.joins(:user).where("cast(strftime('%Y.%m%d', 'now') - strftime('%Y.%m%d', birth_date) as int) = ?", params[:age_search]) if params[:age_search].present?
    readers_cards = readers_cards.where('number LIKE ?', "%#{params[:number_search]}%") if params[:number_search].present?
    readers_cards = readers_cards.order(number: :desc) if params[:sort] == "number_desc"
    readers_cards = readers_cards.order(number: :asc) if params[:sort] == "number_asc"
    return readers_cards
  end
end