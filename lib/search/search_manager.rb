class Search::SearchManager

	attr_accessor :query_list, :page, :size, :resource, :search_model
	attr_reader :index_preloads, :resource_name
	
	def initialize(resource_name, q, page, size, index_preloads)
		@query_list = q.split(',')
		@page = page.to_i
		@size = size.to_i
		@resource_name = resource_name
		@resource = resource_name.to_s.capitalize.constantize
		@search_model = "SearchModels::#{resource_name.to_s.capitalize}Model".constantize.new
	end

	def search
		conditional_query = ""
		joins = []
		query_list.each_with_index do | query, index|
			values = query.split(':')
			key = values[0]
			key_field = search_model.search_fields[key.to_sym]
			value = values[1]
			value = "'#{value}'" if value.is_a?(String)
			conditional_query += "#{key_field[:field]} = #{value} "
			conditional_query += "AND " unless index + 1 == query_list.size
			joins << key_field[:join] unless key_field[:join].nil?
		end
		join_query = ""
		joins.uniq.each do | join|
			join_query += "INNER JOIN #{join.pluralize} ON #{resource_name.to_s.pluralize}.#{join.singularize}_id = #{join.pluralize}.id"
		end		
		resources = resource.preload(index_preloads).where(conditional_query).joins(join_query).offset((page - 1)*size).take(size)		
		return resources

	end
end