class CreatePercolatorJob < ApplicationJob
  queue_as :default

  def perform(rule_id)
    Engine::PercolatorEngine.new(rule_id).run
  end
end
