typedef struct packed {
    logic                   eladisable;
    logic [ 1:0]            mpmmstate0;
    logic                   mpmmem;
    logic [ 7:0]            clusteridaff3;
    logic [ 7:0]            clusteridaff2;
    logic                   cfgend;
    logic [47:2]            rvbaraddr;
} cpu_cfg_core_s;
