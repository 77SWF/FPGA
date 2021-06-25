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

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/susu/Documents/mygithub/FPGA/Counter_6bit_Scope/counter.v";
static unsigned int ng1[] = {63U, 0U};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {1U, 0U};



static void Always_11_0(char *t0)
{
    char t4[8];
    char t19[8];
    char t20[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;

LAB0:    t1 = (t0 + 1628U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(11, ng0);
    t2 = (t0 + 1968);
    *((int *)t2) = 1;
    t3 = (t0 + 1656);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(12, ng0);

LAB5:    xsi_set_current_line(13, ng0);
    t5 = (t0 + 784U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t5) == 0)
        goto LAB6;

LAB8:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB9:    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(19, ng0);

LAB27:    xsi_set_current_line(20, ng0);
    t2 = (t0 + 876U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t3 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t3);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB31;

LAB29:    if (*((unsigned int *)t2) == 0)
        goto LAB28;

LAB30:    t5 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t5) = 1;

LAB31:    t6 = (t4 + 4);
    t14 = *((unsigned int *)t6);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB32;

LAB33:    xsi_set_current_line(23, ng0);
    t2 = (t0 + 1104);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng3)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_minus(t4, 6, t5, 6, t6, 6);
    t12 = (t0 + 1104);
    xsi_vlogvar_wait_assign_value(t12, t4, 0, 0, 6, 0LL);

LAB34:
LAB12:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(14, ng0);

LAB13:    xsi_set_current_line(15, ng0);
    t21 = (t0 + 876U);
    t22 = *((char **)t21);
    memset(t20, 0, 8);
    t21 = (t22 + 4);
    t23 = *((unsigned int *)t21);
    t24 = (~(t23));
    t25 = *((unsigned int *)t22);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t21) != 0)
        goto LAB16;

LAB17:    t29 = (t20 + 4);
    t30 = *((unsigned int *)t20);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB18;

LAB19:    t34 = *((unsigned int *)t20);
    t35 = (~(t34));
    t36 = *((unsigned int *)t29);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB20;

LAB21:    if (*((unsigned int *)t29) > 0)
        goto LAB22;

LAB23:    if (*((unsigned int *)t20) > 0)
        goto LAB24;

LAB25:    memcpy(t19, t38, 8);

LAB26:    t39 = (t0 + 1104);
    xsi_vlogvar_wait_assign_value(t39, t19, 0, 0, 6, 0LL);
    goto LAB12;

LAB14:    *((unsigned int *)t20) = 1;
    goto LAB17;

LAB16:    t28 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB17;

LAB18:    t33 = ((char*)((ng1)));
    goto LAB19;

LAB20:    t38 = ((char*)((ng2)));
    goto LAB21;

LAB22:    xsi_vlog_unsigned_bit_combine(t19, 6, t33, 6, t38, 6);
    goto LAB26;

LAB24:    memcpy(t19, t33, 8);
    goto LAB26;

LAB28:    *((unsigned int *)t4) = 1;
    goto LAB31;

LAB32:    xsi_set_current_line(21, ng0);
    t12 = (t0 + 1104);
    t13 = (t12 + 36U);
    t21 = *((char **)t13);
    t22 = ((char*)((ng3)));
    memset(t19, 0, 8);
    xsi_vlog_unsigned_add(t19, 6, t21, 6, t22, 6);
    t28 = (t0 + 1104);
    xsi_vlogvar_wait_assign_value(t28, t19, 0, 0, 6, 0LL);
    goto LAB34;

}

static void Cont_27_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 1772U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 1104);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 2020);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 63U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 5);
    t18 = (t0 + 1976);
    *((int *)t18) = 1;

LAB1:    return;
}


extern void work_m_00000000001616267454_2582214024_init()
{
	static char *pe[] = {(void *)Always_11_0,(void *)Cont_27_1};
	xsi_register_didat("work_m_00000000001616267454_2582214024", "isim/tb_counter_scope_isim_beh.exe.sim/work/m_00000000001616267454_2582214024.didat");
	xsi_register_executes(pe);
}
