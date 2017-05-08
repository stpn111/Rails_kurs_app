module CollectionsHelper
  # nested_start
  def collection_options()
    Collection.all.pluck('id')
  end
  # nested_finish
end
