/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002647306871_3470456162_init();
    work_m_00000000001616267454_2582214024_init();
    work_m_00000000002113413425_1071307031_init();
    work_m_00000000003963189176_4189555657_init();
    work_m_00000000000237935281_1946334918_init();
    work_m_00000000003275940729_2607680013_init();
    work_m_00000000000644196004_2853511274_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000644196004_2853511274");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
