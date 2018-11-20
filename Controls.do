

*Controls
import excel "C:\Users\Rock\Desktop\mohan\Summary_Wavelet_CONTROLS_ACh_fin+fore_Flux 1+2_30mins_with_total.xlsx", sheet("ACh_Middle fin") firstrow
encode FBand, gen(F_Band)
order Controls FBand F_Band
recode F_Band (.=1) if StartFHz==.6
recode F_Band (.=2) if StartFHz==.15
recode F_Band (.=3) if StartFHz==.05
recode F_Band (.=4) if StartFHz==.02
recode F_Band (.=5) if StartFHz==.008
recode F_Band (.=6) if EndFHz==.008
recode F_Band (.=7) if EndFHz==2
drop if F_Band==.
encode Param, gen(Param_1)
drop FBand
collapse (mean) StartFHz EndFHz WidthHz Mean SDev SErr Median Max FofMaxHz TimeofMax Min FofMinHz TimeofMin Sum R , by( F_Band Param_1)
gen group=1
order group
