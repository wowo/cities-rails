class DefaultController < ApplicationController
    def index
        @topCities = City.joins(:state).includes(:state).limit(10)
        @topStates = State.select("state.*, count(city.id) AS countCities, sum(city.population) AS sumPopulation, sum(city.land_area) AS sumLandArea").joins(:cities).group("state.name").order("countCities DESC, sumPopulation DESC").limit(10)
        @topCitiesSummary = calculateSummary(@topCities, false)
        @topStatesSummary = calculateSummary(@topStates, true)
    end

    def calculateSummary (rows, aggregated)
        summary = {:population => 0, :land_area => 0}
        rows.each do |row|
            summary[:population] += aggregated ? row.sumPopulation : row.population
            summary[:land_area]  += aggregated ? row.sumLandArea   : row.land_area
        end
        summary
    end
end
