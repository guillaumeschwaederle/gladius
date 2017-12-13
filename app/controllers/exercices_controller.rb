class ExercicesController < ApplicationController
  def index
    @exercices = Exercice.all
  end

end
