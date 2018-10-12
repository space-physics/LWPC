cmake_minimum_required (VERSION 3.7)
project(LWPC Fortran C)
enable_testing()

include_directories(../include)

add_library(lwpc 
almnac.for a_over_b.for a_plus_b.for a_xfer_b.for 
clineq.for 
# close_fordrive.for 
decode_a_noise.for decode_control_data.for decode_date.for decode_file_name.for decode_ionosphere.for decode_list_flt.for decode_list_int.for decode_list_str.for decode_map_area.for decode_op_area.for decode_plotter.for decode_rx_data.for decode_time.for decode_tx_data.for 
erfc.for 
flush_unit.for 
gcdbr2.for gcdbr.for 
geo_border.for geo_cgm.for geo_chi_map.for geo_cntr.for geo_coast_map.for geo_cond_map.for geo_coord.for geo_defs.for geo_dip_map.for geo_label.for geo_opa_border.for geo_path_radials.for geo_qoval_map.for geo_terminator.for 
get_command_line.for get_date.for get_delimiter.for get_map.for get_opa.for get_random.for get_time.for get_xmtr.for 
grf_begin.for grf_border.for grf_cntr_cell.for grf_cntr_col.for grf_cntr_edge.for grf_cntr_fill.for grf_cntr_flag.for grf_cntr.for grf_cntr_holes.for grf_cntr_join.for grf_cntr_line.for grf_cntr_row.for grf_cntr_search.for grf_cntr_trace.for grf_color.for grf_curve.for grf_done.for grf_draw.for grf_fill_index.for grf_fill_rect.for grf_limits.for grf_move.for grf_number.for grf_origin.for grf_poly_fill.for grf_string.for grf_symbol.for 
ground.for 
hpgl_begin.for hpgl_color.for hpgl_done.for hpgl_draw.for hpgl_fill_rect.for hpgl_poly_fill.for hpgl_string.for 
hrs_to_hhmm.for 
land_sea.for leap_year.for 
lw_fast_mc.for lw_full_mc.for lw_htgain.for 
lwpc_dat_loc.for lwpc_error.for 
lwp_driver.for 
lwp_eof_mds.for lwp_get_brng.for lwp_input.for lwp_path.for lwp_preseg.for lwp_save_mc.for lwp_set_brng.for lwp_to_edge.for 
lw_read_mds.for lw_step.for lw_sum_modes.for lw_vs_d.for 
mc_p_integ.for 
mf_bndrys.for mf_brncpt.for mf_cheklg.for mf_driver.for mf_emtrx.for mf_fctval.for mf_fdfdt.for mf_final.for mf_finllg.for mf_fsintg.for mf_fzeros.for mf_get_mc.for mf_initev.for mf_initlg.for mf_initoe.for mf_initr.for mf_integ.for mf_introe.for mf_lagrng.for mf_lgtori.for mf_mdhnkl.for mf_quartc.for mf_rbars.for mf_rderiv.for mf_rmtrx.for mf_roemtx.for mf_smtrx.for mf_subdiv.for mf_tmtrx.for mf_todlgs.for mf_wgsort.for mf_which.for mf_wvgd.for mf_xderiv.for mf_xfer.for 
month_name.for month_number.for 
newmag.for noise_itsn.for noise_ntia.for 
opa_interpolate.for opa_noise_grid.for opa_read_lwf.for opa_set_up_grid.for opa_signal_grid.for 
open_dat.for 
plt_area_size.for plt_cntr.for plt_cntr_label.for plt_cntr_n.for plt_cntr_range.for plt_cntr_s.for plt_cntr_si.for plt_cntr_sj.for plt_cntr_sn.for plt_excd.for plt_joint_cntr.for plt_lnp_to_grd.for plt_lwf_avg.for plt_lwf_border.for plt_lwf.for plt_lwf_label.for plt_map_indices.for plt_read_noise.for plt_read_signal.for plt_rx_model.for 
prfl_chi_exp.for prfl_chi_tbl.for prfl_ennu.for prfl_exp.for prfl_gtbl.for prfl_hgts.for prfl_htbl.for prfl_init_table.for prfl_lwpm.for prfl_read_table.for prfl_rexp.for prfl_rtbl.for prfl_specification.for 
prob_to_sigma.for 
read_c_grd.for read_grd.for read_hdr.for read_lwf.for read_mds.for 
recvr2.for 
set_file_id.for shift_array2.for shift_array.for sortr.for spline2.for spline3.for str_count_list.for str_format_range.for str_get_item.for str_length.for str_lower.for str_trim_char.for str_upper.for 
sw_drvequ.for sw_extrap.for sw_fctval.for sw_initlr.for sw_integ.for sw_iterat.for sw_next.for sw_quartc.for sw_rbars.for sw_rplynm.for sw_smatrx.for sw_step.for sw_uspoly.for sw_wvgd.for sw_xsave.for 
wf_bndy.for wf_driver.for wf_f_fnctn.for wf_htgain.for wf_init.for wf_integ.for wf_itrate.for wf_load.for wf_ma2.for wf_p_deriv.for wf_quartc.for wf_rbars.for wf_r_mtrx.for wf_scale.for wf_step.for wf_store.for wf_ti_mtrx.for wf_t_mtrx.for wf_xfer.for 
world_map.for 
write_grd.for write_hdr.for write_lwf.for write_mds.for 
xc_add.for xc_mdhnkl.for xc_norme.for 
xlineq.for
)

target_compile_options(lwpc PRIVATE 
                      -std=legacy
                      -fdollar-ok  # lwpc_geo.cmn
                      -fdec-structure  # geo_coast_map.for
                      -fno-align-commons
                      -fno-range-check # grf_cntr_flag.for
                      )

