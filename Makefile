.PHONY: april_forecast may_forecast

april_forecast: data/yukon.csv
	littler april_forecast/april_forecast.R

may_forecast: data/yukon.csv
	littler may_forecast/may_forecast.R
