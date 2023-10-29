assign reg_write_payld = '{
                             sync_epoch     : mmu_700_tmu_twb_wmb_pkg::sync_epoch_t'('0),
                             inv_epoch      : mmu_700_tmu_twb_wmb_pkg::inv_epoch_t'('0),
                             do_not_cache   : mmu_700_dti_2v0_pkg::DNC_MUST_NOT_BE_CACHED,
                             rsp_activities : DRA_NON_RESPONSE,
                             id             : ptw_slot_id_t'('0),
                             msg : '{
                                     msg : reg_write_msg,
                                     tid : {$clog2(TCUCFG_NUM_TBU){1'b0}},
                                     monitor_txn : mmu_700_tmu_twb_pkg::MONITOR_TXN_IGNORED,
                                     stall_response_sent : 1'b0,
                                     prefetch : mmu_700_tmu_twb_pkg::PREFETCH_DISABLED,
                                     transl_data : mmu_700_tmu_twb_pkg::wmb_tmb_res_t'('0)
                                     }
                             };
