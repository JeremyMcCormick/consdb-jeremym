
CREATE TABLE main.exposure (
	exposure_id BIGINT NOT NULL, 
	exposure_name VARCHAR(20) NOT NULL, 
	controller VARCHAR(1) NOT NULL, 
	day_obs INTEGER NOT NULL, 
	seq_num INTEGER NOT NULL, 
	physical_filter VARCHAR(32), 
	band VARCHAR(32), 
	s_ra DOUBLE, 
	s_dec DOUBLE, 
	sky_rotation DOUBLE, 
	azimuth_start FLOAT, 
	azimuth_end FLOAT, 
	azimuth FLOAT, 
	altitude_start FLOAT, 
	altitude_end FLOAT, 
	altitude FLOAT, 
	zenith_distance_start FLOAT, 
	zenith_distance_end FLOAT, 
	zenith_distance FLOAT, 
	airmass FLOAT, 
	exp_midpt TIMESTAMP, 
	exp_midpt_mjd DOUBLE, 
	obs_start TIMESTAMP, 
	obs_start_mjd DOUBLE, 
	obs_end TIMESTAMP, 
	obs_end_mjd DOUBLE, 
	exp_time FLOAT, 
	shut_time FLOAT, 
	dark_time FLOAT, 
	group_id VARCHAR(64), 
	cur_index INTEGER, 
	max_index INTEGER, 
	img_type VARCHAR(64), 
	emulated BOOLEAN, 
	science_program VARCHAR(64), 
	observation_reason VARCHAR(68), 
	target_name VARCHAR(64), 
	air_temp FLOAT, 
	pressure FLOAT, 
	humidity FLOAT, 
	wind_speed FLOAT, 
	wind_dir FLOAT, 
	dimm_seeing FLOAT, 
	focus_z FLOAT, 
	simulated BOOLEAN, 
	vignette VARCHAR(10), 
	vignette_min VARCHAR(10), 
	s_region VARCHAR(1024), 
	PRIMARY KEY (exposure_id), 
	CONSTRAINT un_day_obs_seq_num UNIQUE (day_obs, seq_num)
)

;

CREATE TABLE main.exposure_flexdata_schema (
	"key" VARCHAR(128) NOT NULL, 
	dtype VARCHAR(64) NOT NULL, 
	doc TEXT NOT NULL, 
	unit VARCHAR(128), 
	ucd VARCHAR(128), 
	PRIMARY KEY ("key")
)

;

CREATE TABLE main.ccdexposure_flexdata_schema (
	"key" VARCHAR(128) NOT NULL, 
	dtype VARCHAR(64) NOT NULL, 
	doc TEXT NOT NULL, 
	unit VARCHAR(128), 
	ucd VARCHAR(128), 
	PRIMARY KEY ("key")
)

;

CREATE TABLE main.visit1 (
	visit_id BIGINT NOT NULL, 
	exposure_name VARCHAR(20) NOT NULL, 
	controller VARCHAR(1) NOT NULL, 
	day_obs INTEGER NOT NULL, 
	seq_num INTEGER NOT NULL, 
	physical_filter VARCHAR(32), 
	band VARCHAR(32), 
	s_ra DOUBLE, 
	s_dec DOUBLE, 
	sky_rotation DOUBLE, 
	azimuth_start FLOAT, 
	azimuth_end FLOAT, 
	azimuth FLOAT, 
	altitude_start FLOAT, 
	altitude_end FLOAT, 
	altitude FLOAT, 
	zenith_distance_start FLOAT, 
	zenith_distance_end FLOAT, 
	zenith_distance FLOAT, 
	airmass FLOAT, 
	exp_midpt TIMESTAMP, 
	exp_midpt_mjd DOUBLE, 
	obs_start TIMESTAMP, 
	obs_start_mjd DOUBLE, 
	obs_end TIMESTAMP, 
	obs_end_mjd DOUBLE, 
	exp_time FLOAT, 
	shut_time FLOAT, 
	dark_time FLOAT, 
	group_id VARCHAR(64), 
	cur_index INTEGER, 
	max_index INTEGER, 
	img_type VARCHAR(64), 
	emulated BOOLEAN, 
	science_program VARCHAR(64), 
	observation_reason VARCHAR(68), 
	target_name VARCHAR(64), 
	air_temp FLOAT, 
	pressure FLOAT, 
	humidity FLOAT, 
	wind_speed FLOAT, 
	wind_dir FLOAT, 
	dimm_seeing FLOAT, 
	focus_z FLOAT, 
	simulated BOOLEAN, 
	vignette VARCHAR(10), 
	vignette_min VARCHAR(10), 
	s_region VARCHAR(1024), 
	PRIMARY KEY (visit_id)
)

