
CREATE TABLE main.exposure_efd (
	exposure_id BIGINT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	instrument CHAR(20),
	mt_azimuth_encoder_absolute_position0_rms_jitter FLOAT,
	mt_azimuth_encoder_absolute_position1_rms_jitter FLOAT,
	mt_azimuth_encoder_absolute_position2_rms_jitter FLOAT,
	mt_azimuth_encoder_absolute_position3_rms_jitter FLOAT,
	mt_elevation_encoder_absolute_position0_rms_jitter FLOAT,
	mt_elevation_encoder_absolute_position1_rms_jitter FLOAT,
	mt_elevation_encoder_absolute_position2_rms_jitter FLOAT,
	mt_elevation_encoder_absolute_position3_rms_jitter FLOAT,
	mt_salindex110_sonic_temperature_mean FLOAT,
	mt_salindex110_sonic_temperature_stddev FLOAT,
	at_salindex110_sonic_temperature_stddev_mean FLOAT,
	at_salindex110_sonic_temperature_stddev_stddev FLOAT,
	mt_salindex110_wind_speed_0_mean FLOAT,
	mt_salindex110_wind_speed_0_stddev FLOAT,
	mt_salindex110_wind_speed_0_min FLOAT,
	mt_salindex110_wind_speed_0_max FLOAT,
	mt_salindex110_wind_speed_1_mean FLOAT,
	mt_salindex110_wind_speed_1_stddev FLOAT,
	mt_salindex110_wind_speed_1_min FLOAT,
	mt_salindex110_wind_speed_1_max FLOAT,
	mt_salindex110_wind_speed_2_mean FLOAT,
	mt_salindex110_wind_speed_2_stddev FLOAT,
	mt_salindex110_wind_speed_2_min FLOAT,
	mt_salindex110_wind_speed_2_max FLOAT,
	mt_salindex110_wind_speed_speedstddev_0_mean FLOAT,
	mt_salindex110_wind_speed_speedstddev_0_stddev FLOAT,
	mt_salindex110_wind_speed_speedstddev_0_min FLOAT,
	mt_salindex110_wind_speed_speedstddev_0_max FLOAT,
	mt_salindex110_wind_speed_speedstddev_1_mean FLOAT,
	mt_salindex110_wind_speed_speedstddev_1_stddev FLOAT,
	mt_salindex110_wind_speed_speedstddev_1_min FLOAT,
	mt_salindex110_wind_speed_speedstddev_1_max FLOAT,
	mt_salindex110_wind_speed_speedstddev_2_mean FLOAT,
	mt_salindex110_wind_speed_speedstddev_2_stddev FLOAT,
	mt_salindex110_wind_speed_speedstddev_2_min FLOAT,
	mt_salindex110_wind_speed_speedstddev_2_max FLOAT,
	mt_salindex110_wind_speed_magnitude_mean FLOAT,
	mt_salindex110_wind_speed_magnitude_stddev FLOAT,
	mt_salindex110_wind_speed_magnitude_min FLOAT,
	mt_salindex110_wind_speed_magnitude_max FLOAT,
	mt_salindex110_wind_speed_maxmagnitude_mean FLOAT,
	mt_salindex110_wind_speed_maxmagnitude_stddev FLOAT,
	mt_salindex110_wind_speed_maxmagnitude_min FLOAT,
	mt_salindex110_wind_speed_maxmagnitude_max FLOAT,
	mt_salindex1_temperatureitem_0_mean FLOAT,
	mt_salindex1_temperatureitem_0_stddev FLOAT,
	mt_salindex1_temperatureitem_0_min FLOAT,
	mt_salindex1_temperatureitem_1_mean FLOAT,
	mt_salindex1_temperatureitem_0_max FLOAT,
	mt_salindex1_temperatureitem_1_stddev FLOAT,
	mt_salindex1_temperatureitem_1_min FLOAT,
	mt_salindex1_temperatureitem_1_max FLOAT,
	mt_salindex1_temperatureitem_2_mean FLOAT,
	mt_salindex1_temperatureitem_2_stddev FLOAT,
	mt_salindex1_temperatureitem_2_min FLOAT,
	mt_salindex1_temperatureitem_2_max FLOAT,
	mt_salindex1_temperatureitem_3_mean FLOAT,
	mt_salindex1_temperatureitem_3_stddev FLOAT,
	mt_salindex1_temperatureitem_3_min FLOAT,
	mt_salindex1_temperatureitem_3_max FLOAT,
	mt_salindex1_temperatureitem_4_mean FLOAT,
	mt_salindex1_temperatureitem_4_stddev FLOAT,
	mt_salindex1_temperatureitem_4_min FLOAT,
	mt_salindex1_temperatureitem_4_max FLOAT,
	mt_salindex1_temperatureitem_5_mean FLOAT,
	mt_salindex1_temperatureitem_5_stddev FLOAT,
	mt_salindex1_temperatureitem_5_min FLOAT,
	mt_salindex1_temperatureitem_5_max FLOAT,
	mt_salindex1_temperatureitem_6_mean FLOAT,
	mt_salindex1_temperatureitem_6_stddev FLOAT,
	mt_salindex1_temperatureitem_6_min FLOAT,
	mt_salindex1_temperatureitem_6_max FLOAT,
	mt_salindex1_temperatureitem_7_mean FLOAT,
	mt_salindex1_temperatureitem_7_stddev FLOAT,
	mt_salindex1_temperatureitem_7_min FLOAT,
	mt_salindex1_temperatureitem_7_max FLOAT,
	mt_salindex101_temperatureitem_0_mean FLOAT,
	mt_salindex101_temperatureitem_0_stddev FLOAT,
	mt_salindex101_temperatureitem_0_min FLOAT,
	mt_salindex101_temperatureitem_1_mean FLOAT,
	mt_salindex101_temperatureitem_0_max FLOAT,
	mt_salindex101_temperatureitem_1_stddev FLOAT,
	mt_salindex101_temperatureitem_1_min FLOAT,
	mt_salindex101_temperatureitem_1_max FLOAT,
	mt_salindex101_temperatureitem_2_mean FLOAT,
	mt_salindex101_temperatureitem_2_stddev FLOAT,
	mt_salindex101_temperatureitem_2_min FLOAT,
	mt_salindex101_temperatureitem_2_max FLOAT,
	mt_salindex101_temperatureitem_3_mean FLOAT,
	mt_salindex101_temperatureitem_3_stddev FLOAT,
	mt_salindex101_temperatureitem_3_min FLOAT,
	mt_salindex101_temperatureitem_3_max FLOAT,
	mt_salindex101_temperatureitem_4_mean FLOAT,
	mt_salindex101_temperatureitem_4_stddev FLOAT,
	mt_salindex101_temperatureitem_4_min FLOAT,
	mt_salindex101_temperatureitem_4_max FLOAT,
	mt_salindex101_temperatureitem_5_mean FLOAT,
	mt_salindex101_temperatureitem_5_stddev FLOAT,
	mt_salindex101_temperatureitem_5_min FLOAT,
	mt_salindex101_temperatureitem_5_max FLOAT,
	mt_salindex101_temperatureitem_6_mean FLOAT,
	mt_salindex101_temperatureitem_6_stddev FLOAT,
	mt_salindex101_temperatureitem_6_min FLOAT,
	mt_salindex101_temperatureitem_6_max FLOAT,
	mt_salindex101_temperatureitem_7_mean FLOAT,
	mt_salindex101_temperatureitem_7_stddev FLOAT,
	mt_salindex101_temperatureitem_7_min FLOAT,
	mt_salindex101_temperatureitem_7_max FLOAT,
	mt_salindex102_temperatureitem_0_mean FLOAT,
	mt_salindex102_temperatureitem_0_stddev FLOAT,
	mt_salindex102_temperatureitem_0_min FLOAT,
	mt_salindex102_temperatureitem_1_mean FLOAT,
	mt_salindex102_temperatureitem_0_max FLOAT,
	mt_salindex102_temperatureitem_1_stddev FLOAT,
	mt_salindex102_temperatureitem_1_min FLOAT,
	mt_salindex102_temperatureitem_1_max FLOAT,
	mt_salindex102_temperatureitem_2_mean FLOAT,
	mt_salindex102_temperatureitem_2_stddev FLOAT,
	mt_salindex102_temperatureitem_2_min FLOAT,
	mt_salindex102_temperatureitem_2_max FLOAT,
	mt_salindex102_temperatureitem_3_mean FLOAT,
	mt_salindex102_temperatureitem_3_stddev FLOAT,
	mt_salindex102_temperatureitem_3_min FLOAT,
	mt_salindex102_temperatureitem_3_max FLOAT,
	mt_salindex102_temperatureitem_4_mean FLOAT,
	mt_salindex102_temperatureitem_4_stddev FLOAT,
	mt_salindex102_temperatureitem_4_min FLOAT,
	mt_salindex102_temperatureitem_4_max FLOAT,
	mt_salindex102_temperatureitem_5_mean FLOAT,
	mt_salindex102_temperatureitem_5_stddev FLOAT,
	mt_salindex102_temperatureitem_5_min FLOAT,
	mt_salindex102_temperatureitem_5_max FLOAT,
	mt_salindex102_temperatureitem_6_mean FLOAT,
	mt_salindex102_temperatureitem_6_stddev FLOAT,
	mt_salindex102_temperatureitem_6_min FLOAT,
	mt_salindex102_temperatureitem_6_max FLOAT,
	mt_salindex102_temperatureitem_7_mean FLOAT,
	mt_salindex102_temperatureitem_7_stddev FLOAT,
	mt_salindex102_temperatureitem_7_min FLOAT,
	mt_salindex102_temperatureitem_7_max FLOAT,
	mt_salindex103_temperatureitem_0_mean FLOAT,
	mt_salindex103_temperatureitem_0_stddev FLOAT,
	mt_salindex103_temperatureitem_0_min FLOAT,
	mt_salindex103_temperatureitem_1_mean FLOAT,
	mt_salindex103_temperatureitem_0_max FLOAT,
	mt_salindex103_temperatureitem_1_stddev FLOAT,
	mt_salindex103_temperatureitem_1_min FLOAT,
	mt_salindex103_temperatureitem_1_max FLOAT,
	mt_salindex103_temperatureitem_2_mean FLOAT,
	mt_salindex103_temperatureitem_2_stddev FLOAT,
	mt_salindex103_temperatureitem_2_min FLOAT,
	mt_salindex103_temperatureitem_2_max FLOAT,
	mt_salindex103_temperatureitem_3_mean FLOAT,
	mt_salindex103_temperatureitem_3_stddev FLOAT,
	mt_salindex103_temperatureitem_3_min FLOAT,
	mt_salindex103_temperatureitem_3_max FLOAT,
	mt_salindex103_temperatureitem_4_mean FLOAT,
	mt_salindex103_temperatureitem_4_stddev FLOAT,
	mt_salindex103_temperatureitem_4_min FLOAT,
	mt_salindex103_temperatureitem_4_max FLOAT,
	mt_salindex103_temperatureitem_5_mean FLOAT,
	mt_salindex103_temperatureitem_5_stddev FLOAT,
	mt_salindex103_temperatureitem_5_min FLOAT,
	mt_salindex103_temperatureitem_5_max FLOAT,
	mt_salindex103_temperatureitem_6_mean FLOAT,
	mt_salindex103_temperatureitem_6_stddev FLOAT,
	mt_salindex103_temperatureitem_6_min FLOAT,
	mt_salindex103_temperatureitem_6_max FLOAT,
	mt_salindex103_temperatureitem_7_mean FLOAT,
	mt_salindex103_temperatureitem_7_stddev FLOAT,
	mt_salindex103_temperatureitem_7_min FLOAT,
	mt_salindex103_temperatureitem_7_max FLOAT,
	mt_salindex106_temperatureitem_0_mean FLOAT,
	mt_salindex106_temperatureitem_0_stddev FLOAT,
	mt_salindex106_temperatureitem_0_min FLOAT,
	mt_salindex106_temperatureitem_1_mean FLOAT,
	mt_salindex106_temperatureitem_0_max FLOAT,
	mt_salindex106_temperatureitem_1_stddev FLOAT,
	mt_salindex106_temperatureitem_1_min FLOAT,
	mt_salindex106_temperatureitem_1_max FLOAT,
	mt_salindex106_temperatureitem_2_mean FLOAT,
	mt_salindex106_temperatureitem_2_stddev FLOAT,
	mt_salindex106_temperatureitem_2_min FLOAT,
	mt_salindex106_temperatureitem_2_max FLOAT,
	mt_salindex106_temperatureitem_3_mean FLOAT,
	mt_salindex106_temperatureitem_3_stddev FLOAT,
	mt_salindex106_temperatureitem_3_min FLOAT,
	mt_salindex106_temperatureitem_3_max FLOAT,
	mt_salindex106_temperatureitem_4_mean FLOAT,
	mt_salindex106_temperatureitem_4_stddev FLOAT,
	mt_salindex106_temperatureitem_4_min FLOAT,
	mt_salindex106_temperatureitem_4_max FLOAT,
	mt_salindex106_temperatureitem_5_mean FLOAT,
	mt_salindex106_temperatureitem_5_stddev FLOAT,
	mt_salindex106_temperatureitem_5_min FLOAT,
	mt_salindex106_temperatureitem_5_max FLOAT,
	mt_salindex106_temperatureitem_6_mean FLOAT,
	mt_salindex106_temperatureitem_6_stddev FLOAT,
	mt_salindex106_temperatureitem_6_min FLOAT,
	mt_salindex106_temperatureitem_6_max FLOAT,
	mt_salindex106_temperatureitem_7_mean FLOAT,
	mt_salindex106_temperatureitem_7_stddev FLOAT,
	mt_salindex106_temperatureitem_7_min FLOAT,
	mt_salindex106_temperatureitem_7_max FLOAT,
	mt_salindex107_temperatureitem_0_mean FLOAT,
	mt_salindex107_temperatureitem_0_stddev FLOAT,
	mt_salindex107_temperatureitem_0_min FLOAT,
	mt_salindex107_temperatureitem_1_mean FLOAT,
	mt_salindex107_temperatureitem_0_max FLOAT,
	mt_salindex107_temperatureitem_1_stddev FLOAT,
	mt_salindex107_temperatureitem_1_min FLOAT,
	mt_salindex107_temperatureitem_1_max FLOAT,
	mt_salindex107_temperatureitem_2_mean FLOAT,
	mt_salindex107_temperatureitem_2_stddev FLOAT,
	mt_salindex107_temperatureitem_2_min FLOAT,
	mt_salindex107_temperatureitem_2_max FLOAT,
	mt_salindex107_temperatureitem_3_mean FLOAT,
	mt_salindex107_temperatureitem_3_stddev FLOAT,
	mt_salindex107_temperatureitem_3_min FLOAT,
	mt_salindex107_temperatureitem_3_max FLOAT,
	mt_salindex107_temperatureitem_4_mean FLOAT,
	mt_salindex107_temperatureitem_4_stddev FLOAT,
	mt_salindex107_temperatureitem_4_min FLOAT,
	mt_salindex107_temperatureitem_4_max FLOAT,
	mt_salindex107_temperatureitem_5_mean FLOAT,
	mt_salindex107_temperatureitem_5_stddev FLOAT,
	mt_salindex107_temperatureitem_5_min FLOAT,
	mt_salindex107_temperatureitem_5_max FLOAT,
	mt_salindex107_temperatureitem_6_mean FLOAT,
	mt_salindex107_temperatureitem_6_stddev FLOAT,
	mt_salindex107_temperatureitem_6_min FLOAT,
	mt_salindex107_temperatureitem_6_max FLOAT,
	mt_salindex107_temperatureitem_7_mean FLOAT,
	mt_salindex107_temperatureitem_7_stddev FLOAT,
	mt_salindex107_temperatureitem_7_min FLOAT,
	mt_salindex107_temperatureitem_7_max FLOAT,
	mt_salindex108_temperatureitem_0_mean FLOAT,
	mt_salindex108_temperatureitem_0_stddev FLOAT,
	mt_salindex108_temperatureitem_0_min FLOAT,
	mt_salindex108_temperatureitem_1_mean FLOAT,
	mt_salindex108_temperatureitem_0_max FLOAT,
	mt_salindex108_temperatureitem_1_stddev FLOAT,
	mt_salindex108_temperatureitem_1_min FLOAT,
	mt_salindex108_temperatureitem_1_max FLOAT,
	mt_salindex108_temperatureitem_2_mean FLOAT,
	mt_salindex108_temperatureitem_2_stddev FLOAT,
	mt_salindex108_temperatureitem_2_min FLOAT,
	mt_salindex108_temperatureitem_2_max FLOAT,
	mt_salindex108_temperatureitem_3_mean FLOAT,
	mt_salindex108_temperatureitem_3_stddev FLOAT,
	mt_salindex108_temperatureitem_3_min FLOAT,
	mt_salindex108_temperatureitem_3_max FLOAT,
	mt_salindex108_temperatureitem_4_mean FLOAT,
	mt_salindex108_temperatureitem_4_stddev FLOAT,
	mt_salindex108_temperatureitem_4_min FLOAT,
	mt_salindex108_temperatureitem_4_max FLOAT,
	mt_salindex108_temperatureitem_5_mean FLOAT,
	mt_salindex108_temperatureitem_5_stddev FLOAT,
	mt_salindex108_temperatureitem_5_min FLOAT,
	mt_salindex108_temperatureitem_5_max FLOAT,
	mt_salindex108_temperatureitem_6_mean FLOAT,
	mt_salindex108_temperatureitem_6_stddev FLOAT,
	mt_salindex108_temperatureitem_6_min FLOAT,
	mt_salindex108_temperatureitem_6_max FLOAT,
	mt_salindex108_temperatureitem_7_mean FLOAT,
	mt_salindex108_temperatureitem_7_stddev FLOAT,
	mt_salindex108_temperatureitem_7_min FLOAT,
	mt_salindex108_temperatureitem_7_max FLOAT,
	mt_salindex301_temperatureitem_0_mean FLOAT,
	mt_salindex301_temperatureitem_0_stddev FLOAT,
	mt_salindex301_temperatureitem_0_min FLOAT,
	mt_salindex301_temperatureitem_1_mean FLOAT,
	mt_salindex301_temperatureitem_0_max FLOAT,
	mt_salindex301_temperatureitem_1_stddev FLOAT,
	mt_salindex301_temperatureitem_1_min FLOAT,
	mt_salindex301_temperatureitem_1_max FLOAT,
	mt_salindex301_temperatureitem_2_mean FLOAT,
	mt_salindex301_temperatureitem_2_stddev FLOAT,
	mt_salindex301_temperatureitem_2_min FLOAT,
	mt_salindex301_temperatureitem_2_max FLOAT,
	mt_salindex301_temperatureitem_3_mean FLOAT,
	mt_salindex301_temperatureitem_3_stddev FLOAT,
	mt_salindex301_temperatureitem_3_min FLOAT,
	mt_salindex301_temperatureitem_3_max FLOAT,
	mt_salindex301_temperatureitem_4_mean FLOAT,
	mt_salindex301_temperatureitem_4_stddev FLOAT,
	mt_salindex301_temperatureitem_4_min FLOAT,
	mt_salindex301_temperatureitem_4_max FLOAT,
	mt_salindex301_temperatureitem_5_mean FLOAT,
	mt_salindex301_temperatureitem_5_stddev FLOAT,
	mt_salindex301_temperatureitem_5_min FLOAT,
	mt_salindex301_temperatureitem_5_max FLOAT,
	mt_salindex301_temperatureitem_6_mean FLOAT,
	mt_salindex301_temperatureitem_6_stddev FLOAT,
	mt_salindex301_temperatureitem_6_min FLOAT,
	mt_salindex301_temperatureitem_6_max FLOAT,
	mt_salindex301_temperatureitem_7_mean FLOAT,
	mt_salindex301_temperatureitem_7_stddev FLOAT,
	mt_salindex301_temperatureitem_7_min FLOAT,
	mt_salindex301_temperatureitem_7_max FLOAT,
	mt_dimm_fwhm_mean FLOAT,
	mt_azimuth_encoder_absolute_position0_mean FLOAT,
	mt_azimuth_encoder_absolute_position1_mean FLOAT,
	mt_azimuth_encoder_absolute_position2_mean FLOAT,
	mt_azimuth_encoder_absolute_position3_mean FLOAT,
	mt_elevation_encoder_absolute_position0_mean FLOAT,
	mt_elevation_encoder_absolute_position1_mean FLOAT,
	mt_elevation_encoder_absolute_position2_mean FLOAT,
	mt_elevation_encoder_absolute_position3_mean FLOAT,
	mt_hexapod_uncompensated_position_u_mean FLOAT,
	mt_hexapod_uncompensated_position_u_max FLOAT,
	mt_hexapod_uncompensated_position_u_min FLOAT,
	mt_hexapod_uncompensated_position_v_mean FLOAT,
	mt_hexapod_uncompensated_position_v_max FLOAT,
	mt_hexapod_uncompensated_position_v_min FLOAT,
	mt_hexapod_uncompensated_position_w_mean FLOAT,
	mt_hexapod_uncompensated_position_w_max FLOAT,
	mt_hexapod_uncompensated_position_w_min FLOAT,
	mt_hexapod_uncompensated_position_x_mean FLOAT,
	mt_hexapod_uncompensated_position_x_max FLOAT,
	mt_hexapod_uncompensated_position_x_min FLOAT,
	mt_hexapod_uncompensated_position_y_mean FLOAT,
	mt_hexapod_uncompensated_position_y_max FLOAT,
	mt_hexapod_uncompensated_position_y_min FLOAT,
	mt_hexapod_uncompensated_position_z_mean FLOAT,
	mt_hexapod_uncompensated_position_z_max FLOAT,
	mt_hexapod_uncompensated_position_z_min FLOAT,
	mt_salindex104_acceleration_x_mean FLOAT,
	mt_salindex104_acceleration_x_stddev FLOAT,
	mt_salindex104_acceleration_x_min FLOAT,
	mt_salindex104_acceleration_x_max FLOAT,
	mt_salindey104_acceleration_y_mean FLOAT,
	mt_salindex104_acceleration_y_stddev FLOAT,
	mt_salindex104_acceleration_y_min FLOAT,
	mt_salindex104_acceleration_y_max FLOAT,
	mt_salindez104_acceleration_z_mean FLOAT,
	mt_salindex104_acceleration_z_stddev FLOAT,
	mt_salindex104_acceleration_z_min FLOAT,
	mt_salindex104_acceleration_z_max FLOAT,
	mt_pointing_mount_position_ra_mean FLOAT,
	mt_pointing_mount_position_ra_stddev FLOAT,
	mt_pointing_mount_position_dec_mean FLOAT,
	mt_pointing_mount_position_dec_stddev FLOAT,
	mt_pointing_mount_position_sky_angle_mean FLOAT,
	mt_pointing_mount_position_sky_angle_stddev FLOAT,
	mt_pointing_mount_position_rotator_mean FLOAT,
	mt_pointing_mount_position_rotator_stddev FLOAT,
	camera_hexapod_aos_corrections_u FLOAT,
	camera_hexapod_aos_corrections_v FLOAT,
	camera_hexapod_aos_corrections_w FLOAT,
	camera_hexapod_aos_corrections_x FLOAT,
	camera_hexapod_aos_corrections_y FLOAT,
	camera_hexapod_aos_corrections_z FLOAT,
	m2_hexapod_aos_corrections_u FLOAT,
	m2_hexapod_aos_corrections_v FLOAT,
	m2_hexapod_aos_corrections_w FLOAT,
	m2_hexapod_aos_corrections_x FLOAT,
	m2_hexapod_aos_corrections_y FLOAT,
	m2_hexapod_aos_corrections_z FLOAT,
	m2_stress FLOAT,
	m1m3_stress FLOAT,
	PRIMARY KEY (exposure_id, instrument),
	CONSTRAINT un_exposure_id_instrument UNIQUE (exposure_id, instrument)
)

