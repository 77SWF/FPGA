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
static const char *ng0 = "C:/Users/susu/Documents/mygithub/FPGA/Counter_6bit_Scope/clock_div7.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {3, 0};
static int ng3[] = {1, 0};
static int ng4[] = {6, 0};



static void Always_11_0(char *t0)
{
    char t4[8];
    char t25[8];
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
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;

LAB0:    t1 = (t0 + 1536U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(11, ng0);
    t2 = (t0 + 1732);
    *((int *)t2) = 1;
    t3 = (t0 + 1564);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(12, ng0);

LAB5:    xsi_set_current_line(13, ng0);
    t5 = (t0 + 692U);
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

LAB14:    xsi_set_current_line(21, ng0);
    t2 = (t0 + 1012);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t4, 0, 8);
    t12 = (t5 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB16;

LAB15:    t13 = (t6 + 4);
    if (*((unsigned int *)t13) != 0)
        goto LAB16;

LAB19:    if (*((unsigned int *)t5) < *((unsigned int *)t6))
        goto LAB17;

LAB18:    t20 = (t4 + 4);
    t7 = *((unsigned int *)t20);
    t8 = (~(t7));
    t9 = *((unsigned int *)t4);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB20;

LAB21:    xsi_set_current_line(23, ng0);
    t2 = (t0 + 1012);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t4, 0, 8);
    t12 = (t5 + 4);
    t13 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = *((unsigned int *)t6);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t12);
    t11 = *((unsigned int *)t13);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t12);
    t17 = *((unsigned int *)t13);
    t18 = (t16 | t17);
    t27 = (~(t18));
    t28 = (t15 & t27);
    if (t28 != 0)
        goto LAB26;

LAB23:    if (t18 != 0)
        goto LAB25;

LAB24:    *((unsigned int *)t4) = 1;

LAB26:    t20 = (t4 + 4);
    t29 = *((unsigned int *)t20);
    t30 = (~(t29));
    t31 = *((unsigned int *)t4);
    t32 = (t31 & t30);
    t33 = (t32 != 0);
    if (t33 > 0)
        goto LAB27;

LAB28:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 1012);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng4)));
    memset(t4, 0, 8);
    t12 = (t5 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB38;

LAB37:    t13 = (t6 + 4);
    if (*((unsigned int *)t13) != 0)
        goto LAB38;

LAB41:    if (*((unsigned int *)t5) < *((unsigned int *)t6))
        goto LAB39;

LAB40:    t20 = (t4 + 4);
    t7 = *((unsigned int *)t20);
    t8 = (~(t7));
    t9 = *((unsigned int *)t4);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB42;

LAB43:    xsi_set_current_line(32, ng0);

LAB45:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 920);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t5 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB49;

LAB47:    if (*((unsigned int *)t6) == 0)
        goto LAB46;

LAB48:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB49:    t13 = (t4 + 4);
    t19 = (t5 + 4);
    t14 = *((unsigned int *)t5);
    t15 = (~(t14));
    *((unsigned int *)t4) = t15;
    *((unsigned int *)t13) = 0;
    if (*((unsigned int *)t19) != 0)
        goto LAB51;

LAB50:    t28 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t28 & 1U);
    t29 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t29 & 1U);
    t20 = (t0 + 920);
    xsi_vlogvar_wait_assign_value(t20, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(34, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1012);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);

LAB44:
LAB29:
LAB22:
LAB12:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(14, ng0);

LAB13:    xsi_set_current_line(15, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 1012);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 3, 0LL);
    xsi_set_current_line(16, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 920);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB12;

LAB16:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB18;

LAB17:    *((unsigned int *)t4) = 1;
    goto LAB18;

LAB20:    xsi_set_current_line(22, ng0);
    t21 = (t0 + 1012);
    t22 = (t21 + 36U);
    t23 = *((char **)t22);
    t24 = ((char*)((ng3)));
    memset(t25, 0, 8);
    xsi_vlog_unsigned_add(t25, 32, t23, 3, t24, 32);
    t26 = (t0 + 1012);
    xsi_vlogvar_wait_assign_value(t26, t25, 0, 0, 3, 0LL);
    goto LAB22;

LAB25:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB26;

LAB27:    xsi_set_current_line(24, ng0);

LAB30:    xsi_set_current_line(25, ng0);
    t21 = (t0 + 920);
    t22 = (t21 + 36U);
    t23 = *((char **)t22);
    memset(t25, 0, 8);
    t24 = (t23 + 4);
    t34 = *((unsigned int *)t24);
    t35 = (~(t34));
    t36 = *((unsigned int *)t23);
    t37 = (t36 & t35);
    t38 = (t37 & 1U);
    if (t38 != 0)
        goto LAB34;

LAB32:    if (*((unsigned int *)t24) == 0)
        goto LAB31;

LAB33:    t26 = (t25 + 4);
    *((unsigned int *)t25) = 1;
    *((unsigned int *)t26) = 1;

LAB34:    t39 = (t25 + 4);
    t40 = (t23 + 4);
    t41 = *((unsigned int *)t23);
    t42 = (~(t41));
    *((unsigned int *)t25) = t42;
    *((unsigned int *)t39) = 0;
    if (*((unsigned int *)t40) != 0)
        goto LAB36;

LAB35:    t47 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t47 & 1U);
    t48 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t48 & 1U);
    t49 = (t0 + 920);
    xsi_vlogvar_wait_assign_value(t49, t25, 0, 0, 1, 0LL);
    xsi_set_current_line(26, ng0);
    t2 = (t0 + 1012);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng3)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 32, t5, 3, t6, 32);
    t12 = (t0 + 1012);
    xsi_vlogvar_wait_assign_value(t12, t4, 0, 0, 3, 0LL);
    goto LAB29;

LAB31:    *((unsigned int *)t25) = 1;
    goto LAB34;

LAB36:    t43 = *((unsigned int *)t25);
    t44 = *((unsigned int *)t40);
    *((unsigned int *)t25) = (t43 | t44);
    t45 = *((unsigned int *)t39);
    t46 = *((unsigned int *)t40);
    *((unsigned int *)t39) = (t45 | t46);
    goto LAB35;

LAB38:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB40;

LAB39:    *((unsigned int *)t4) = 1;
    goto LAB40;

LAB42:    xsi_set_current_line(30, ng0);
    t21 = (t0 + 1012);
    t22 = (t21 + 36U);
    t23 = *((char **)t22);
    t24 = ((char*)((ng3)));
    memset(t25, 0, 8);
    xsi_vlog_unsigned_add(t25, 32, t23, 3, t24, 32);
    t26 = (t0 + 1012);
    xsi_vlogvar_wait_assign_value(t26, t25, 0, 0, 3, 0LL);
    goto LAB44;

LAB46:    *((unsigned int *)t4) = 1;
    goto LAB49;

LAB51:    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t19);
    *((unsigned int *)t4) = (t16 | t17);
    t18 = *((unsigned int *)t13);
    t27 = *((unsigned int *)t19);
    *((unsigned int *)t13) = (t18 | t27);
    goto LAB50;

}


extern void work_m_00000000002647306871_3470456162_init()
{
	static char *pe[] = {(void *)Always_11_0};
	xsi_register_didat("work_m_00000000002647306871_3470456162", "isim/tb_counter_scope_isim_beh.exe.sim/work/m_00000000002647306871_3470456162.didat");
	xsi_register_executes(pe);
}