;

CREATE TABLE main.ccdvisit1 (
	ccdvisit_id BIGINT NOT NULL, 
	visit_id BIGINT NOT NULL, 
	detector INTEGER NOT NULL, 
	s_region VARCHAR(1024), 
	PRIMARY KEY (ccdvisit_id)
)

;

CREATE TABLE main.exposure_flexdata (
	obs_id BIGINT NOT NULL, 
	"key" VARCHAR(128) NOT NULL, 
	value TEXT, 
	PRIMARY KEY (obs_id, "key"), 
	CONSTRAINT fk_exposure_flexdata_obs_id FOREIGN KEY(obs_id) REFERENCES exposure (exposure_id), 
	CONSTRAINT fk_exposure_flexdata_key FOREIGN KEY("key") REFERENCES exposure_flexdata_schema ("key")
)

;

CREATE TABLE main.ccdexposure (
	ccdexposure_id BIGINT NOT NULL, 
	exposure_id BIGINT NOT NULL, 
	detector INTEGER NOT NULL, 
	s_region VARCHAR(1024), 
	PRIMARY KEY (ccdexposure_id), 
	CONSTRAINT un_exposure_id_detector UNIQUE (exposure_id, detector), 
	CONSTRAINT fk_exposure_id FOREIGN KEY(exposure_id) REFERENCES exposure (exposure_id)
)

;

CREATE TABLE main.visit1_quicklook (
	visit_id BIGINT NOT NULL, 
	n_inputs INTEGER, 
	astrom_offset_mean_min FLOAT, 
	astrom_offset_mean_max FLOAT, 
	astrom_offset_mean_median FLOAT, 
	astrom_offset_std_min FLOAT, 
	astrom_offset_std_max FLOAT, 
	astrom_offset_std_median FLOAT, 
	eff_time_min FLOAT, 
	eff_time_max FLOAT, 
	eff_time_median FLOAT, 
	eff_time_psf_sigma_scale_min FLOAT, 
	eff_time_psf_sigma_scale_max FLOAT, 
	eff_time_psf_sigma_scale_median FLOAT, 
	eff_time_sky_bg_scale_min FLOAT, 
	eff_time_sky_bg_scale_max FLOAT, 
	eff_time_sky_bg_scale_median FLOAT, 
	eff_time_zero_point_scale_min FLOAT, 
	eff_time_zero_point_scale_max FLOAT, 
	eff_time_zero_point_scale_median FLOAT, 
	max_dist_to_nearest_psf_min FLOAT, 
	max_dist_to_nearest_psf_max FLOAT, 
	max_dist_to_nearest_psf_median FLOAT, 
	mean_var_min FLOAT, 
	mean_var_max FLOAT, 
	mean_var_median FLOAT, 
	n_psf_star_min INTEGER, 
	n_psf_star_max INTEGER, 
	n_psf_star_median INTEGER, 
	n_psf_star_total INTEGER, 
	psf_area_min FLOAT, 
	psf_area_max FLOAT, 
	psf_area_median FLOAT, 
	psf_ixx_min FLOAT, 
	psf_ixx_max FLOAT, 
	psf_ixx_median FLOAT, 
	psf_ixy_min FLOAT, 
	psf_ixy_max FLOAT, 
	psf_ixy_median FLOAT, 
	psf_iyy_min FLOAT, 
	psf_iyy_max FLOAT, 
	psf_iyy_median FLOAT, 
	psf_sigma_min FLOAT, 
	psf_sigma_max FLOAT, 
	psf_sigma_median FLOAT, 
	psf_star_delta_e1_median_min FLOAT, 
	psf_star_delta_e1_median_max FLOAT, 
	psf_star_delta_e1_median_median FLOAT, 
	psf_star_delta_e1_scatter_min FLOAT, 
	psf_star_delta_e1_scatter_max FLOAT, 
	psf_star_delta_e1_scatter_median FLOAT, 
	psf_star_delta_e2_median_min FLOAT, 
	psf_star_delta_e2_median_max FLOAT, 
	psf_star_delta_e2_median_median FLOAT, 
	psf_star_delta_e2_scatter_min FLOAT, 
	psf_star_delta_e2_scatter_max FLOAT, 
	psf_star_delta_e2_scatter_median FLOAT, 
	psf_star_delta_size_median_min FLOAT, 
	psf_star_delta_size_median_max FLOAT, 
	psf_star_delta_size_median_median FLOAT, 
	psf_star_delta_size_scatter_min FLOAT, 
	psf_star_delta_size_scatter_max FLOAT, 
	psf_star_delta_size_scatter_median FLOAT, 
	psf_star_scaled_delta_size_scatter_min FLOAT, 
	psf_star_scaled_delta_size_scatter_max FLOAT, 
	psf_star_scaled_delta_size_scatter_median FLOAT, 
	psf_trace_radius_delta_min FLOAT, 
	psf_trace_radius_delta_max FLOAT, 
	psf_trace_radius_delta_median FLOAT, 
	sky_bg_min FLOAT, 
	sky_bg_max FLOAT, 
	sky_bg_median FLOAT, 
	sky_noise_min FLOAT, 
	sky_noise_max FLOAT, 
	sky_noise_median FLOAT, 
	seeing_zenith_500nm_min DOUBLE, 
	seeing_zenith_500nm_max DOUBLE, 
	seeing_zenith_500nm_median DOUBLE, 
	zero_point_min FLOAT, 
	zero_point_max FLOAT, 
	zero_point_median FLOAT, 
	low_snr_source_count_min INTEGER, 
	low_snr_source_count_max INTEGER, 
	low_snr_source_count_median INTEGER, 
	low_snr_source_count_total INTEGER, 
	high_snr_source_count_min INTEGER, 
	high_snr_source_count_max INTEGER, 
	high_snr_source_count_median INTEGER, 
	high_snr_source_count_total INTEGER, 
	postisr_pixel_median_median FLOAT, 
	postisr_pixel_median_mean FLOAT, 
	postisr_pixel_median_max FLOAT, 
	PRIMARY KEY (visit_id), 
	CONSTRAINT fk_visit1_quicklook_obs_id FOREIGN KEY(visit_id) REFERENCES exposure (exposure_id)
)

