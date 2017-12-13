class CompletionsController < ApplicationController
  def create
    @series = params.keys.each_with_object([]) { |key, a| a << params[key] if key.match(/serie\d+/) }
    @seance = Seance.find(params['seance_id'])
    @series.each do |serie|
      completion = Completion.new(serie: Serie.find(serie['id']), done: serie['done'], seance: @seance)
    end
    redirect_to @seance
  end
end
