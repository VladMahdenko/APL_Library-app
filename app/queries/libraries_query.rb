class LibrariesQuery
  def self.call(params, libraries)
    libraries = libraries.page(params[:page])
    libraries = libraries.where("name LIKE ?", "%#{params[:search]}%") if params[:search].present?
    libraries = libraries.left_joins(:books).group(:id).order('COUNT(books.id) DESC') if params[:sort] == "book_desc"
    libraries = libraries.left_joins(:books).group(:id).order('COUNT(books.id) ASC') if params[:sort] == "book_asc"
    libraries = libraries.order(name: :desc) if params[:sort] == "name_desc"
    libraries = libraries.order(name: :asc) if params[:sort] == "name_asc"
    return libraries
  end
end