;

CREATE TABLE main.ccdexposure_camera (
	ccdexposure_id BIGINT NOT NULL, 
	temp_set FLOAT, 
	ccd_temp FLOAT, 
	PRIMARY KEY (ccdexposure_id), 
	CONSTRAINT fk_ccdexposure_camera_ccdexposure_id FOREIGN KEY(ccdexposure_id) REFERENCES ccdexposure (ccdexposure_id)
)

;

CREATE TABLE main.ccdexposure_flexdata (
	obs_id BIGINT NOT NULL, 
	"key" VARCHAR(128) NOT NULL, 
	value TEXT, 
	PRIMARY KEY (obs_id, "key"), 
	CONSTRAINT fk_ccdexposure_flexdata_obs_id FOREIGN KEY(obs_id) REFERENCES ccdexposure (ccdexposure_id), 
	CONSTRAINT fk_key FOREIGN KEY("key") REFERENCES ccdexposure_flexdata_schema ("key")
)

;

CREATE TABLE main.ccdvisit1_quicklook (
	ccdvisit_id BIGINT NOT NULL, 
	s_ra DOUBLE, 
	s_dec DOUBLE, 
	zenith_distance FLOAT, 
	photometric_calib FLOAT, 
	psf_sigma FLOAT, 
	sky_bg FLOAT, 
	sky_noise FLOAT, 
	zero_point FLOAT, 
	seeing_zenith_500nm DOUBLE, 
	astrom_offset_mean FLOAT, 
	astrom_offset_std FLOAT, 
	eff_time FLOAT, 
	eff_time_psf_sigma_scale FLOAT, 
	eff_time_sky_bg_scale FLOAT, 
	eff_time_zero_point_scale FLOAT, 
	mean_var FLOAT, 
	n_psf_star INTEGER, 
	psf_area FLOAT, 
	psf_ixx FLOAT, 
	psf_ixy FLOAT, 
	psf_iyy FLOAT, 
	psf_star_delta_e1_median FLOAT, 
	psf_star_delta_e2_median FLOAT, 
	psf_star_delta_e1_scatter FLOAT, 
	psf_star_delta_e2_scatter FLOAT, 
	psf_star_delta_size_median FLOAT, 
	psf_star_delta_size_scatter FLOAT, 
	psf_star_scaled_delta_size_scatter FLOAT, 
	psf_trace_radius_delta FLOAT, 
	max_dist_to_nearest_psf FLOAT, 
	postisr_pixel_median FLOAT, 
	PRIMARY KEY (ccdvisit_id), 
	CONSTRAINT fk_ccdvisit1_quicklook_obs_id FOREIGN KEY(ccdvisit_id) REFERENCES ccdexposure (ccdexposure_id)
)

;