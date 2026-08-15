hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
	bitdepth = 10,
	cm = "hdr",
	sdr_eotf = "gamma22",
	sdrbrightness = 1.1,
	sdrsaturation = 1.0,
	sdr_max_luminance = 250, -- QD-OLED full-screen SDR white is ~250 nits, not the 80 nit default
	max_luminance = 1000, -- True Black 400 peak highlight brightness (small window)
	max_avg_luminance = 250, -- sustained full-field brightness before ABL kicks in
	min_luminance = 0.0001, -- QD-OLED true blacks
})
