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
static const char *ng0 = "C:/Users/susu/Documents/mygithub/FPGA/SwitchLED/SwitcLED.v";
static int ng1[] = {0, 0};
static int ng2[] = {7, 0};
static int ng3[] = {1, 0};
static int ng4[] = {6, 0};
static int ng5[] = {2, 0};
static int ng6[] = {5, 0};
static int ng7[] = {3, 0};
static int ng8[] = {4, 0};



static void Always_27_0(char *t0)
{
    char t4[8];
    char t7[8];
    char t17[8];
    char t26[8];
    char t35[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    unsigned int t32;
    int t33;
    char *t34;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    unsigned int t41;
    int t42;

LAB0:    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 3096);
    *((int *)t2) = 1;
    t3 = (t0 + 2560);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(27, ng0);

LAB5:    xsi_set_current_line(28, ng0);
    t5 = (t0 + 1208U);
    t6 = *((char **)t5);
    memset(t7, 0, 8);
    t5 = (t7 + 4);
    t8 = (t6 + 4);
    t9 = *((unsigned int *)t6);
    t10 = (t9 >> 0);
    t11 = (t10 & 1);
    *((unsigned int *)t7) = t11;
    t12 = *((unsigned int *)t8);
    t13 = (t12 >> 0);
    t14 = (t13 & 1);
    *((unsigned int *)t5) = t14;
    t15 = (t0 + 1208U);
    t16 = *((char **)t15);
    memset(t17, 0, 8);
    t15 = (t17 + 4);
    t18 = (t16 + 4);
    t19 = *((unsigned int *)t16);
    t20 = (t19 >> 0);
    t21 = (t20 & 1);
    *((unsigned int *)t17) = t21;
    t22 = *((unsigned int *)t18);
    t23 = (t22 >> 0);
    t24 = (t23 & 1);
    *((unsigned int *)t15) = t24;
    xsi_vlogtype_concat(t4, 2, 2, 2U, t17, 1, t7, 1);
    t25 = (t0 + 1608);
    t27 = (t0 + 1608);
    t28 = (t27 + 72U);
    t29 = *((char **)t28);
    t30 = ((char*)((ng1)));
    xsi_vlog_generic_convert_bit_index(t26, t29, 2, t30, 32, 1);
    t31 = (t26 + 4);
    t32 = *((unsigned int *)t31);
    t33 = (!(t32));
    if (t33 == 1)
        goto LAB6;

LAB7:    t34 = (t0 + 1608);
    t36 = (t0 + 1608);
    t37 = (t36 + 72U);
    t38 = *((char **)t37);
    t39 = ((char*)((ng2)));
    xsi_vlog_generic_convert_bit_index(t35, t38, 2, t39, 32, 1);
    t40 = (t35 + 4);
    t41 = *((unsigned int *)t40);
    t42 = (!(t41));
    if (t42 == 1)
        goto LAB8;

LAB9:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t7, 0, 8);
    t2 = (t7 + 4);
    t5 = (t3 + 4);
    t9 = *((unsigned int *)t3);
    t10 = (t9 >> 1);
    t11 = (t10 & 1);
    *((unsigned int *)t7) = t11;
    t12 = *((unsigned int *)t5);
    t13 = (t12 >> 1);
    t14 = (t13 & 1);
    *((unsigned int *)t2) = t14;
    t6 = (t0 + 1208U);
    t8 = *((char **)t6);
    memset(t17, 0, 8);
    t6 = (t17 + 4);
    t15 = (t8 + 4);
    t19 = *((unsigned int *)t8);
    t20 = (t19 >> 1);
    t21 = (t20 & 1);
    *((unsigned int *)t17) = t21;
    t22 = *((unsigned int *)t15);
    t23 = (t22 >> 1);
    t24 = (t23 & 1);
    *((unsigned int *)t6) = t24;
    xsi_vlogtype_concat(t4, 2, 2, 2U, t17, 1, t7, 1);
    t16 = (t0 + 1608);
    t18 = (t0 + 1608);
    t25 = (t18 + 72U);
    t27 = *((char **)t25);
    t28 = ((char*)((ng3)));
    xsi_vlog_generic_convert_bit_index(t26, t27, 2, t28, 32, 1);
    t29 = (t26 + 4);
    t32 = *((unsigned int *)t29);
    t33 = (!(t32));
    if (t33 == 1)
        goto LAB10;

LAB11:    t30 = (t0 + 1608);
    t31 = (t0 + 1608);
    t34 = (t31 + 72U);
    t36 = *((char **)t34);
    t37 = ((char*)((ng4)));
    xsi_vlog_generic_convert_bit_index(t35, t36, 2, t37, 32, 1);
    t38 = (t35 + 4);
    t41 = *((unsigned int *)t38);
    t42 = (!(t41));
    if (t42 == 1)
        goto LAB12;