;

CREATE TABLE main.visit1_efd (
	visit_id BIGINT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	instrument CHAR(20),
	mt_salindex110_sonic_temperature_mean FLOAT,
	mt_salindex110_sonic_temperature_stddev FLOAT,
	at_salindex110_sonic_temperature_stddev_mean FLOAT,
	at_salindex110_sonic_temperature_stddev_stddev FLOAT,
	mt_salindex110_wind_speed_0_mean FLOAT,
	mt_salindex110_wind_speed_0_stddev FLOAT,
	mt_salindex110_wind_speed_0_min FLOAT,
	mt_salindex110_wind_speed_0_max FLOAT,
	mt_salindex110_wind_speed_1_mean FLOAT,
	mt_salindex110_wind_speed_1_stddev FLOAT,
	mt_salindex110_wind_speed_1_min FLOAT,
	mt_salindex110_wind_speed_1_max FLOAT,
	mt_salindex110_wind_speed_2_mean FLOAT,
	mt_salindex110_wind_speed_2_stddev FLOAT,
	mt_salindex110_wind_speed_2_min FLOAT,
	mt_salindex110_wind_speed_2_max FLOAT,
	mt_salindex110_wind_speed_speedstddev_0_mean FLOAT,
	mt_salindex110_wind_speed_speedstddev_0_stddev FLOAT,
	mt_salindex110_wind_speed_speedstddev_0_min FLOAT,
	mt_salindex110_wind_speed_speedstddev_0_max FLOAT,
	mt_salindex110_wind_speed_speedstddev_1_mean FLOAT,
	mt_salindex110_wind_speed_speedstddev_1_stddev FLOAT,
	mt_salindex110_wind_speed_speedstddev_1_min FLOAT,
	mt_salindex110_wind_speed_speedstddev_1_max FLOAT,
	mt_salindex110_wind_speed_speedstddev_2_mean FLOAT,
	mt_salindex110_wind_speed_speedstddev_2_stddev FLOAT,
	mt_salindex110_wind_speed_speedstddev_2_min FLOAT,
	mt_salindex110_wind_speed_speedstddev_2_max FLOAT,
	mt_salindex110_wind_speed_magnitude_mean FLOAT,
	mt_salindex110_wind_speed_magnitude_stddev FLOAT,
	mt_salindex110_wind_speed_magnitude_min FLOAT,
	mt_salindex110_wind_speed_magnitude_max FLOAT,
	mt_salindex110_wind_speed_maxmagnitude_mean FLOAT,
	mt_salindex110_wind_speed_maxmagnitude_stddev FLOAT,
	mt_salindex110_wind_speed_maxmagnitude_min FLOAT,
	mt_salindex110_wind_speed_maxmagnitude_max FLOAT,
	mt_salindex1_temperatureitem_0_mean FLOAT,
	mt_salindex1_temperatureitem_0_stddev FLOAT,
	mt_salindex1_temperatureitem_0_min FLOAT,
	mt_salindex1_temperatureitem_1_mean FLOAT,
	mt_salindex1_temperatureitem_0_max FLOAT,
	mt_salindex1_temperatureitem_1_stddev FLOAT,
	mt_salindex1_temperatureitem_1_min FLOAT,
	mt_salindex1_temperatureitem_1_max FLOAT,
	mt_salindex1_temperatureitem_2_mean FLOAT,
	mt_salindex1_temperatureitem_2_stddev FLOAT,
	mt_salindex1_temperatureitem_2_min FLOAT,
	mt_salindex1_temperatureitem_2_max FLOAT,
	mt_salindex1_temperatureitem_3_mean FLOAT,
	mt_salindex1_temperatureitem_3_stddev FLOAT,
	mt_salindex1_temperatureitem_3_min FLOAT,
	mt_salindex1_temperatureitem_3_max FLOAT,
	mt_salindex1_temperatureitem_4_mean FLOAT,
	mt_salindex1_temperatureitem_4_stddev FLOAT,
	mt_salindex1_temperatureitem_4_min FLOAT,
	mt_salindex1_temperatureitem_4_max FLOAT,
	mt_salindex1_temperatureitem_5_mean FLOAT,
	mt_salindex1_temperatureitem_5_stddev FLOAT,
	mt_salindex1_temperatureitem_5_min FLOAT,
	mt_salindex1_temperatureitem_5_max FLOAT,
	mt_salindex1_temperatureitem_6_mean FLOAT,
	mt_salindex1_temperatureitem_6_stddev FLOAT,
	mt_salindex1_temperatureitem_6_min FLOAT,
	mt_salindex1_temperatureitem_6_max FLOAT,
	mt_salindex1_temperatureitem_7_mean FLOAT,
	mt_salindex1_temperatureitem_7_stddev FLOAT,
	mt_salindex1_temperatureitem_7_min FLOAT,
	mt_salindex1_temperatureitem_7_max FLOAT,
	mt_salindex101_temperatureitem_0_mean FLOAT,
	mt_salindex101_temperatureitem_0_stddev FLOAT,
	mt_salindex101_temperatureitem_0_min FLOAT,
	mt_salindex101_temperatureitem_1_mean FLOAT,
	mt_salindex101_temperatureitem_0_max FLOAT,
	mt_salindex101_temperatureitem_1_stddev FLOAT,
	mt_salindex101_temperatureitem_1_min FLOAT,
	mt_salindex101_temperatureitem_1_max FLOAT,
	mt_salindex101_temperatureitem_2_mean FLOAT,
	mt_salindex101_temperatureitem_2_stddev FLOAT,
	mt_salindex101_temperatureitem_2_min FLOAT,
	mt_salindex101_temperatureitem_2_max FLOAT,
	mt_salindex101_temperatureitem_3_mean FLOAT,
	mt_salindex101_temperatureitem_3_stddev FLOAT,
	mt_salindex101_temperatureitem_3_min FLOAT,
	mt_salindex101_temperatureitem_3_max FLOAT,
	mt_salindex101_temperatureitem_4_mean FLOAT,
	mt_salindex101_temperatureitem_4_stddev FLOAT,
	mt_salindex101_temperatureitem_4_min FLOAT,
	mt_salindex101_temperatureitem_4_max FLOAT,
	mt_salindex101_temperatureitem_5_mean FLOAT,
	mt_salindex101_temperatureitem_5_stddev FLOAT,
	mt_salindex101_temperatureitem_5_min FLOAT,
	mt_salindex101_temperatureitem_5_max FLOAT,
	mt_salindex101_temperatureitem_6_mean FLOAT,
	mt_salindex101_temperatureitem_6_stddev FLOAT,
	mt_salindex101_temperatureitem_6_min FLOAT,
	mt_salindex101_temperatureitem_6_max FLOAT,
	mt_salindex101_temperatureitem_7_mean FLOAT,
	mt_salindex101_temperatureitem_7_stddev FLOAT,
	mt_salindex101_temperatureitem_7_min FLOAT,
	mt_salindex101_temperatureitem_7_max FLOAT,
	mt_salindex102_temperatureitem_0_mean FLOAT,
	mt_salindex102_temperatureitem_0_stddev FLOAT,
	mt_salindex102_temperatureitem_0_min FLOAT,
	mt_salindex102_temperatureitem_1_mean FLOAT,
	mt_salindex102_temperatureitem_0_max FLOAT,
	mt_salindex102_temperatureitem_1_stddev FLOAT,
	mt_salindex102_temperatureitem_1_min FLOAT,
	mt_salindex102_temperatureitem_1_max FLOAT,
	mt_salindex102_temperatureitem_2_mean FLOAT,
	mt_salindex102_temperatureitem_2_stddev FLOAT,
	mt_salindex102_temperatureitem_2_min FLOAT,
	mt_salindex102_temperatureitem_2_max FLOAT,
	mt_salindex102_temperatureitem_3_mean FLOAT,
	mt_salindex102_temperatureitem_3_stddev FLOAT,
	mt_salindex102_temperatureitem_3_min FLOAT,
	mt_salindex102_temperatureitem_3_max FLOAT,
	mt_salindex102_temperatureitem_4_mean FLOAT,
	mt_salindex102_temperatureitem_4_stddev FLOAT,
	mt_salindex102_temperatureitem_4_min FLOAT,
	mt_salindex102_temperatureitem_4_max FLOAT,
	mt_salindex102_temperatureitem_5_mean FLOAT,
	mt_salindex102_temperatureitem_5_stddev FLOAT,
	mt_salindex102_temperatureitem_5_min FLOAT,
	mt_salindex102_temperatureitem_5_max FLOAT,
	mt_salindex102_temperatureitem_6_mean FLOAT,
	mt_salindex102_temperatureitem_6_stddev FLOAT,
	mt_salindex102_temperatureitem_6_min FLOAT,
	mt_salindex102_temperatureitem_6_max FLOAT,
	mt_salindex102_temperatureitem_7_mean FLOAT,
	mt_salindex102_temperatureitem_7_stddev FLOAT,
	mt_salindex102_temperatureitem_7_min FLOAT,
	mt_salindex102_temperatureitem_7_max FLOAT,
	mt_salindex103_temperatureitem_0_mean FLOAT,
	mt_salindex103_temperatureitem_0_stddev FLOAT,
	mt_salindex103_temperatureitem_0_min FLOAT,
	mt_salindex103_temperatureitem_1_mean FLOAT,
	mt_salindex103_temperatureitem_0_max FLOAT,
	mt_salindex103_temperatureitem_1_stddev FLOAT,
	mt_salindex103_temperatureitem_1_min FLOAT,
	mt_salindex103_temperatureitem_1_max FLOAT,
	mt_salindex103_temperatureitem_2_mean FLOAT,
	mt_salindex103_temperatureitem_2_stddev FLOAT,
	mt_salindex103_temperatureitem_2_min FLOAT,
	mt_salindex103_temperatureitem_2_max FLOAT,
	mt_salindex103_temperatureitem_3_mean FLOAT,
	mt_salindex103_temperatureitem_3_stddev FLOAT,
	mt_salindex103_temperatureitem_3_min FLOAT,
	mt_salindex103_temperatureitem_3_max FLOAT,
	mt_salindex103_temperatureitem_4_mean FLOAT,
	mt_salindex103_temperatureitem_4_stddev FLOAT,
	mt_salindex103_temperatureitem_4_min FLOAT,
	mt_salindex103_temperatureitem_4_max FLOAT,
	mt_salindex103_temperatureitem_5_mean FLOAT,
	mt_salindex103_temperatureitem_5_stddev FLOAT,
	mt_salindex103_temperatureitem_5_min FLOAT,
	mt_salindex103_temperatureitem_5_max FLOAT,
	mt_salindex103_temperatureitem_6_mean FLOAT,
	mt_salindex103_temperatureitem_6_stddev FLOAT,
	mt_salindex103_temperatureitem_6_min FLOAT,
	mt_salindex103_temperatureitem_6_max FLOAT,
	mt_salindex103_temperatureitem_7_mean FLOAT,
	mt_salindex103_temperatureitem_7_stddev FLOAT,
	mt_salindex103_temperatureitem_7_min FLOAT,
	mt_salindex103_temperatureitem_7_max FLOAT,
	mt_salindex106_temperatureitem_0_mean FLOAT,
	mt_salindex106_temperatureitem_0_stddev FLOAT,
	mt_salindex106_temperatureitem_0_min FLOAT,
	mt_salindex106_temperatureitem_1_mean FLOAT,
	mt_salindex106_temperatureitem_0_max FLOAT,
	mt_salindex106_temperatureitem_1_stddev FLOAT,
	mt_salindex106_temperatureitem_1_min FLOAT,
	mt_salindex106_temperatureitem_1_max FLOAT,
	mt_salindex106_temperatureitem_2_mean FLOAT,
	mt_salindex106_temperatureitem_2_stddev FLOAT,
	mt_salindex106_temperatureitem_2_min FLOAT,
	mt_salindex106_temperatureitem_2_max FLOAT,
	mt_salindex106_temperatureitem_3_mean FLOAT,
	mt_salindex106_temperatureitem_3_stddev FLOAT,
	mt_salindex106_temperatureitem_3_min FLOAT,
	mt_salindex106_temperatureitem_3_max FLOAT,
	mt_salindex106_temperatureitem_4_mean FLOAT,
	mt_salindex106_temperatureitem_4_stddev FLOAT,
	mt_salindex106_temperatureitem_4_min FLOAT,
	mt_salindex106_temperatureitem_4_max FLOAT,
	mt_salindex106_temperatureitem_5_mean FLOAT,
	mt_salindex106_temperatureitem_5_stddev FLOAT,
	mt_salindex106_temperatureitem_5_min FLOAT,
	mt_salindex106_temperatureitem_5_max FLOAT,
	mt_salindex106_temperatureitem_6_mean FLOAT,
	mt_salindex106_temperatureitem_6_stddev FLOAT,
	mt_salindex106_temperatureitem_6_min FLOAT,
	mt_salindex106_temperatureitem_6_max FLOAT,
	mt_salindex106_temperatureitem_7_mean FLOAT,
	mt_salindex106_temperatureitem_7_stddev FLOAT,
	mt_salindex106_temperatureitem_7_min FLOAT,
	mt_salindex106_temperatureitem_7_max FLOAT,
	mt_salindex107_temperatureitem_0_mean FLOAT,
	mt_salindex107_temperatureitem_0_stddev FLOAT,
	mt_salindex107_temperatureitem_0_min FLOAT,
	mt_salindex107_temperatureitem_1_mean FLOAT,
	mt_salindex107_temperatureitem_0_max FLOAT,
	mt_salindex107_temperatureitem_1_stddev FLOAT,
	mt_salindex107_temperatureitem_1_min FLOAT,
	mt_salindex107_temperatureitem_1_max FLOAT,
	mt_salindex107_temperatureitem_2_mean FLOAT,
	mt_salindex107_temperatureitem_2_stddev FLOAT,
	mt_salindex107_temperatureitem_2_min FLOAT,
	mt_salindex107_temperatureitem_2_max FLOAT,
	mt_salindex107_temperatureitem_3_mean FLOAT,
	mt_salindex107_temperatureitem_3_stddev FLOAT,
	mt_salindex107_temperatureitem_3_min FLOAT,
	mt_salindex107_temperatureitem_3_max FLOAT,
	mt_salindex107_temperatureitem_4_mean FLOAT,
	mt_salindex107_temperatureitem_4_stddev FLOAT,
	mt_salindex107_temperatureitem_4_min FLOAT,
	mt_salindex107_temperatureitem_4_max FLOAT,
	mt_salindex107_temperatureitem_5_mean FLOAT,
	mt_salindex107_temperatureitem_5_stddev FLOAT,
	mt_salindex107_temperatureitem_5_min FLOAT,
	mt_salindex107_temperatureitem_5_max FLOAT,
	mt_salindex107_temperatureitem_6_mean FLOAT,
	mt_salindex107_temperatureitem_6_stddev FLOAT,
	mt_salindex107_temperatureitem_6_min FLOAT,
	mt_salindex107_temperatureitem_6_max FLOAT,
	mt_salindex107_temperatureitem_7_mean FLOAT,
	mt_salindex107_temperatureitem_7_stddev FLOAT,
	mt_salindex107_temperatureitem_7_min FLOAT,
	mt_salindex107_temperatureitem_7_max FLOAT,
	mt_salindex108_temperatureitem_0_mean FLOAT,
	mt_salindex108_temperatureitem_0_stddev FLOAT,
	mt_salindex108_temperatureitem_0_min FLOAT,
	mt_salindex108_temperatureitem_1_mean FLOAT,
	mt_salindex108_temperatureitem_0_max FLOAT,
	mt_salindex108_temperatureitem_1_stddev FLOAT,
	mt_salindex108_temperatureitem_1_min FLOAT,
	mt_salindex108_temperatureitem_1_max FLOAT,
	mt_salindex108_temperatureitem_2_mean FLOAT,
	mt_salindex108_temperatureitem_2_stddev FLOAT,
	mt_salindex108_temperatureitem_2_min FLOAT,
	mt_salindex108_temperatureitem_2_max FLOAT,
	mt_salindex108_temperatureitem_3_mean FLOAT,
	mt_salindex108_temperatureitem_3_stddev FLOAT,
	mt_salindex108_temperatureitem_3_min FLOAT,
	mt_salindex108_temperatureitem_3_max FLOAT,
	mt_salindex108_temperatureitem_4_mean FLOAT,
	mt_salindex108_temperatureitem_4_stddev FLOAT,
	mt_salindex108_temperatureitem_4_min FLOAT,
	mt_salindex108_temperatureitem_4_max FLOAT,
	mt_salindex108_temperatureitem_5_mean FLOAT,
	mt_salindex108_temperatureitem_5_stddev FLOAT,
	mt_salindex108_temperatureitem_5_min FLOAT,
	mt_salindex108_temperatureitem_5_max FLOAT,
	mt_salindex108_temperatureitem_6_mean FLOAT,
	mt_salindex108_temperatureitem_6_stddev FLOAT,
	mt_salindex108_temperatureitem_6_min FLOAT,
	mt_salindex108_temperatureitem_6_max FLOAT,
	mt_salindex108_temperatureitem_7_mean FLOAT,
	mt_salindex108_temperatureitem_7_stddev FLOAT,
	mt_salindex108_temperatureitem_7_min FLOAT,
	mt_salindex108_temperatureitem_7_max FLOAT,
	mt_salindex301_temperatureitem_0_mean FLOAT,
	mt_salindex301_temperatureitem_0_stddev FLOAT,
	mt_salindex301_temperatureitem_0_min FLOAT,
	mt_salindex301_temperatureitem_1_mean FLOAT,
	mt_salindex301_temperatureitem_0_max FLOAT,
	mt_salindex301_temperatureitem_1_stddev FLOAT,
	mt_salindex301_temperatureitem_1_min FLOAT,
	mt_salindex301_temperatureitem_1_max FLOAT,
	mt_salindex301_temperatureitem_2_mean FLOAT,
	mt_salindex301_temperatureitem_2_stddev FLOAT,
	mt_salindex301_temperatureitem_2_min FLOAT,
	mt_salindex301_temperatureitem_2_max FLOAT,
	mt_salindex301_temperatureitem_3_mean FLOAT,
	mt_salindex301_temperatureitem_3_stddev FLOAT,
	mt_salindex301_temperatureitem_3_min FLOAT,
	mt_salindex301_temperatureitem_3_max FLOAT,
	mt_salindex301_temperatureitem_4_mean FLOAT,
	mt_salindex301_temperatureitem_4_stddev FLOAT,
	mt_salindex301_temperatureitem_4_min FLOAT,
	mt_salindex301_temperatureitem_4_max FLOAT,
	mt_salindex301_temperatureitem_5_mean FLOAT,
	mt_salindex301_temperatureitem_5_stddev FLOAT,
	mt_salindex301_temperatureitem_5_min FLOAT,
	mt_salindex301_temperatureitem_5_max FLOAT,
	mt_salindex301_temperatureitem_6_mean FLOAT,
	mt_salindex301_temperatureitem_6_stddev FLOAT,
	mt_salindex301_temperatureitem_6_min FLOAT,
	mt_salindex301_temperatureitem_6_max FLOAT,
	mt_salindex301_temperatureitem_7_mean FLOAT,
	mt_salindex301_temperatureitem_7_stddev FLOAT,
	mt_salindex301_temperatureitem_7_min FLOAT,
	mt_salindex301_temperatureitem_7_max FLOAT,
	mt_dimm_fwhm_mean FLOAT,
	mt_azimuth_encoder_absolute_position0_mean FLOAT,
	mt_azimuth_encoder_absolute_position1_mean FLOAT,
	mt_azimuth_encoder_absolute_position2_mean FLOAT,
	mt_azimuth_encoder_absolute_position3_mean FLOAT,
	mt_elevation_encoder_absolute_position0_mean FLOAT,
	mt_elevation_encoder_absolute_position1_mean FLOAT,
	mt_elevation_encoder_absolute_position2_mean FLOAT,
	mt_elevation_encoder_absolute_position3_mean FLOAT,
	mt_hexapod_uncompensated_position_u_mean FLOAT,
	mt_hexapod_uncompensated_position_u_max FLOAT,
	mt_hexapod_uncompensated_position_u_min FLOAT,
	mt_hexapod_uncompensated_position_v_mean FLOAT,
	mt_hexapod_uncompensated_position_v_max FLOAT,
	mt_hexapod_uncompensated_position_v_min FLOAT,
	mt_hexapod_uncompensated_position_w_mean FLOAT,
	mt_hexapod_uncompensated_position_w_max FLOAT,
	mt_hexapod_uncompensated_position_w_min FLOAT,
	mt_hexapod_uncompensated_position_x_mean FLOAT,
	mt_hexapod_uncompensated_position_x_max FLOAT,
	mt_hexapod_uncompensated_position_x_min FLOAT,
	mt_hexapod_uncompensated_position_y_mean FLOAT,
	mt_hexapod_uncompensated_position_y_max FLOAT,
	mt_hexapod_uncompensated_position_y_min FLOAT,
	mt_hexapod_uncompensated_position_z_mean FLOAT,
	mt_hexapod_uncompensated_position_z_max FLOAT,
	mt_hexapod_uncompensated_position_z_min FLOAT,
	mt_salindex104_acceleration_x_mean FLOAT,
	mt_salindex104_acceleration_x_stddev FLOAT,
	mt_salindex104_acceleration_x_min FLOAT,
	mt_salindex104_acceleration_x_max FLOAT,
	mt_salindey104_acceleration_y_mean FLOAT,
	mt_salindex104_acceleration_y_stddev FLOAT,
	mt_salindex104_acceleration_y_min FLOAT,
	mt_salindex104_acceleration_y_max FLOAT,
	mt_salindez104_acceleration_z_mean FLOAT,
	mt_salindex104_acceleration_z_stddev FLOAT,
	mt_salindex104_acceleration_z_min FLOAT,
	mt_salindex104_acceleration_z_max FLOAT,
	mt_pointing_mount_position_ra_mean FLOAT,
	mt_pointing_mount_position_ra_stddev FLOAT,
	mt_pointing_mount_position_dec_mean FLOAT,
	mt_pointing_mount_position_dec_stddev FLOAT,
	mt_pointing_mount_position_sky_angle_mean FLOAT,
	mt_pointing_mount_position_sky_angle_stddev FLOAT,
	mt_pointing_mount_position_rotator_mean FLOAT,
	mt_pointing_mount_position_rotator_stddev FLOAT,
	camera_hexapod_aos_corrections_u FLOAT,
	camera_hexapod_aos_corrections_v FLOAT,
	camera_hexapod_aos_corrections_w FLOAT,
	camera_hexapod_aos_corrections_x FLOAT,
	camera_hexapod_aos_corrections_y FLOAT,
	camera_hexapod_aos_corrections_z FLOAT,
	m2_hexapod_aos_corrections_u FLOAT,
	m2_hexapod_aos_corrections_v FLOAT,
	m2_hexapod_aos_corrections_w FLOAT,
	m2_hexapod_aos_corrections_x FLOAT,
	m2_hexapod_aos_corrections_y FLOAT,
	m2_hexapod_aos_corrections_z FLOAT,
	m2_stress FLOAT,
	m1m3_stress FLOAT,
	PRIMARY KEY (visit_id, instrument),
	CONSTRAINT un_visit_id_instrument UNIQUE (visit_id, instrument)
)

;

CREATE TABLE main.transformed_efd_scheduler (
	id INTEGER NOT NULL,
	start_time TIMESTAMP,
	end_time TIMESTAMP,
	status CHAR(20) DEFAULT 'pending',
	process_start_time TIMESTAMP,
	process_end_time TIMESTAMP,
	process_exec_time INTEGER DEFAULT 0,
	exposures INTEGER DEFAULT 0,
	visits1 INTEGER DEFAULT 0,
	retries INTEGER DEFAULT 0,
	error TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	CONSTRAINT un_id UNIQUE (id)
)

;