# 2016 Yukon Forecasting

Data, code, and figures for www.aoos.org/2016-yukon-chinook-forecasting/.

## Latest daily update

__Figure 1:__ Estimated vs. Modeled %CPUE (Chart 1 on AOOS page):

![Latest daily forecast](daily_forecast/daily_forecast.png)

- __Black line:__ Logistic curve fit to the three predicted percentiles of cumulative CPUE. This is our cumulative %CPUE model.
- __Red line:__ Estimated cumulative %CPUE. This assumes the cumulative %CPUE model (black line) is correct and also assumes that, for example, if the cumulative CPUE at the 25% point is 10, then the end-of-season cumulative CPUE will be 40 (10/0.25). Cumulative %CPUE is then calculated from the daily cumulative CPUEs with 40 as the denominator. Daily CPUE values are from the LYTF set index.
- __How to read the graph:__ If the timing forecast and the above %CPUE model are correct, we would expect the red line to match the black line. If the timing forecast is wrong, we would expect substantial deviation between the red and black lines, though there is no hard cutoff for this.


__Figure 2:__ Final CPUE estimates over the run:

![Latest final CPUE time series](daily_forecast/final_cpue.png)

- __Black, dotted line:__ These are the final CPUE estimates we've made each day of the run.
- __How to read the graph:__ When the timing model is correct, we expect the time series of Final CPUE estimates to stabilize and oscillate around a value. When the timing model is appreciably wrong, the time series will not stabilize.