LAB13:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t7, 0, 8);
    t2 = (t7 + 4);
    t5 = (t3 + 4);
    t9 = *((unsigned int *)t3);
    t10 = (t9 >> 2);
    t11 = (t10 & 1);
    *((unsigned int *)t7) = t11;
    t12 = *((unsigned int *)t5);
    t13 = (t12 >> 2);
    t14 = (t13 & 1);
    *((unsigned int *)t2) = t14;
    t6 = (t0 + 1208U);
    t8 = *((char **)t6);
    memset(t17, 0, 8);
    t6 = (t17 + 4);
    t15 = (t8 + 4);
    t19 = *((unsigned int *)t8);
    t20 = (t19 >> 2);
    t21 = (t20 & 1);
    *((unsigned int *)t17) = t21;
    t22 = *((unsigned int *)t15);
    t23 = (t22 >> 2);
    t24 = (t23 & 1);
    *((unsigned int *)t6) = t24;
    xsi_vlogtype_concat(t4, 2, 2, 2U, t17, 1, t7, 1);
    t16 = (t0 + 1608);
    t18 = (t0 + 1608);
    t25 = (t18 + 72U);
    t27 = *((char **)t25);
    t28 = ((char*)((ng5)));
    xsi_vlog_generic_convert_bit_index(t26, t27, 2, t28, 32, 1);
    t29 = (t26 + 4);
    t32 = *((unsigned int *)t29);
    t33 = (!(t32));
    if (t33 == 1)
        goto LAB14;

LAB15:    t30 = (t0 + 1608);
    t31 = (t0 + 1608);
    t34 = (t31 + 72U);
    t36 = *((char **)t34);
    t37 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t35, t36, 2, t37, 32, 1);
    t38 = (t35 + 4);
    t41 = *((unsigned int *)t38);
    t42 = (!(t41));
    if (t42 == 1)
        goto LAB16;

LAB17:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t7, 0, 8);
    t2 = (t7 + 4);
    t5 = (t3 + 4);
    t9 = *((unsigned int *)t3);
    t10 = (t9 >> 3);
    t11 = (t10 & 1);
    *((unsigned int *)t7) = t11;
    t12 = *((unsigned int *)t5);
    t13 = (t12 >> 3);
    t14 = (t13 & 1);
    *((unsigned int *)t2) = t14;
    t6 = (t0 + 1208U);
    t8 = *((char **)t6);
    memset(t17, 0, 8);
    t6 = (t17 + 4);
    t15 = (t8 + 4);
    t19 = *((unsigned int *)t8);
    t20 = (t19 >> 3);
    t21 = (t20 & 1);
    *((unsigned int *)t17) = t21;
    t22 = *((unsigned int *)t15);
    t23 = (t22 >> 3);
    t24 = (t23 & 1);
    *((unsigned int *)t6) = t24;
    xsi_vlogtype_concat(t4, 2, 2, 2U, t17, 1, t7, 1);
    t16 = (t0 + 1608);
    t18 = (t0 + 1608);
    t25 = (t18 + 72U);
    t27 = *((char **)t25);
    t28 = ((char*)((ng7)));
    xsi_vlog_generic_convert_bit_index(t26, t27, 2, t28, 32, 1);
    t29 = (t26 + 4);
    t32 = *((unsigned int *)t29);
    t33 = (!(t32));
    if (t33 == 1)
        goto LAB18;

LAB19:    t30 = (t0 + 1608);
    t31 = (t0 + 1608);
    t34 = (t31 + 72U);
    t36 = *((char **)t34);
    t37 = ((char*)((ng8)));
    xsi_vlog_generic_convert_bit_index(t35, t36, 2, t37, 32, 1);
    t38 = (t35 + 4);
    t41 = *((unsigned int *)t38);
    t42 = (!(t41));
    if (t42 == 1)
        goto LAB20;

LAB21:    goto LAB2;

LAB6:    xsi_vlogvar_assign_value(t25, t4, 0, *((unsigned int *)t26), 1);
    goto LAB7;

LAB8:    xsi_vlogvar_assign_value(t34, t4, 1, *((unsigned int *)t35), 1);
    goto LAB9;

LAB10:    xsi_vlogvar_assign_value(t16, t4, 0, *((unsigned int *)t26), 1);
    goto LAB11;

LAB12:    xsi_vlogvar_assign_value(t30, t4, 1, *((unsigned int *)t35), 1);
    goto LAB13;

LAB14:    xsi_vlogvar_assign_value(t16, t4, 0, *((unsigned int *)t26), 1);
    goto LAB15;

LAB16:    xsi_vlogvar_assign_value(t30, t4, 1, *((unsigned int *)t35), 1);
    goto LAB17;

LAB18:    xsi_vlogvar_assign_value(t16, t4, 0, *((unsigned int *)t26), 1);
    goto LAB19;

LAB20:    xsi_vlogvar_assign_value(t30, t4, 1, *((unsigned int *)t35), 1);
    goto LAB21;

}

static void Cont_34_1(char *t0)
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

LAB0:    t1 = (t0 + 2776U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 1608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3192);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 255U;
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
    xsi_driver_vfirst_trans(t5, 0, 7);
    t18 = (t0 + 3112);
    *((int *)t18) = 1;

LAB1:    return;
}


extern void work_m_00000000001097653075_2928020264_init()
{
	static char *pe[] = {(void *)Always_27_0,(void *)Cont_34_1};
	xsi_register_didat("work_m_00000000001097653075_2928020264", "isim/tb_SwitchLED_isim_beh.exe.sim/work/m_00000000001097653075_2928020264.didat");
	xsi_register_executes(pe);
}
