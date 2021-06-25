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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/susu/Documents/mygithub/FPGA/Control_LED/debounce.v";
static int ng1[] = {2, 0};
static int ng2[] = {0, 0};
static int ng3[] = {3, 0};
static unsigned int ng4[] = {0U, 0U};
static unsigned int ng5[] = {1U, 0U};



static void Always_26_0(char *t0)
{
    char t4[8];
    char t17[8];
    char t18[8];
    char t19[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    int t27;
    char *t28;
    unsigned int t29;
    int t30;
    int t31;
    char *t32;
    unsigned int t33;
    int t34;
    int t35;
    unsigned int t36;
    int t37;
    unsigned int t38;
    unsigned int t39;
    int t40;
    int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;

LAB0:    t1 = (t0 + 2688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 3008);
    *((int *)t2) = 1;
    t3 = (t0 + 2720);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(27, ng0);

LAB5:    xsi_set_current_line(28, ng0);
    t5 = (t0 + 1768);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t4, 0, 8);
    t8 = (t4 + 4);
    t9 = (t7 + 4);
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 1);
    *((unsigned int *)t4) = t11;
    t12 = *((unsigned int *)t9);
    t13 = (t12 >> 1);
    *((unsigned int *)t8) = t13;
    t14 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t14 & 7U);
    t15 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t15 & 7U);
    t16 = (t0 + 1768);
    t20 = (t0 + 1768);
    t21 = (t20 + 72U);
    t22 = *((char **)t21);
    t23 = ((char*)((ng1)));
    t24 = ((char*)((ng2)));
    xsi_vlog_convert_partindices(t17, t18, t19, ((int*)(t22)), 2, t23, 32, 1, t24, 32, 1);
    t25 = (t17 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (!(t26));
    t28 = (t18 + 4);
    t29 = *((unsigned int *)t28);
    t30 = (!(t29));
    t31 = (t27 && t30);
    t32 = (t19 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (!(t33));
    t35 = (t31 && t34);
    if (t35 == 1)
        goto LAB6;

LAB7:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = (t0 + 1768);
    t5 = (t0 + 1768);
    t6 = (t5 + 72U);
    t7 = *((char **)t6);
    t8 = ((char*)((ng3)));
    xsi_vlog_generic_convert_bit_index(t4, t7, 2, t8, 32, 1);
    t9 = (t4 + 4);
    t10 = *((unsigned int *)t9);
    t27 = (!(t10));
    if (t27 == 1)
        goto LAB8;

LAB9:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng4)));
    memset(t4, 0, 8);
    t7 = (t5 + 4);
    t8 = (t6 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t7);
    t14 = *((unsigned int *)t8);
    t15 = (t13 ^ t14);
    t26 = (t12 | t15);
    t29 = *((unsigned int *)t7);
    t33 = *((unsigned int *)t8);
    t36 = (t29 | t33);
    t38 = (~(t36));
    t39 = (t26 & t38);
    if (t39 != 0)
        goto LAB13;

LAB10:    if (t36 != 0)
        goto LAB12;

LAB11:    *((unsigned int *)t4) = 1;

LAB13:    t16 = (t4 + 4);
    t42 = *((unsigned int *)t16);
    t43 = (~(t42));
    t44 = *((unsigned int *)t4);
    t45 = (t44 & t43);
    t46 = (t45 != 0);
    if (t46 > 0)
        goto LAB14;

LAB15:    xsi_set_current_line(33, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB16:    goto LAB2;

LAB6:    t36 = *((unsigned int *)t19);
    t37 = (t36 + 0);
    t38 = *((unsigned int *)t17);
    t39 = *((unsigned int *)t18);
    t40 = (t38 - t39);
    t41 = (t40 + 1);
    xsi_vlogvar_wait_assign_value(t16, t4, t37, *((unsigned int *)t18), t41, 0LL);
    goto LAB7;

LAB8:    xsi_vlogvar_wait_assign_value(t2, t3, 0, *((unsigned int *)t4), 1, 0LL);
    goto LAB9;

LAB12:    t9 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB13;

LAB14:    xsi_set_current_line(32, ng0);
    t20 = ((char*)((ng4)));
    t21 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t21, t20, 0, 0, 1, 0LL);
    goto LAB16;

}


extern void work_m_00000000000167491419_1832158028_init()
{
	static char *pe[] = {(void *)Always_26_0};
	xsi_register_didat("work_m_00000000000167491419_1832158028", "isim/tb_Control_LED_isim_beh.exe.sim/work/m_00000000000167491419_1832158028.didat");
	xsi_register_executes(pe);
}
