module CollectionsHelper
  # nested_start
  def collection_options()
    Collection.all.pluck('colname, id')
  end
  # nested_finish
end
