all: april_forecast/mdj_against_amatc.png may_forecast/predictions.csv may_forecast/model_select.csv may_forecast/mdj_against_msstc.png may_forecast/mdj_against_pice.png

april_forecast/mdj_against_amatc.png: data/yukon.csv
	littler april_forecast/april_forecast.R

may_forecast/predictions.csv: data/yukon.csv
	littler may_forecast/may_forecast.R

may_forecast/model_select.csv: data/yukon.csv
	littler may_forecast/model_select.R

may_forecast/mdj_against_msstc.png: data/yukon.csv
	littler may_forecast/may_forecast.R

may_forecast/mdj_against_pice.png: data/yukon.csv
	littler may_forecast/may_forecast.R
