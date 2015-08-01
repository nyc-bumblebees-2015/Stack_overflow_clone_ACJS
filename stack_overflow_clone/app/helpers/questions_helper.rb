module QuestionsHelper

  def order_collection(collection)
    collection.order("created_at asc")
  end

end
