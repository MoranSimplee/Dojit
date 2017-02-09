module Paginate

  def paginate (collection, page_limit, num_of_page)
    collection.limit(page_limit).offset((num_of_page.to_i-1) * 10)
  end

end