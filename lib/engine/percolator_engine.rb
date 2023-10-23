require 'json'
class Engine::PercolatorEngine
	attr_accessor :rule, :search_builder
	def initialize(rule_id)
		@rule = Rule.find(rule_id)
		#@search_builder = Search::ElasticFilters.new
	end

	def run
		byebug
		must_list = filters(rule.filters)
	end

	private

	def filters(filters)
		must_list = []
		byebug
		filters.each do |filter|
			byebug
			must_list << query(filter)
		end

		byebug
	end

	def query(filter)
		query_filter = nil

		case filter['operator']
			when 'range'
				query_filter = {
					range: {
						filter['field'].to_sym => {
							gte: filter['gte'],
							lte: filter['lte']
						}
					}
				}
			when 'equal'
				byebug
				query_filter = {
					terms: {
						filter['field'].to_sym =>  filter['value'].to_a
					}
				}
				byebug

			when 'like'

				{
					
				}

			when 'unlike'

		end
		query_filter
	end
end