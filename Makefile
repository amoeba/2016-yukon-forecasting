all: april_forecast/mdj_against_amatc.png may_forecast/predictions.csv may_forecast/model_select.csv may_forecast/mdj_against_msstc.png may_forecast/mdj_against_pice.png daily_forecast/daily_forecast.png daily_forecast/final_cpue.png

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

may_foreacst/logistic_curve.csv: may_forecast/predictions.csv
	littler may_forecast/logistic_curve.R

daily_forecast/daily_forecast.png: daily_forecast/daily_forecast.R data/inseason.csv may_forecast/predictions.csv may_forecast/logistic_curve.csv
	littler daily_forecast/daily_forecast.R

daily_forecast/final_cpue.png: daily_forecast/daily_forecast.R data/inseason.csv may_forecast/predictions.csv may_forecast/logistic_curve.csv
	littler daily_forecast/daily_forecast.R
